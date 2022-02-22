package com.h4j.ITtranet.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.project.model.vo.Todo;

@Repository
public class TodoDao {

	public ArrayList<Todo> selctTodo(SqlSessionTemplate sqlSession, String empNo) {
		return (ArrayList)sqlSession.selectList("todoMapper.selectTodo", empNo);
		
	}

	public ArrayList<Todo> countTodo(SqlSessionTemplate sqlSession, String empNo, String prNo) {
		return null;
	}

}
