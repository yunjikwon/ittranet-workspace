package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.project.model.dao.TodoDao;
import com.h4j.ITtranet.project.model.vo.Todo;

@Service 
public class TodoServiceImpl implements TodoService {

	@Autowired
	public TodoDao tDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 업무 조회
	@Override
	public ArrayList<Todo> selectTodo(String empNo) {
		return tDao.selctTodo(sqlSession, empNo);
	}
	
	// 업무 갯수 조회
	@Override
	public ArrayList<Todo> countTodo(String empNo) {
		return tDao.countTodo(sqlSession, empNo);
	}

	// 업무 생성
	@Override
	public int newTodo(Todo td) {
		return tDao.newTodo(sqlSession, td);
	}

}
