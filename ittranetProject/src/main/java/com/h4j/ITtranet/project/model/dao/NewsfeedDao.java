package com.h4j.ITtranet.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.project.model.vo.Newsfeed;

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

}
