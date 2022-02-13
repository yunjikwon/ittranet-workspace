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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.board.model.service.BoardService;
import com.h4j.ITtranet.board.model.vo.Board;
import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
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
	// 첨부파일 부분 구현 아직 안함!!
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
				String filePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
				at.setOriginName(file.getOriginalFilename());
				at.setChangeName("resources/uploadFiles/" + changeName);
				at.setFilePath(filePath);
				
				resultAt = bService.insertAttachment(at);				
			}					
			
		}
		
		
		if(result * resultAt > 0) {
			return "redirect:list.bo";
		}else {
			model.addAttribute("errorMsg", "게시글 등록실패");
			return "common/error";
		}
				
	}
	// 다중파일 업로드
	/*
	@PostMapping
	public String saveFiles(@RequestParam("upfile") ArrayList<MultipartFile> upfile, HttpSession session) {
		
		
		for(MultipartFile file : upfile) {
			
			String originName = file.getOriginalFilename();
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random() * 90000 + 10000);
			String ext = originName.substring(originName.lastIndexOf("."));
			String changeName = currentTime + ranNum + ext;
			String filePath = "resources/uploadFiles" + originName ;
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			try {
				((MultipartFile) upfile).transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return "uploaded";
	}
	*/
	
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
	
	
}
