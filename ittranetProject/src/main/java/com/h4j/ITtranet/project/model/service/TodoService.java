package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.project.model.vo.Todo;

public interface TodoService {

	// 업무 조회
	ArrayList<Todo> selectTodo(String empNo);

	// 업무 갯수 조회
	ArrayList<Todo> countTodo(String empNo);

}
