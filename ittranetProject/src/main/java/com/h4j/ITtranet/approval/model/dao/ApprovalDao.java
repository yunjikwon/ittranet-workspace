package com.h4j.ITtranet.approval.model.dao;

import java.util.ArrayList;

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
	
	// 결재선 insert
	public int insertLine(SqlSessionTemplate sqlSession, Approval app) {
		return sqlSession.insert("appMapper.insertLine", app);
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

}
