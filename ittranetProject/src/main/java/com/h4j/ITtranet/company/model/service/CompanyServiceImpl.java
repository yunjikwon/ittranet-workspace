package com.h4j.ITtranet.company.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.company.model.dao.CompanyDao;
import com.h4j.ITtranet.company.model.vo.Company;

@Service
public class CompanyServiceImpl implements CompanyService{
	
	@Autowired
	private CompanyDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Company> selectChartList() {
		return cDao.selectChartList(sqlSession);
	}

	@Override
	public ArrayList<Company> selectDeptList() {
		return cDao.selectDeptList(sqlSession);
	}
	
	@Override
	public ArrayList<Company> selectEmpList(String teamCode) {
		return cDao.selectEmpList(sqlSession, teamCode);
	}
	
	@Override
	public ArrayList<Company> selectTeamByDept(String deptCode) {
		return cDao.selectTeamByDept(sqlSession, deptCode);
	}
	
	@Override
	public Company detailEmp(int empNo) {
		return cDao.detailEmp(sqlSession, empNo);
	}

	@Override
	public ArrayList<Company> searchChart(Company c) {
		return cDao.searchChart(sqlSession, c);
	}




}
