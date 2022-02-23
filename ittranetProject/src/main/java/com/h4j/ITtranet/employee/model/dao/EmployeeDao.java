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
	
	public int mailCheck(SqlSessionTemplate sqlSession, String checkMail) {
		return sqlSession.selectOne("memberMapper.mailCheck", checkMail);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	public Employee whosMail(SqlSessionTemplate sqlSession, String accordMail) {
		return sqlSession.selectOne("memberMapper.whosMail", accordMail);
	}
	
	public int setTempwd(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("memberMapper.setTempwd", e);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("memberMapper.updateMember", e);
	}
	

}
