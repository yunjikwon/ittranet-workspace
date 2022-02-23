package com.h4j.ITtranet.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.h4j.ITtranet.approval.model.service.ApprovalService;
import com.h4j.ITtranet.approval.model.vo.AppLine;
import com.h4j.ITtranet.approval.model.vo.Approval;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.template.Pagination;

@Controller
public class ApprovalController {
	@Autowired
	private ApprovalService aService;

	// ----- "기안" 게시판 select ------
	@RequestMapping("draftWait.dr")
	public ModelAndView draftWaitSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpServletRequest request) throws Exception {
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
		int listCount = aService.selectListCount(category);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		
		
		
		// list 출력
		ArrayList<Approval> list = aService.selectList(pi, category);

		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("category", category)
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
	public String insertDraft(Approval app, int formNo, HttpSession session, Model model) {
		ArrayList<AppLine> appList = app.getAppList();
		int result = aService.insertDraft(app, formNo, appList);
		
		
		if(result>0) {
			session.setAttribute("alertMsg", "기안 작성 완료되었습니다.");
			return "redirect:draftWait.dr";
		}else { // 실패 => 에러페이지 포워딩
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/error";
		}
	}
	
	
	// ------- 기안게시판 검색 ---------
	@ResponseBody
	@RequestMapping(value = "search.board" , produces="application/json; charset=utf-8")
	public String selectSearchBoard(Integer searchType) {

		ArrayList<Approval> list = new ArrayList<>();
		String boardSearch = "boardSearch";
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("boardSearch", searchType);
		
		if(searchType <= 6) {
			list = aService.selectSearchForm(map);
		} else {
			list = aService.selectSearchDate(map);
		}
		
		
		return new Gson().toJson(list);
	}
	
	
	
	
	
	
}
