package com.h4j.ITtranet.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.Reply;
import com.h4j.ITtranet.project.model.vo.Newsfeed;
import com.h4j.ITtranet.project.model.vo.Todo;

@Repository
public class NewsfeedDao {

	public ArrayList<Newsfeed> selectNews(SqlSessionTemplate sqlSession, String empNo) {
		return (ArrayList)sqlSession.selectList("newsfeedMapper.selectNews", empNo);
	}

	public ArrayList<Newsfeed> newsProject(SqlSessionTemplate sqlSession, String empNo) {
		return (ArrayList)sqlSession.selectList("newsfeedMapper.newsProject", empNo);
	}

	public ArrayList<Newsfeed> prNewsfeed(SqlSessionTemplate sqlSession, String prNo) {
		return (ArrayList)sqlSession.selectList("newsfeedMapper.prNewsfeed", prNo);
	}

	public int insertFeed(SqlSessionTemplate sqlSession, Newsfeed n) {
		return sqlSession.insert("newsfeedMapper.insertFeed", n);
	}
	public int insertAttachment(SqlSessionTemplate sqlSession, Newsfeed n) {
		return sqlSession.insert("newsfeedMapper.insertAttachment", n);
	}

	public int deleteFeed(SqlSessionTemplate sqlSession, int nfNo) {
		return sqlSession.update("newsfeedMapper.deleteFeed", nfNo);
	}

	public ArrayList<Todo> prTodo(SqlSessionTemplate sqlSession, String prNo) {
		return (ArrayList)sqlSession.selectList("todoMapper.projectTodo", prNo);
	}

	/*
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("newsfeedMapper.insertAttachment", a);
	}
	*/
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("newsfeedMapper.insertReply", r);
	}

	public Newsfeed nfNo(SqlSessionTemplate sqlSession, String prNo) {
		return sqlSession.selectOne("newsfeedMapper.nfNo", prNo);
	}

	public ArrayList<Attachment> prAttachment(SqlSessionTemplate sqlSession, String nfNo) {
		return (ArrayList)sqlSession.selectList("newsfeedMapper.prAttachment", nfNo);
	}


}
