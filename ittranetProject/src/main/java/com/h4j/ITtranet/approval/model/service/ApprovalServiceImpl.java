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
	
	@Override
	public ArrayList<AppLine> selectSearchLine(AppLine appLine){
		/*
		SqlSession sqlSession = getSqlSession();
		ArrayList<appLine> list = aDao.selectSearchList();
		return list;
		*/
		
		return aDao.selectSearchLine(sqlSession, appLine);
		
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
