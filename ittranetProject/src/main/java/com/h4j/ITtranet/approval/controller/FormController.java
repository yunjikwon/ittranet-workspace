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
	
    /*결재선 insert*/
    @RequestMapping("insert.line")
	public String insertLine(Approval app, Model model){
		/*
	List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>(); //실제 데이터가 담긴 List
	Map<String,Object> insertMap = new HashMap<String,Object>(); //MyBatis에 던질 Map
	insertMap.put("list",dataList); //MyBatis의 foreach의 collection이름을 key로 List를 put
		 */
		int result = aService.insertLine(app);
		
		
	}
	

	
	// 검색
	@ResponseBody
	@RequestMapping(value = "search.fo", produces="application/json; charset=utf-8")
	public String selectSearchLine(int flag, String keyword) {
		ArrayList<AppLine> list = new ArrayList<>();
		
		if(flag == 1) { // 팀 검색 요청
			list = aService.selectSearchTeam(keyword);
		} else{
			list = aService.selectSearchName(keyword);
		}
		
		return new Gson().toJson(list);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
