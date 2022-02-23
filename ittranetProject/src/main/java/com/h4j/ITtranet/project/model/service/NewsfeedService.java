package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.project.model.vo.Newsfeed;
import com.h4j.ITtranet.project.model.vo.Todo;

public interface NewsfeedService {

	// 뉴스피드 조회
	ArrayList<Newsfeed> selectNews(String empNo);
	ArrayList<Newsfeed> newsProject(String empNo);

	// 프로젝트 뉴스피드 조회
	ArrayList<Newsfeed> prNewsfeed(String prNo);
	
	// 프로젝트 뉴스피드 게시글 작성
	int insertFeed(Newsfeed n);
	
	// 프로젝트 뉴스피드 게시글 삭제
	int deleteFeed(int nfNo);
	
	// 프로젝트 업무 조회 
	ArrayList<Todo> prTodo(String prNo);
}
