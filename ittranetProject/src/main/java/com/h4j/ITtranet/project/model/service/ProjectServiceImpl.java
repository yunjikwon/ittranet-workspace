package com.h4j.ITtranet.project.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.project.model.dao.ProjectDao;
import com.h4j.ITtranet.project.model.vo.Prmember;
import com.h4j.ITtranet.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertProject(Project p) {
		//return pDao.insertProject(sqlSession, p);
		int result1 = pDao.insertProject(sqlSession, p); // 프로젝트 테이블 insert
		
		int result2 = pDao.insertPromem(sqlSession, p); // prmember테이블 insert
		
		return result1 * result2;
	}

	@Override
	public ArrayList<Project> selectProject(String empNo){
		return pDao.selectProject(sqlSession, empNo);
	}
	
	@Override
	public ArrayList<Project> selectEndProject(String empNo){
		return pDao.selectEndProject(sqlSession, empNo);
	}

	@Override
	public int updateProject(Project p) {
		return 0;
	}

	@Override
	public ArrayList<Prmember> searchMember(String search) {
		return pDao.searchMember(sqlSession, search);
	}

	@Override
	public int insertPromem(Project p) {
		return pDao.insertPromem(sqlSession, p);
	}

	public String selectProjectTitle(int prNo) {
		return pDao.selectProjectTitle(sqlSession, prNo);
	}

	@Override
	public ArrayList<Project> mainProject(String empNo) {
		return pDao.mainProject(sqlSession, empNo);
	}
	

}
