package com.h4j.ITtranet.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.employee.model.vo.Employee;

@Repository
public class EmployeeDao {
	
	public Employee loginMember(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("memberMapper.loginMember",e);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("memberMapper.insertMember", e);
	}

}
