package com.h4j.ITtranet.company.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.h4j.ITtranet.common.model.vo.Reply;
import com.h4j.ITtranet.company.model.service.CompanyService;
import com.h4j.ITtranet.company.model.vo.Company;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyService cService;
	
	// 1. 조직도 전체 조회 페이지 불러오는 서비스
	@RequestMapping("chartMain.co")
	public String chartMain(Model model) {
		ArrayList<Company> list = cService.selectChartList();
		ArrayList<Company> dList = cService.selectDeptList();
		//System.out.println(list);
		//System.out.println(dList);
		model.addAttribute("list", list);
		model.addAttribute("dList", dList);
		return "company/chartMain";
	}

	// 2. 상세검색 페이지 이동 서비스
	@RequestMapping("search.co")
	public String searchView(Model model) {
		ArrayList<Company> dList = cService.selectDeptList();
		model.addAttribute("dList", dList);
		return "company/chartSearchView";
	}
	
	// 3. 팀원 조회용 modal 서비스
	@ResponseBody
	@RequestMapping(value="selectEmp.co", produces="application/json; charset=utf-8")
	public String ajaxSelectEmpList(String teamCode) {
		ArrayList<Company> list = cService.selectEmpList(teamCode);
		//System.out.println(list);
		return new Gson().toJson(list);
	}
	
	// 4. 팀원 개별 조회용 modal 서비스
	@ResponseBody
	@RequestMapping(value="detailEmp.co", produces="application/json; charset=utf-8")
	public String ajaxDatailEmployee(int empNo) {
		Company c = cService.detailEmp(empNo);
		return new Gson().toJson(c);
	}
	
	// 5. 조직도 상세조회 팀 조회용 서비스
	@ResponseBody
	@RequestMapping(value="selectTeamCode.co", produces="allpication/json; charset=utf-8")
	public String ajaxSelectTeamCode(String deptCode) {
		ArrayList<Company> list = cService.selectTeamByDept(deptCode);
		return new Gson().toJson(list);
	}
	
	// 6. 조직도 상세조회 키워드 검색 서비스
	@ResponseBody
	@RequestMapping(value="searchEmp.co", produces="allpication/json; charset=utf-8")
	public String ajaxSearchEmpList(Company c) {
		ArrayList<Company> list = cService.searchChart(c);
		return new Gson().toJson(list);
	}
	
}
