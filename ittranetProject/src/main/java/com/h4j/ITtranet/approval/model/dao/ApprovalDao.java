package com.h4j.ITtranet.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.approval.model.vo.AppLine;
import com.h4j.ITtranet.approval.model.vo.Approval;
import com.h4j.ITtranet.common.model.vo.PageInfo;

@Repository
public class ApprovalDao {

	// 결재선 검색
	public ArrayList<AppLine> selectSearchTeam(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("appMapper.selectSearchTeam", keyword);
	}
	
	public ArrayList<AppLine> selectSearchName(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("appMapper.selectSearchName", keyword);
	}
	
	
	// 기안 게시판 paging
	public int selectListCount(SqlSession sqlSession, int category) {
		
		return sqlSession.selectOne("appMapper.selectListCount", category);
	}
	
	// 기안 게시판 select
	public ArrayList<Approval> selectList(SqlSession sqlSession, PageInfo pi, int category) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		System.out.println("category : " + category);
		return (ArrayList)sqlSession.selectList("appMapper.selectList", category, rowBounds);
		
	}

	// draft insert
	public int insertDraft(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.insertDraft", app);
	}
	
	// 문서별 insert
	public int insertBussinessPlan(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.businessplan", app);
	}
	public int insertApology(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.apology", app);
	}
	public int insertOvertime(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.overtime", app);
	}
	public int insertExpenditure(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.expenditure", app);
	}
	public int insertBudget(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.budget", app);
	}
	public int insertProceedings(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.proceedings", app);
	}
	
	// 결재선 insert
	public int insertAppLine(SqlSession sqlSession, Approval app, ArrayList<AppLine> appList) {		
		int result = 0;
		for(AppLine ap : appList) {
			result = sqlSession.insert("appMapper.appline", ap);
		}
		return result;
	}
	
	// 기안게시판 검색
	public ArrayList<Approval> selectSearchForm(SqlSession sqlSession, HashMap<String, Integer> map) {
		return (ArrayList)sqlSession.selectList("appMapper.selectSearchForm",map);
	}
	public ArrayList<Approval> selectSearchDate(SqlSession sqlSession, HashMap<String, Integer> map) {
		return (ArrayList)sqlSession.selectList("appMapper.selectSearchDate",map);
	}
	
	
	
	
	
	
}
