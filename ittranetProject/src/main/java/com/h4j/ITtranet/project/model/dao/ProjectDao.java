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
		
		int result = 0;
		ArrayList<Employee> list = p.getNewprMem();
		
		for(Employee e : list) {
			result += sqlSession.insert("PrmemberMapper.insertPromem", e);
		}
		
		//return sqlSession.insert("prmemberMapper.insertPromem", p);
		
		return result;
	}

	public String selectProjectTitle(SqlSessionTemplate sqlSession, int prNo) {
		return sqlSession.selectOne("projectMapper.selectProjectTitle", prNo);
	}

	public ArrayList<Project> mainProject(SqlSessionTemplate sqlSession, String empNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.mainProject", empNo);
	}

	

}
