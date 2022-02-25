package com.h4j.ITtranet.board.controller;

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
import com.h4j.ITtranet.board.model.service.BoardService;
import com.h4j.ITtranet.board.model.vo.Board;
import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.model.vo.Reply;
import com.h4j.ITtranet.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	// 게시글 전체 페이지 조회
	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectList(pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("board/boardListView");
		
		
		return mv;
	}
	
	// 게시글 상세 조회
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		
		int result = bService.increaseCount(bno);
		
		if(result > 0) {
			
			Board b = bService.SelectBoard(bno);
			ArrayList<Attachment> atList = bService.selectAttachment(bno);
			mv.addObject("b", b);
			mv.addObject("atList", atList);
			mv.setViewName("board/boardDetailView");
			
		}else {
			
			mv.addObject("errorMsg", "페이지 조회 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	// 게시글 작성페이지로 이동
	@RequestMapping("insertForm.bo")
	public String insertForm() {
		return "board/boardInsertView";
	}
	// 게시글 작성하기
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, Attachment at, MultipartFile[] upfile, HttpSession session, Model model) {
				
		int result = bService.insertBoard(b);
		int resultAt = 1;
		
		if(!upfile[0].getOriginalFilename().equals("")) {			
			
			for(MultipartFile file : upfile) {
				
				String changeName = saveFile(file, session);
				at.setOriginName(file.getOriginalFilename());
				at.setChangeName(changeName);
				at.setFilePath("resources/uploadFiles/" + changeName);
				
				resultAt = bService.insertAttachment(at);				
			}			
		}
		
		if(result * resultAt > 0) {
			session.setAttribute("alertMsg", "게시글이 성공적으로 등록되었습니다.");
			return "redirect:list.bo";
		}else {
			model.addAttribute("errorMsg", "게시글 등록실패");
			return "common/error";
		}
	}
	
	// 게시글 삭제
	@RequestMapping("delete.bo")
	public String delectBoard(int bno, String filePath, HttpSession session, Model model) {
		
		int result = bService.deleteBoard(bno);
		int resultAt = 1;
		ArrayList<Attachment> atList = new ArrayList<Attachment>();
		atList = bService.selectAttachment(bno);
		if(result > 0) {	

			for(int i=0; i<atList.size(); i++) {
				int atNo = atList.get(i).getAttachmentNo();
				resultAt = bService.deleteAttachment(atNo);
			}
			
			
			session.setAttribute("alertMsg", "게시글이 성공적으로 삭제되었습니다.");
						
			return "redirect:list.bo";
			
		}else {
			return "common/error";
		}
	}
	
	// 게시글 수정 페이지로 이동
	@RequestMapping("updateForm.bo")
	public String updateForm(int bno, String admin, Model model) {
		model.addAttribute("b", bService.SelectBoard(bno));
		model.addAttribute("atList", bService.selectAttachment(bno));
		if(admin.equals("Y")) {
			return "board/adminBoardUpdateForm";
		}else {
			
			return "board/boardUpdateForm";
		}
	}
	// 게시글 수정하기
	@RequestMapping("update.bo")
	public String updateBoard(int boardNo, String admin, Board b, Attachment at, @RequestParam(value="fileNoDel[]") String[] delFiles, MultipartFile[] reupfile, HttpSession session, Model model) {

		
		int result = bService.updateBoard(b);
		int resultAt = 1;
		
		//삭제된 파일 db에서 지워주기
		if(delFiles.length > 0) {
			int atNo = 0;
			for(int i=0; i<delFiles.length; i++) {
				atNo = Integer.valueOf(delFiles[i]);
				resultAt = bService.deleteAttachment(atNo);
			}
			
		}
		
		// 새로 업데이트 된 첨부파일 db등록하기
		if(!reupfile[0].getOriginalFilename().equals("")) {			
			
			for(MultipartFile file : reupfile) {
				
				String changeName = saveFile(file, session);
				at.setOriginName(file.getOriginalFilename());
				at.setChangeName(changeName);
				at.setFilePath("resources/uploadFiles/" + changeName);
				at.setBoardNo(boardNo);
				resultAt = bService.insertNewAttachment(at);				
			}	
			
		}

		if(result + resultAt > 0) {
			if(admin.equals("Y")) {
				session.setAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다.");
				return "redirect:detailAdmin.bo?bno=" + boardNo;
			}else {
				session.setAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다.");
				return "redirect:detail.bo?bno=" + boardNo;
			}
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
	@RequestMapping(value="rlist.bo", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int bno) {
		ArrayList<Reply> list = bService.selectReplyList(bno);
		
		return new Gson().toJson(list);
	}
	
	// 댓글 입력하기
	@ResponseBody
	@RequestMapping(value="rinsert.bo")
	public String ajaxInsertReply(Reply r) {
		int result = bService.insertReply(r);
		return result>0? "success" : "fail";
	}
	
	// 댓글 삭제하기
	@ResponseBody
	@RequestMapping(value="rdelete.bo")
	public String ajaxDeleteReply(int replyNo) {
		int result = bService.deleteReply(replyNo);
		return result>0? "success" : "fail";				
	}
	
	// 댓글 수정하기
	@ResponseBody
	@RequestMapping(value="rupdate.bo")
	public String ajaxUpdateReply(Reply r) {
		int result = bService.updateReply(r);
		return result>0? "success" : "fail";	
	}
	
	// 게시글 검색하기
	@ResponseBody
	@RequestMapping(value="search.bo", produces="application/json; charset=utf-8")
	public String ajaxSearchBoard(Board b) {
		ArrayList<Board> list = bService.searchBoardList(b);
		return new Gson().toJson(list);
	}
	
	// 관리자 영역
	
	// 관리자 페이지 이동
	@RequestMapping("listAdmin.bo")
	public ModelAndView selectAdminList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectList(pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("board/adminBoardListView");
		
		
		return mv;
	}

	// 관리자 페이지 글 삭제 기능
	@RequestMapping("deleteAdmin.bo")
	public String delectAdminBoard(@RequestParam(value="boardNoDel[]") int[] checkArr, String filePath, HttpSession session, Model model) {
		
		int result = 0;
		int resultAt = 1;
		
		for(int bno : checkArr) {
			
			result = bService.deleteBoard(bno);
		
			if(result > 0) {	
				ArrayList<Attachment> atList = new ArrayList<Attachment>();
				atList = bService.selectAttachment(bno);

				for(int i=0; i<atList.size(); i++) {
					int atNo = atList.get(i).getAttachmentNo();
					resultAt = bService.deleteAttachment(atNo);
				}
			}	
		}
		if(result + resultAt > 0) {
			
			session.setAttribute("alertMsg", "게시글이 성공적으로 삭제되었습니다.");
			return "redirect:listAdmin.bo";
		}else {
			return "common/error";
		}
	}
	
	// 관리자 게시글 상세조회
	@RequestMapping("detailAdmin.bo")
	public ModelAndView adminSelectBoard(int bno, ModelAndView mv) {
		
		int result = bService.increaseCount(bno);
		
		if(result > 0) {
			
			Board b = bService.SelectBoard(bno);
			ArrayList<Attachment> atList = bService.selectAttachment(bno);
			mv.addObject("b", b);
			mv.addObject("atList", atList);
			mv.setViewName("board/adminBoardDetailView");
			
		}else {
			
			mv.addObject("errorMsg", "페이지 조회 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	
}
