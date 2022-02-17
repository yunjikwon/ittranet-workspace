package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.project.model.vo.Newsfeed;

public interface NewsfeedService {

	// 뉴스피드 조회
	ArrayList<Newsfeed> selectNews(String empNo);
	ArrayList<Newsfeed> newsProject(String empNo);

	// 프로젝트 뉴스피드 조회
	ArrayList<Newsfeed> prNewsfeed(String prNo);
	
}
