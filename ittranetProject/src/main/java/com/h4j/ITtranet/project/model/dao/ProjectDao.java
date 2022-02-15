package com.h4j.ITtranet.project.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.project.model.vo.Project;

@Repository
public class ProjectDao {

	public ArrayList<Project> selectProject(SqlSessionTemplate sqlSession, String empNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProject", empNo);
	}
	

}
