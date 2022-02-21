package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.project.model.vo.Newsfeed;

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
}
