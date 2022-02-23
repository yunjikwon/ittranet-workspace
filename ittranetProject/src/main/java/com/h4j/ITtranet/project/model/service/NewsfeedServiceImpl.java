package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.project.model.dao.NewsfeedDao;
import com.h4j.ITtranet.project.model.vo.Newsfeed;
import com.h4j.ITtranet.project.model.vo.Todo;

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
	@Override
	public ArrayList<Newsfeed> newsProject(String empNo){
		return nDao.newsProject(sqlSession, empNo);
	}
	
	
	// 프로젝트 뉴스피드 조회
	@Override
	public ArrayList<Newsfeed> prNewsfeed(String prNo){
		return nDao.prNewsfeed(sqlSession, prNo);
	}
	
	// 뉴스피드 게시글 작성 
	@Override
	public int insertFeed(Newsfeed n) {
		return nDao.insertFeed(sqlSession, n);
	}
	
	// 뉴스피드 게시글 삭제
	@Override
	public int deleteFeed(int nfNo) {
		return nDao.deleteFeed(sqlSession, nfNo);
	}
	
	// 프로젝트 업무 조회
	@Override
	public ArrayList<Todo> prTodo(String prNo) {
		return nDao.prTodo(sqlSession, prNo);
	}
	
}
