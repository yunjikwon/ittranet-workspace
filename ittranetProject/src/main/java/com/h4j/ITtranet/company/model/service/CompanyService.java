package com.h4j.ITtranet.company.model.service;

import com.h4j.ITtranet.company.model.vo.Company;

public interface CompanyService {

	// 1. 조직도 상세조회
	<ArrayList>Company selectChartList();
	
	// 2. 조직도 개별 조회
	Company selectChart();
	
	// 3. 조직도 검색
	<ArrayList>Company searchChart();
}
