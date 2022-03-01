package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.Reply;
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
	// 프로젝트 첨부파일 조회
	@Override
	public ArrayList<Attachment> prAttachment(String nfNo) {
		return nDao.prAttachment(sqlSession, nfNo);
	}
	@Override
	public Newsfeed nfNo(String prNo) {
		return nDao.nfNo(sqlSession, prNo);
	}
	
	
	// 뉴스피드 게시글 작성 
	@Override
	public int insertFeed(Newsfeed n) {
		int result = nDao.insertFeed(sqlSession, n);
		if(n.getOriginName() != null) {
			result += nDao.insertAttachment(sqlSession, n);
		}
		return result;
	}
	// 첨부파일 추가하기 2번째
	@Override
	public int insertFile(Newsfeed n) {
		return nDao.insertAttachment(sqlSession, n);
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
	
	/*
	// 뉴스피드 게시글 첨부파일
	@Override
	public int insertAttachment(Attachment a) {
		return nDao.insertAttachment(sqlSession, a);
	}
	*/
	
	// 댓글 달기
	@Override
	public int insertReply(Reply r) {
		return nDao.insertReply(sqlSession, r);
	}
	@Override
	public ArrayList<Attachment> selectAttachment(Newsfeed n) {
		return null;
	}
	
	// 댓글 조회
	@Override
	public ArrayList<Reply> selectReplyList(int nfNo) {
		return nDao.selectReplyList(sqlSession, nfNo);
	}
	
	// 프로젝트 업무 갯수 조회
	@Override
	public ArrayList<Todo> countTd(String prNo) {
		return nDao.countTd(sqlSession, prNo);
	}
	
	// 게시글 수정
	@Override
	public int updateFeed(Newsfeed n) {
		return nDao.updateFeed(sqlSession, n);
	}
	
	// 게시글 첨부파일 삭제
	@Override
	public int deleteAttachment(Newsfeed n) {
		return nDao.deleteAttachment(sqlSession, n);
	}
	
	// 게시글 댓글 삭제
	@Override
	public int deleteReply(int replyNo) {
		return nDao.deleteReply(sqlSession, replyNo);
	}

	



	
}
