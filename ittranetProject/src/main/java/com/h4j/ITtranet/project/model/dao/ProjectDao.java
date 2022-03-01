package com.h4j.ITtranet.project.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.project.model.vo.Prmember;
import com.h4j.ITtranet.project.model.vo.Project;

@Repository
public class ProjectDao {

	public ArrayList<Project> selectProject(SqlSessionTemplate sqlSession, String empNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProject", empNo);
	}

	public ArrayList<Project> selectEndProject(SqlSessionTemplate sqlSession, String empNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectEndProject", empNo);
	}

	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}

	public ArrayList<Prmember> searchMember(SqlSessionTemplate sqlSession, String search) {
		return (ArrayList)sqlSession.selectList("PrmemberMapper.searchMember", search);
	}

	public int insertPromem(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("prmemberMapper.insertPromem", p);
	}

	

}
