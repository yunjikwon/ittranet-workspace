package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.Reply;
import com.h4j.ITtranet.project.model.vo.Newsfeed;
import com.h4j.ITtranet.project.model.vo.Todo;

public interface NewsfeedService {

	// 뉴스피드 조회
	ArrayList<Newsfeed> selectNews(String empNo);
	ArrayList<Newsfeed> newsProject(String empNo);

	// 프로젝트 뉴스피드 조회
	ArrayList<Newsfeed> prNewsfeed(String prNo);
	Newsfeed nfNo(String prNo);
	// 뉴스피드 게시글 첨부파일 조회
	ArrayList<Attachment> prAttachment(String nfNo);
	
	// 프로젝트 뉴스피드 게시글 작성, 첨부파일 추가
	int insertFeed(Newsfeed n);
	int insertFile(Newsfeed n);
	
	// 프로젝트 뉴스피드 게시글 삭제
	int deleteFeed(int nfNo);
	
	// 프로젝트 업무 조회 
	ArrayList<Todo> prTodo(String prNo);
	
	// 댓글 달기
	int insertReply(Reply r);
	
	// 뉴스피드 게시글 첨부파일 추가
	ArrayList<Attachment> selectAttachment(Newsfeed n);
	
	// 뉴스피드 게시글 댓글 조회
	ArrayList<Reply> selectReplyList(int nfNo);
	
	// 프로젝트 업무 갯수 조회
	ArrayList<Todo> countTd(String prNo);
	

	


}
