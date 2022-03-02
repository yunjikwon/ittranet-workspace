package com.h4j.ITtranet.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.calendar.model.vo.Calendar;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.employee.model.vo.Employee;

@Repository
public class EmployeeDao {
	
	// 로그인
	public Employee loginMember(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("memberMapper.loginMember",e);
	}
	
	// ===================== 관리자 계정 접속시 ==============================
	public int selectYemployeeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectYemployeeCount");
	}
	
	public int selectD0employeeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectD0employeeCount");
	}
	
	public int selectD1employeeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectD1employeeCount");
	}
	
	public int selectD2employeeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectD2employeeCount");
	}
	
	public int selectD3employeeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectD3employeeCount");
	}
	
	public int selectD4employeeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectD4employeeCount");
	}
	
	public int selectD5employeeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectD5employeeCount");
	}
	
	public int selectD6employeeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectD6employeeCount");
	}
	
	public int selectD7employeeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectD7employeeCount");
	}
	
	public ArrayList<Calendar> selectAdminSchedule(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectAdminSchedule");
	}
	// =================================================================
	// ===================== 유저 계정 접속 오늘 일정 조회 =====================
	public ArrayList<Calendar> selectUserSchedule(SqlSession sqlSession, String empNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectUserSchedule", empNo);
	}

	// ================================================================
		
	
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
	
	// 승인대기회원조회
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
	
	public ArrayList<Employee> selectEmpJobList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectAllemployee2");
	}
	
	public ArrayList<Employee> selectAllemployeeByDept(SqlSessionTemplate sqlSession, String deptCode){
		return (ArrayList)sqlSession.selectList("memberMapper.selectAllemployeeByDept", deptCode);
	}

}
