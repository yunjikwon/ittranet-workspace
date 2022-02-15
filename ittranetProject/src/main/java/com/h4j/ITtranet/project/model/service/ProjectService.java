package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.project.model.vo.Project;

public interface ProjectService {

	// 프로젝트 생성
	int insertProject(Project p);
	
	// 프로젝트 리스트 조회
	ArrayList<Project> selectProject(String empNo); 
	
	// 프로젝트 수정
	int updateProject(Project p);



}
