package com.h4j.ITtranet.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.model.vo.Reply;
import com.h4j.ITtranet.common.template.Pagination;
import com.h4j.ITtranet.notice.model.service.NoticeService;
import com.h4j.ITtranet.notice.model.vo.Notice;
import com.h4j.ITtranet.notice.model.vo.NoticeHeader;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	// 게시글 전체 페이지 조회
	@RequestMapping("list.no")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Notice> list = nService.selectList(pi);
		ArrayList<NoticeHeader> headerList = nService.selectHeaderList();
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("headerList", headerList);
		mv.setViewName("notice/noticeListView");
		
		
		return mv;
	}
	
	// 게시글 상세 조회
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {
		
		int result = nService.increaseCount(nno);
		
		if(result > 0) {
			
			Notice n = nService.selectNotice(nno);
			ArrayList<Attachment> atList = nService.selectAttachment(nno);
			mv.addObject("n", n);
			mv.addObject("atList", atList);
			mv.setViewName("notice/noticeDetailView");
			
		}else {
			
			mv.addObject("errorMsg", "페이지 조회 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	// 게시글 작성페이지로 이동
	@RequestMapping("insertForm.no")
	public String insertForm(Model model) {
		ArrayList<NoticeHeader> headerList = nService.selectHeaderList();
		model.addAttribute("headerList", headerList);
		return "notice/noticeInsertView";
	}
	// 게시글 작성하기
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, NoticeHeader h, Attachment at, MultipartFile[] upfile, HttpSession session, Model model) {
				
		int result = nService.insertNotice(n);
		int resultAt = 1;
		
		if(!upfile[0].getOriginalFilename().equals("")) {			
			
			for(MultipartFile file : upfile) {
				
				String changeName = saveFile(file, session);
				String filePath = session.getServletContext().getRealPath("/resources/uploadFiles");
				at.setOriginName(file.getOriginalFilename());
				at.setChangeName("resources/uploadFiles/" + changeName);
				//at.setFilePath(filePath);
				
				resultAt = nService.insertAttachment(at);				
			}			
		}
		if(result * resultAt > 0) {
			session.setAttribute("alertMsg", "게시글이 성공적으로 등록되었습니다.");
			return "redirect:list.no";
		}else {
			model.addAttribute("errorMsg", "게시글 등록실패");
			return "common/error";
		}
	}
	
	// 게시글 삭제
	@RequestMapping("delete.no")
	public String delectBoard(int nno, String filePath, HttpSession session, Model model) {
		
		int result = nService.deleteNotice(nno);
		int resultAt = 1;
		ArrayList<Attachment> atList = new ArrayList<Attachment>();
		atList = nService.selectAttachment(nno);
		if(result > 0) {	

			for(int i=0; i<atList.size(); i++) {
				int atNo = atList.get(i).getAttachmentNo();
				resultAt = nService.deleteAttachment(atNo);
			}
			
			
			session.setAttribute("alertMsg", "게시글이 성공적으로 삭제되었습니다.");
			return "redirect:list.no";
		}else {
			return "common/error";
		}
	}
	
	// 게시글 수정 페이지로 이동
	@RequestMapping("updateForm.no")
	public String updateForm(int nno, Model model) {
		model.addAttribute("n", nService.selectNotice(nno));
		model.addAttribute("headerList", nService.selectHeaderList());
		model.addAttribute("atList", nService.selectAttachment(nno));
		return "notice/noticeUpdateForm";
	}
	// 게시글 수정하기
	@RequestMapping("update.no")
	public String updateNotice(int noticeNo, Notice n, Attachment at, @RequestParam(value="fileNoDel[]") String[] delFiles, MultipartFile[] reupfile, HttpSession session, Model model) {

		
		int result = nService.updateNotice(n);
		int resultAt = 1;
		
		//삭제된 파일 db에서 지워주기
		if(delFiles.length > 0) {
			int atNo = 0;
			for(int i=0; i<delFiles.length; i++) {
				atNo = Integer.valueOf(delFiles[i]);
				resultAt = nService.deleteAttachment(atNo);
			}
			
		}
		
		// 새로 업데이트 된 첨부파일 db등록하기
		if(!reupfile[0].getOriginalFilename().equals("")) {			
			
			for(MultipartFile file : reupfile) {
				
				String changeName = saveFile(file, session);
				String filePath = session.getServletContext().getRealPath("/resources/uploadFiles");
				at.setOriginName(file.getOriginalFilename());
				at.setChangeName("resources/uploadFiles/" + changeName);
				//at.setFilePath(filePath);
				at.setNoticeNo(noticeNo);
				resultAt = nService.insertNewAttachment(at);				
			}	
			
		}

		if(result + resultAt > 0) {
			session.setAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다.");
			return "redirect:detail.no?nno=" + noticeNo;
		}else {
			return "common/error";
		}
	}
	
	// 첨부파일 폴더에 저장시키기	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	// 댓글 가져오기
	@ResponseBody
	@RequestMapping(value="rlist.no", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int nno) {
		ArrayList<Reply> list = nService.selectReplyList(nno);
		
		return new Gson().toJson(list);
	}
	
	// 댓글 입력하기
	@ResponseBody
	@RequestMapping(value="rinsert.no")
	public String ajaxInsertReply(Reply r) {
		int result = nService.insertReply(r);
		return result>0? "success" : "fail";
	}
	
	// 댓글 삭제하기
	@ResponseBody
	@RequestMapping(value="rdelete.no")
	public String ajaxDeleteReply(int replyNo) {
		int result = nService.deleteReply(replyNo);
		return result>0? "success" : "fail";				
	}
	
	// 댓글 수정하기
	@ResponseBody
	@RequestMapping(value="rupdate.no")
	public String ajaxUpdateReply(Reply r) {
		int result = nService.updateReply(r);
		return result>0? "success" : "fail";	
	}
	
	// 게시글 검색하기
	@ResponseBody
	@RequestMapping(value="search.no", produces="application/json; charset=utf-8")
	public String ajaxSearchBoard(Notice n) {
		ArrayList<Notice> list = nService.searchNoticeList(n);
		return new Gson().toJson(list);
	}
	
	// 최신글 조회
	@ResponseBody
	@RequestMapping(value="newList.no", produces="application/json; charset=utf-8")
	public String ajaxNewBoardList() {
		ArrayList<Notice> list = nService.selectNewNoticeList();
		//System.out.println(list);
		return new Gson().toJson(list);
	}
	
	
	
	
	
	
	
}
