package com.h4j.ITtranet.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.approval.model.dao.ApprovalDao;
import com.h4j.ITtranet.approval.model.vo.AppLine;
import com.h4j.ITtranet.approval.model.vo.Approval;
import com.h4j.ITtranet.common.model.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 결재선 검색 - 팀
	@Override
	public ArrayList<AppLine> selectSearchTeam(String keyword) {
		return aDao.selectSearchTeam(sqlSession, keyword);
	}
	
	// 결재선 검색 - 성명
	@Override
	public ArrayList<AppLine> selectSearchName(String keyword) {
		return aDao.selectSearchName(sqlSession, keyword);
	}

	@Override
	public int selectListCount(int category) {
		return aDao.selectListCount(sqlSession, category);
	}

	@Override
	public ArrayList<Approval> selectList(PageInfo pi, int category) {
		return aDao.selectList(sqlSession, pi, category);
	}

	
	
	

}
