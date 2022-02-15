package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.project.model.dao.ProjectDao;
import com.h4j.ITtranet.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertProject(Project p) {
		return 0;
	}

	@Override
	public ArrayList<Project> selectProject(String empNo){
		return pDao.selectProject(sqlSession, empNo);
	}

	@Override
	public int updateProject(Project p) {
		return 0;
	}
	

}
