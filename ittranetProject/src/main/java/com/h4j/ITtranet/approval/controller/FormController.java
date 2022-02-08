package com.h4j.ITtranet.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FormController {

	//@Autowired
	//private FormService fService;

	@RequestMapping("business.fo")
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
	
	@RequestMapping("newForm.fo")
	public String newForm() {
		return "approval/form/newForm";
	}
	
	
}
