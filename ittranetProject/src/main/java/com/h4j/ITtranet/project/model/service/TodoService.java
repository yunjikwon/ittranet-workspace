package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.project.model.vo.Todo;

public interface TodoService {

	// 업무 조회
	ArrayList<Todo> selectTodo(String empNo);

	// 업무 갯수 조회
	ArrayList<Todo> countTodo(String empNo);

	// 업무 생성
	int newTodo(Todo td);

	// 업무 수정
	int updateTodo(Todo td);
	
	// 업무 삭제	
	String deleteTodo(String tdNo);

}
