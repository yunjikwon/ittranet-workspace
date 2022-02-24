package com.h4j.ITtranet.company.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.company.model.vo.Company;

public interface CompanyService {

	
	// 1. 조직도 상세조회
	ArrayList<Company> selectChartList();
	
	// 1-1. 조직도 부서 조회
	ArrayList<Company> selectDeptList();
	
	// 1-2. 팀별 조회
	ArrayList<Company> selectEmpList(String teamCode);
	
	// 1-3. 부서별 조회
	ArrayList<Company> selectTeamByDept(String deptCode);
	
	// 2. 조직도 개별 조회
	Company detailEmp(int empNo);
	
	// 3. 조직도 검색
	ArrayList<Company> searchChart(Company c);
}
