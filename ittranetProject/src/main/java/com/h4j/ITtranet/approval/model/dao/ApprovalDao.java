package com.h4j.ITtranet.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.h4j.ITtranet.approval.model.vo.AppLine;

public class ApprovalDao {


	public ArrayList<AppLine> selectSearchLine(SqlSessionTemplate sqlSession, AppLine appLine) {
		return (ArrayList)sqlSession.selectList("appMapper.selectSearchList", appLine);
	}

}
