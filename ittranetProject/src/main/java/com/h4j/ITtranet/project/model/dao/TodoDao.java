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

	public ArrayList<Todo> countTodo(SqlSessionTemplate sqlSession, String empNo) {
		return (ArrayList)sqlSession.selectList("todoMapper.countTodo", empNo);
	}

	public int newTodo(SqlSessionTemplate sqlSession, Todo td) {
		return sqlSession.insert("todoMapper.newTodo", td);
	}

	public int updateTodo(SqlSessionTemplate sqlSession, Todo td) {
		return sqlSession.update("todoMapper.updateTodo", td);
	}

	public Object deleteTodo(SqlSessionTemplate sqlSession, String tdNo) {
		return sqlSession.delete("todoMapper.deleteTodo", tdNo);
	}
	

}
