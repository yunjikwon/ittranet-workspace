package com.h4j.ITtranet.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.h4j.ITtranet.approval.model.service.ApprovalService;
import com.h4j.ITtranet.approval.model.vo.AppLine;
import com.h4j.ITtranet.approval.model.vo.Approval;

@Controller
public class FormController {

	@Autowired
	private ApprovalService aService;

	// ----- 양식 ------
	@RequestMapping("form.fo")
	public String formSelect(int formNo) {
		String str = "";
		switch(formNo) {
			case 1: str = "bussinessPlan";
					break;
			case 2: str = "apology";
					break;		
			case 3: str = "overtime";
					break;		
			case 4: str = "expenditure";
					break;
			case 5: str = "budget";
					break;		
			case 6: str = "proceedings";
					break;			
		}
		return "approval/form/" + str;
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
	@ResponseBody
	@RequestMapping(value = "search.fo", produces="application/json; charset=utf-8")
	public String selectSearchLine(int flag, String keyword) {
		ArrayList<AppLine> list = new ArrayList<>();
		
		if(flag == 1) { // 팀 검색 요청
			list = aService.selectSearchTeam(keyword);
		} else{ // 성명 검색 요청
			list = aService.selectSearchName(keyword);
		}
		
		return new Gson().toJson(list);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
