package com.h4j.ITtranet.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.approval.model.service.ApprovalService;
import com.h4j.ITtranet.approval.model.vo.Approval;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.template.Pagination;

@Controller
public class ApprovalController {
	@Autowired
	private ApprovalService aService;
	
	// ----- "기안" 게시판 ------
	@RequestMapping("draftWait.dr")
	public ModelAndView draftWaitSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpServletRequest request) throws Exception {
		//paging
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// list 출력
		ArrayList<Approval> list = aService.selectList(pi);
		
		//category 추출 : @RequestParam
		int c = 1; // 대기 게시판
		int category;
		if(request.getParameter("category") == null) {
			category = c;
		} else {
			c = Integer.parseInt(request.getParameter("category"));
			category = c;
		}
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("approval/draftWait");
		System.out.println(pi);
		return mv;
	}	
}
