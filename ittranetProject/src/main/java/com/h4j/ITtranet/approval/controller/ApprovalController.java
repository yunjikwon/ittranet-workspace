package com.h4j.ITtranet.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.h4j.ITtranet.approval.model.service.ApprovalService;
import com.h4j.ITtranet.approval.model.vo.AppLine;
import com.h4j.ITtranet.approval.model.vo.Approval;
import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.template.Pagination;

@Controller
public class ApprovalController {
	@Autowired
	private ApprovalService aService;

	// ----- "기안" 게시판 select ------
	@RequestMapping("draftWait.dr")
	public ModelAndView draftWaitSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, int drpersonNo, ModelAndView mv, HttpServletRequest request) throws Exception {
		//category 추출 : @RequestParam
		int c = 1; // 대기 게시판
		int category;
		if(request.getParameter("category") == null) {
			category = c;
		} else {
			c = Integer.parseInt(request.getParameter("category"));
			category = c;
		}
		
		//paging
		int listCount = aService.selectListCount(category, drpersonNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// 결재자 list 출력
		ArrayList<AppLine> linePerson = aService.selectAppName();
		
		// list 출력
		ArrayList<Approval> list = aService.selectList(pi, category, drpersonNo);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("linePerson", linePerson)
		  .setViewName("approval/draftWait");
		
		return mv;
	}	
	
	@RequestMapping("draftOngoing.dr")
	public ModelAndView draftOngoingSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		//category 추출 : @RequestParam
		int c = 2; // 대기 게시판
		int category;
		if(request.getParameter("category") == null) {
			category = c;
		} else {
			c = Integer.parseInt(request.getParameter("category"));
			category = c;
		}
		//paging
		int listCount = aService.selectListCount(category);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// list 출력
		ArrayList<Approval> list = aService.selectList(pi, category);

		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("category", category)
		  .setViewName("approval/draftOngoing");
		
		return mv;
	}
	
	@RequestMapping("draftReject.dr")
	public ModelAndView draftRejectSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		//category 추출 : @RequestParam
		int c = 3; // 대기 게시판
		int category;
		if(request.getParameter("category") == null) {
			category = c;
		} else {
			c = Integer.parseInt(request.getParameter("category"));
			category = c;
		}
		//paging
		int listCount = aService.selectListCount(category);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// list 출력
		ArrayList<Approval> list = aService.selectList(pi, category);

		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("category", category)
		  .setViewName("approval/draftReject");
		
		return mv;
	}
	
	
	@RequestMapping("draftComplete.dr")
	public ModelAndView draftCompleteSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		//category 추출 : @RequestParam
		int c = 4; // 대기 게시판
		int category;
		if(request.getParameter("category") == null) {
			category = c;
		} else {
			c = Integer.parseInt(request.getParameter("category"));
			category = c;
		}
		//paging
		int listCount = aService.selectListCount(category);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// list 출력
		ArrayList<Approval> list = aService.selectList(pi, category);

		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("category", category)
		  .setViewName("approval/draftComplete");
		
		return mv;
	}
	
	
	// ----- 기안 insert ------
	@RequestMapping("insert.dr")
	public String insertDraft(Approval app, Attachment at, int formNo, HttpSession session, Model model, MultipartFile upfile) {
		// 전달된 파일 있을 경우 -> 파일명 수정 작업 후 서버 업로드 -> 원본명, 서버 업로드된 경로를 app에 이어서 담기
		System.out.println(app);
		System.out.println(upfile);
		
		ArrayList<AppLine> appList = app.getAppList();
		int result = aService.insertDraft(app, formNo, appList);
		
		int resultAt = 1;
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName("resources/uploadFiles/" + changeName);	
			at.setFilePath("resources/uploadFiles/" + changeName);
			
			resultAt = aService.insertAttachment(at);
		}
		
		System.out.println("result : " + result);
		System.out.println("resultAt : " + resultAt);
		
		if(result * resultAt >0) {
			return "redirect:draftWait.dr";
		}else { // 실패 => 에러페이지 포워딩
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/error";
		}
	}
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000+ 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	// ----- 기안 상세페이지 ------
	@RequestMapping("detail.dr")
	public ModelAndView selectDetail(int drNo, String drDivision, ModelAndView mv) {

		Approval b = aService.selectDetail(drNo, drDivision);
		ArrayList<AppLine> linePerson = aService.selectAppName();			
		Attachment at = aService.selectAttachment(drNo);
		
		String str = "";
		switch(drDivision) {
		case "사업계획서" : str = "bussinessPlanDetail";
						 break;
		case "시말서": str = "apologyDetail";
					 break;	
		case "연장근무신청": str = "overtimeDetail";
		break;
						
		case "지출결의서": str = "expenditureDetail";
		break;
						
		case "추가예산신청": str = "budgetDetail";
		break;
						
		case "회의록": str = "proceedingsDetail";
		break;
					
		}
		mv.addObject("aline", linePerson);
		mv.addObject("b", b);
		mv.addObject("at", at);
		mv.setViewName("approval/detail/" + str);
		System.out.println(b);
		return mv;
	}
	
	// ------- 기안게시판 검색 ---------
	@ResponseBody
	@RequestMapping(value = "search.board" , produces="application/json; charset=utf-8")
	public String selectSearchBoard(Integer search, int flag) {
		ArrayList<Approval> list = new ArrayList<>();
		String boardSearch = "boardSearch";
		
		if(flag == 1) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();		
			map.put("boardSearch", search);
			System.out.println("결재분류 search map : " + map);
			list = aService.selectSearchForm(map);
		}	
		else{
			HashMap<String, Integer> map = new HashMap<String, Integer>();		
			map.put("boardSearch", search);
			System.out.println("기안일 search map : " + map);
			list = aService.selectSearchDate(map);
		}
		System.out.println(list);
		
		// 결재자 list 출력
		ArrayList<AppLine> linePerson = aService.selectAppName();
		System.out.println(linePerson);

		return new Gson().toJson(list);
	}
	
	//----------------------------------------------------------------------------
	
	// ----- "결재" 게시판 select ------
		@RequestMapping("approvalWait.ap")
		public ModelAndView approvalWait(@RequestParam(value="cpage", defaultValue="1") int currentPage, int apNo, ModelAndView mv, HttpServletRequest request) throws Exception {
			//category 추출 : @RequestParam
			int c = 5; // 미처리 게시판
			int category;
			if(request.getParameter("category") == null) {
				category = c;
			} else {
				c = Integer.parseInt(request.getParameter("category"));
				category = c;
			}
			
			//paging
			int listCount = aService.selectApListCount(category, apNo);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			// 결재자 list 출력
			//ArrayList<AppLine> linePerson = aService.selectAppName();
			
			// list 출력
			ArrayList<Approval> list = aService.selectApList(pi, category, apNo);
			
			mv.addObject("pi", pi)
			  .addObject("list", list)
			  .addObject("category", category)
			  //.addObject("linePerson", linePerson)
			  .setViewName("approval/approvalWait");
			
			return mv;
		}
	
	
	
	
}
