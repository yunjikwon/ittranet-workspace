package com.h4j.ITtranet.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.common.model.vo.PageInfo;
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
	
	public int deleteMember(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.update("memberMapper.deleteMember", empNo);
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("memberMapper.updatePwd", e);
	}
	
	public int selectWemployeeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectWemployeeCount");
	}
	
	public ArrayList<Employee> selectWemployee(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("memberMapper.selectWemployee", null, rowBounds);
	}
	
	public int selectAllemployeeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectAllemployeeCount");
	}
	
	public ArrayList<Employee> selectAllemployee(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("memberMapper.selectAllemployee", null, rowBounds);
	}
	
	public ArrayList<Employee> selectAllemployee2(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("memberMapper.selectAllemployee2");
	}
	
	public int confirmMember(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("memberMapper.confirmMember", e);
	}
	

}
