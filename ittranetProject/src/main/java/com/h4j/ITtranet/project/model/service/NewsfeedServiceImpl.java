package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.project.model.dao.NewsfeedDao;
import com.h4j.ITtranet.project.model.vo.Newsfeed;

@Service
public class NewsfeedServiceImpl implements NewsfeedService {

	@Autowired
	public NewsfeedDao nDao; 
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 뉴스피드 조회	
	@Override
	public ArrayList<Newsfeed> selectNews(String empNo) {
		return nDao.selectNews(sqlSession, empNo);
	}


	
}
