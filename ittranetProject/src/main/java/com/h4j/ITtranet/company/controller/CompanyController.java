package com.h4j.ITtranet.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.h4j.ITtranet.company.model.service.CompanyService;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyService cService;
	
	// 1. 조직도 전체 조회 페이지 불러오는 서비스
	@RequestMapping("chartMain.co")
	public String chartMain() {
		return "company/chartMain";
	}

	// 2. 상세검색 페이지 이동 서비스
	@RequestMapping("search.co")
	public String searchView() {
		return "company/chartSearchView";
	}
}
