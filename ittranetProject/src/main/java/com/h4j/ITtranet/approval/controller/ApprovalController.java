package com.h4j.ITtranet.approval.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.h4j.ITtranet.approval.model.service.ApprovalService;
import com.h4j.ITtranet.approval.model.vo.AppLine;
import com.h4j.ITtranet.approval.model.vo.Approval;
import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.template.Pagination;
import com.h4j.ITtranet.employee.model.vo.Employee;

@Controller
public class ApprovalController {
	@Autowired
	private ApprovalService aService;

	// ----- "기안" 게시판 select ------
	@RequestMapping("draftWait.dr")
	public ModelAndView draftWaitSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv, HttpServletRequest request) throws Exception {
		//category 추출 : @RequestParam
		int c = 1; // 대기 게시판
		int category;
		if(request.getParameter("category") == null) {               
			category = c;
		} else {
			c = Integer.parseInt(request.getParameter("category"));
			category = c;
		}
		
		// 세션에서 empNo 값 가져오기
		Employee loginUser = (Employee) session.getAttribute("loginUser");
		int loginNo = Integer.parseInt(loginUser.getEmpNo());
		
		//paging
		int listCount = aService.selectListCount(category, loginNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// 결재자 list 출력
		ArrayList<AppLine> linePerson = aService.selectAppName();
		
		// list 출력
		ArrayList<Approval> list = aService.selectList(pi, category, loginNo);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("category", category)
		  .addObject("linePerson", linePerson)
		  .setViewName("approval/draftWait");
		
		return mv;
	}	
	/*
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
		int listCount = aService.selectListCount(category, drpersonNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// 결재자 list 출력
		ArrayList<AppLine> linePerson = aService.selectAppName();
		
		// list 출력
		ArrayList<Approval> list = aService.selectList(pi, category, drpersonNo);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("linePerson", linePerson)
		  .setViewName("approval/draftOngoing");
		
		return mv;
	}
	*/
	@RequestMapping("draftReject.dr")
	public ModelAndView draftRejectSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		//category 추출 : @RequestParam
		int c = 3; // 대기 게시판
		int category;
		if(request.getParameter("category") == null) {
			category = c;
		} else {
			c = Integer.parseInt(request.getParameter("category"));
			category = c;
		}

		// 세션에서 empNo 값 가져오기
		Employee loginUser = (Employee) session.getAttribute("loginUser");
		int loginNo = Integer.parseInt(loginUser.getEmpNo());
				
		//paging
		int listCount = aService.selectListCount(category, loginNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// 결재자 list 출력
		ArrayList<AppLine> linePerson = aService.selectAppName();
		
		// list 출력
		ArrayList<Approval> list = aService.selectList(pi, category, loginNo);

		System.out.println("반려 게시판 list : " + list);
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("category", category)
		  .addObject("linePerson", linePerson)
		  .setViewName("approval/draftReject");
		
		return mv;
	}
	
	
	@RequestMapping("draftComplete.dr")
	public ModelAndView draftCompleteSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv, HttpServletRequest request) throws Exception {
		
		//category 추출 : @RequestParam
		int c = 4; // 대기 게시판
		int category;
		if(request.getParameter("category") == null) {
			category = c;
		} else {
			c = Integer.parseInt(request.getParameter("category"));
			category = c;
		}
		// 세션에서 empNo 값 가져오기
		Employee loginUser = (Employee) session.getAttribute("loginUser");
		int loginNo = Integer.parseInt(loginUser.getEmpNo());
		
		//paging
		int listCount = aService.selectListCount(category, loginNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// 결재자 list 출력
		ArrayList<AppLine> linePerson = aService.selectAppName();
		
		// list 출력
		ArrayList<Approval> list = aService.selectList(pi, category, loginNo);

		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("category", category)
		  .addObject("linePerson", linePerson)
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
		
		//System.out.println("result : " + result);
		//System.out.println("resultAt : " + resultAt);
		
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
	
	// ----- 기안/결재 상세페이지 ------
	@RequestMapping("detail.dr")
	public ModelAndView selectDetail(int category, int drNo, String drDivision, ModelAndView mv) {

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
		mv.addObject("category", category);
		mv.addObject("aline", linePerson);
		mv.addObject("b", b);
		mv.addObject("at", at);
		mv.setViewName("approval/detail/" + str);
		System.out.println( "상세보기 approval 객체 정보 : " + b);
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
			//System.out.println("결재분류 search map : " + map);
			list = aService.selectSearchForm(map);
		}	
		else{
			HashMap<String, Integer> map = new HashMap<String, Integer>();		
			map.put("boardSearch", search);
			//System.out.println("기안일 search map : " + map);
			list = aService.selectSearchDate(map);
		}
		//System.out.println(list);
		
		// 결재자 list 출력
		ArrayList<AppLine> linePerson = aService.selectAppName();
		//System.out.println(linePerson);

		HashMap<String, Object> result = new HashMap<>();
		result.put("list", list);
		result.put("linePerson", linePerson);
		
		return new Gson().toJson(result);
	}
	
	//----------------------------------------------------------------------------
	
	// ----- "결재" 게시판 select ------
		@RequestMapping("approvalWait.ap")
		public ModelAndView approvalWait(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session, HttpServletRequest request) throws Exception {
			//category 추출 : @RequestParam
			int c = 5; // 미처리 게시판
			int category;
			if(request.getParameter("category") == null) {
				category = c;
			} else {
				c = Integer.parseInt(request.getParameter("category"));
				category = c;
			}
			
			// 세션에서 empNo 값 가져오기
			Employee loginUser = (Employee) session.getAttribute("loginUser");
			int loginNo = Integer.parseInt(loginUser.getEmpNo());
			System.out.println("personNo : " + loginNo);
			
			//paging
			int listCount = aService.selectApListCount(category, loginNo);
			System.out.println("listCount : " + listCount);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			// 결재자 list 출력
			//ArrayList<AppLine> linePerson = aService.selectAppName();
			
			// list 출력
			ArrayList<Approval> list = aService.selectApList(pi, category, loginNo);
			
			mv.addObject("pi", pi)
			  .addObject("list", list)
			  .addObject("category", category)
			  //.addObject("linePerson", linePerson)
			  .setViewName("approval/approvalWait");
			
			return mv;
		}
	
	
		@RequestMapping("approvalReject.ap")
		public ModelAndView approvalReject(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session, HttpServletRequest request) throws Exception {
			//category 추출 : @RequestParam
			int c = 6; // 미처리 게시판
			int category;
			if(request.getParameter("category") == null) {
				category = c;
			} else {
				c = Integer.parseInt(request.getParameter("category"));
				category = c;
			}
			
			// 세션에서 empNo 값 가져오기
			Employee loginUser = (Employee) session.getAttribute("loginUser");
			int loginNo = Integer.parseInt(loginUser.getEmpNo());
			//System.out.println("personNo : " + loginNo);
			
			//paging
			int listCount = aService.selectApListCount(category, loginNo);
			//System.out.println("listCount : " + listCount);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			// 결재자 list 출력
			//ArrayList<AppLine> linePerson = aService.selectAppName();
			
			// list 출력
			ArrayList<Approval> list = aService.selectApList(pi, category, loginNo);
			
			mv.addObject("pi", pi)
			  .addObject("list", list)
			  .addObject("category", category)
			  //.addObject("linePerson", linePerson)
			  .setViewName("approval/approvalReject");
			
			return mv;
		}
		
		@RequestMapping("approvalComplete.ap")
		public ModelAndView approvalComplete(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session, HttpServletRequest request) throws Exception {
			//category 추출 : @RequestParam
			int c = 7; // 미처리 게시판
			int category;
			if(request.getParameter("category") == null) {
				category = c;
			} else {
				c = Integer.parseInt(request.getParameter("category"));
				category = c;
			}
			
			// 세션에서 empNo 값 가져오기
			Employee loginUser = (Employee) session.getAttribute("loginUser");
			int loginNo = Integer.parseInt(loginUser.getEmpNo());
			//System.out.println("personNo : " + loginNo);
			
			//paging
			int listCount = aService.selectApListCount(category, loginNo);
			//System.out.println("listCount : " + listCount);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			// 결재자 list 출력
			//ArrayList<AppLine> linePerson = aService.selectAppName();
			
			// list 출력
			ArrayList<Approval> list = aService.selectApList(pi, category, loginNo);
			
			mv.addObject("pi", pi)
			  .addObject("list", list)
			  .addObject("category", category)
			  //.addObject("linePerson", linePerson)
			  .setViewName("approval/approvalComplete");
			
			return mv;
		}
		
		// ----- 결재 상세페이지 ------
		
		@RequestMapping("detail.ap")
		public ModelAndView selectApDetail(int category, int drNo, String drDivision, ModelAndView mv) {

			Approval b = aService.selectDetail(drNo, drDivision);
			ArrayList<AppLine> linePerson = aService.selectAppName();			
			Attachment at = aService.selectAttachment(drNo);
			
			String str = "";
			switch(drDivision) {
			case "사업계획서" : str = "bussinessPlanApDetail";
							 break;
			case "시말서": str = "apologyApDetail";
						 break;	
			case "연장근무신청": str = "overtimeApDetail";
			break;
							
			case "지출결의서": str = "expenditureApDetail";
			break;
							
			case "추가예산신청": str = "budgetApDetail";
			break;
							
			case "회의록": str = "proceedingsApDetail";
			break;
						
			}
			mv.addObject("category", category);
			mv.addObject("aline", linePerson);
			mv.addObject("b", b);
			mv.addObject("at", at);
			mv.setViewName("approval/apDetail/" + str);
			//System.out.println(b);
			return mv;
		}
		
		@RequestMapping("updateReject.ap")
		public String updateReject(int drNo, HttpServletRequest request,HttpSession session, Model model) {
			int category = Integer.parseInt(request.getParameter("category"));
			HashMap<String, Integer> map = new HashMap<>();
			map.put("category", category);
			//map.put("apStatus", apStatus);
			//map.put("aplineOrder", aplineOrder);
			map.put("drNo",drNo);
			
			int result = aService.updateReject(map);
			
			if(result > 0) { // 수정 성공
				return "redirect:approvalReject.ap";
				
			}else { // 수정 실패 => 에러페이지
				model.addAttribute("errorMsg", "반려 요청 실패");
				return "common/error";
			}
		}
		
		@RequestMapping("updateComplete.ap")
		public String updateComplete(int drNo, HttpServletRequest request,HttpSession session, Model model) {
			int category = Integer.parseInt(request.getParameter("category"));
			HashMap<String, Integer> map = new HashMap<>();
			map.put("category", category);
			//map.put("apStatus", apStatus);
			//map.put("aplineOrder", aplineOrder);
			map.put("drNo",drNo);
			
			int result = aService.updateComplete(map);
			
			if(result > 0) { // 수정 성공
				return "redirect:approvalReject.ap";
				
			}else { // 수정 실패 => 에러페이지
				model.addAttribute("errorMsg", "반려 요청 실패");
				return "common/error";
			}
		}
		
		// 관리자 양식관리
		@RequestMapping("adminForm.dr")
		public ModelAndView adminFormList(HttpSession session, ModelAndView mv, HttpServletRequest request) throws Exception {
			mv
			  .setViewName("approval/adminFormList");
			
			return mv;
		}
		
		// ----- 관리자 "결재" 게시판 select ------
		@RequestMapping("adminApWait.ap")
		public ModelAndView adminApWait(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session, HttpServletRequest request) throws Exception {
			
			//paging
			int listCount = aService.selectAdminApListCount();
			//System.out.println("listCount : " + listCount);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			// 결재자 list 출력
			ArrayList<AppLine> linePerson = aService.selectAppName();
			
			// list 출력
			ArrayList<Approval> list = aService.selectAdminApList(pi);
			
			mv.addObject("pi", pi)
			  .addObject("list", list)
			  //.addObject("category", category)
			  .addObject("linePerson", linePerson)
			  .setViewName("approval/adminApList");
			System.out.println("admin list : " + list);
			System.out.println("admin linePerson : " + linePerson);
			return mv;
		}	
	
		
		// ----- 관리자 권한 결재 상세페이지 ------
		
		@RequestMapping("adminDetail.ap")
		public ModelAndView selectAdminApDetail(int drNo, String drDivision, ModelAndView mv) {

			Approval b = aService.selectDetail(drNo, drDivision);
			ArrayList<AppLine> linePerson = aService.selectAppName();			
			Attachment at = aService.selectAttachment(drNo);
			
			String str = "";
			switch(drDivision) {
			case "사업계획서" : str = "AdBussinessPlanApDetail";
							 break;
			case "시말서": str = "AdApologyApDetail";
						 break;	
			case "연장근무신청": str = "AdOvertimeApDetail";
			break;
							
			case "지출결의서": str = "AdExpenditureApDetail";
			break;
							
			case "추가예산신청": str = "AdBudgetApDetail";
			break;
							
			case "회의록": str = "AdProceedingsApDetail";
			break;
						
			}
			mv.addObject("aline", linePerson);
			mv.addObject("b", b);
			mv.addObject("at", at);
			mv.setViewName("approval/adminApDetail/" + str);
			//System.out.println(b);
			return mv;
		}
		
		//관리자 권한 결재 update 
		
		@RequestMapping("updateAdminReject.ap")
		public String updateAdminReject(int drNo, HttpServletResponse response, HttpSession session, Model model) throws IOException {
			
			int result = aService.updateAdminReject(drNo);
			
			if(result > 0) { // 수정 성공
				/*
				// 알림창
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script language='javascript'>");	
				out.println("alert('결재 완료했습니다.'");
				out.println("</script>");

				out.flush();
				*/
				return "redirect:adminApWait.ap";
				
			}else { // 수정 실패 => 에러페이지
				model.addAttribute("errorMsg", "반려 요청 실패");
				return "common/error";
			}
		}
		
		@RequestMapping("updateAdminComplete.ap")
		public String updateAdminComplete(int drNo, HttpServletResponse response ,HttpSession session, Model model) throws IOException {
			int result = aService.updateAdminComplete(drNo);
			
			if(result > 0) { // 수정 성공
				// 알림창
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script language='javascript'>");	
				out.println("alert('결재 완료했습니다.'");
				out.println("</script>");

				out.flush();
				
				return "redirect:adminApWait.ap";
				
			}else { // 수정 실패 => 에러페이지
				model.addAttribute("errorMsg", "반려 요청 실패");
				return "common/error";
			}
		}
		
		// main페이지 기안리스트 불러오기
		@ResponseBody
		@RequestMapping(value="draft.main", produces="application/json; charset=utf-8")
		public String mainDraftWaitSelect(HttpSession session) throws Exception {
			// 세션에서 empNo 값 가져오기
			Employee loginUser = (Employee) session.getAttribute("loginUser");
			int loginNo = Integer.parseInt(loginUser.getEmpNo());
			
			// list 출력
			ArrayList<Approval> list = aService.mainSelectList(loginNo);
			System.out.println("main list: " + list);
			return new Gson().toJson(list);
		}

		
}
