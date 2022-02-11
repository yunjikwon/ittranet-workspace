package com.h4j.ITtranet.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.h4j.ITtranet.approval.model.service.ApprovalService;
import com.h4j.ITtranet.approval.model.service.ApprovalServiceImpl;
import com.h4j.ITtranet.approval.model.vo.AppLine;

@Controller
public class FormController {

	@Autowired
	private ApprovalService aService;

	@RequestMapping("bussiness.fo")
	public String bussinessPlanForm() {
		// /WEB-INF/views/approval/form/bussinessPlan.jsp
		return "approval/form/bussinessPlan";
	}
	
	@RequestMapping("apology.fo")
	public String apologyForm() {
		return "approval/form/apology";
	}
	
	@RequestMapping("overtime.fo")
	public String overtimeForm() {
		return "approval/form/overtime";
	}
	
	@RequestMapping("expenditure.fo")
	public String expenditureForm() {
		return "approval/form/expenditure";
	}
	
	@RequestMapping("budget.fo")
	public String budgetForm() {
		return "approval/form/budget";
	}
	
	@RequestMapping("proceedings.fo")
	public String proceedingsForm() {
		return "approval/form/proceedings";
	}
	
	//새기안 모달창
	@RequestMapping("newForm.fo")
	public String newForm() {
		return "approval/newForm";
	}
	
	// 결재선 모달창
	@RequestMapping("line.fo")
	public String approvalLine() {
		return "approval/form/line";
	}
	
	// 검색
	@RequestMapping("search.fo")
	public ArrayList<AppLine> selectSearchLine(@RequestParam("team") String team, @RequestParam("name") String name) {
		AppLine appLine = new AppLine();
		appLine.setTeam(team);
		appLine.setEmpName(name);
		
		ArrayList<AppLine> FormSearch = aService.selectSearchLine(appLine);	
		
		
		return "";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
