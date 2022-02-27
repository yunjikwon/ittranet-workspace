package com.h4j.ITtranet.company.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.company.model.vo.Company;

@Repository
public class CompanyDao {

	public ArrayList<Company> selectChartList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("companyMapper.selectChartList");
	}
	
	public ArrayList<Company> selectDeptList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("companyMapper.selectDeptList");
	}
	
	public ArrayList<Company> selectEmpList(SqlSessionTemplate sqlSession, String teamCode){
		return (ArrayList)sqlSession.selectList("companyMapper.selectEmpList", teamCode);
	}
	
	public ArrayList<Company> selectTeamByDept(SqlSessionTemplate sqlSession, String deptCode){
		return (ArrayList)sqlSession.selectList("companyMapper.selectTeamByDept", deptCode);
	}
	
	public Company detailEmp(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("companyMapper.selectEmployee", empNo);
	}
	
	public ArrayList<Company> searchChart(SqlSessionTemplate sqlSession, Company c){
		return (ArrayList)sqlSession.selectList("companyMapper.searchChartList", c);
	}
}
