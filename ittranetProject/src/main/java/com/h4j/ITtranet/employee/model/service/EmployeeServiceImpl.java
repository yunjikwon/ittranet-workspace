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
	public int idCheck(String checkId) {
		return 0;
	}

	@Override
	public int insertMember(Employee e) {
		return 0;
	}

	@Override
	public int updateMember(Employee e) {
		return 0;
	}

	@Override
	public int deleteMember(String empId) {
		return 0;
	}
	
}
