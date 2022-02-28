package com.h4j.ITtranet.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.employee.model.dao.EmployeeDao;
import com.h4j.ITtranet.employee.model.vo.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao eDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Employee loginMember(Employee e) {
		Employee loginUser = eDao.loginMember(sqlSession, e);
		return loginUser;
	}

	@Override
	public int mailCheck(String checkMail) {
		return eDao.mailCheck(sqlSession, checkMail);
	}
	
	@Override
	public int idCheck(String checkId) {
		return eDao.idCheck(sqlSession, checkId);
	}
	
	@Override
	public Employee whosMail(String accordMail) {
		return eDao.whosMail(sqlSession, accordMail);
	}
	
	@Override
	public int setTempwd(Employee e) {
		return eDao.setTempwd(sqlSession, e);
	}

	@Override
	public int insertMember(Employee e) {
		int result = eDao.insertMember(sqlSession, e);
		return result;
	}

	@Override
	public int updateMember(Employee e) {
		return eDao.updateMember(sqlSession, e);
	}

	@Override
	public int deleteMember(String empNo) {
		return eDao.deleteMember(sqlSession, empNo);
	}


	@Override
	public int updatePwd(Employee e) {
		return eDao.updatePwd(sqlSession, e);
	}

	@Override
	public int selectWemployeeCount() {
		return eDao.selectWemployeeCount(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectWemployee(PageInfo pi) {
		return eDao.selectWemployee(sqlSession, pi);
	}

	@Override
	public int confirmMember(Employee e) {
		return eDao.confirmMember(sqlSession, e);
	}

	@Override
	public int selectAllemployeeCount() {
		return eDao.selectAllemployeeCount(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectAllemployee(PageInfo pi) {
		return eDao.selectAllemployee(sqlSession, pi);
	}

	@Override
	public ArrayList<Employee> selectAllemployee2() {
		return eDao.selectAllemployee2(sqlSession);
	}


	
}
