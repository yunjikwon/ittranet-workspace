package com.h4j.ITtranet.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int deleteMember(String empId) {
		return 0;
	}

	@Override
	public int updatePwd(String empPwd) {
		return 0;
	}


	
}
