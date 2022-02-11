package com.h4j.ITtranet.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.h4j.ITtranet.approval.model.dao.ApprovalDao;
import com.h4j.ITtranet.approval.model.vo.AppLine;

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
	
	
	

}
