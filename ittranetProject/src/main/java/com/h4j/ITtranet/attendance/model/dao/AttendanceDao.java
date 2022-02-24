package com.h4j.ITtranet.attendance.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.attendance.model.vo.Attendance;
import com.h4j.ITtranet.attendance.model.vo.Vacation;
import com.h4j.ITtranet.common.model.vo.PageInfo;

@Repository
public class AttendanceDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("attendanceMapper.selectListCount");
	}
	
	public ArrayList<Vacation> selectUpVacationList(SqlSessionTemplate sqlSession, String empNo){
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectUpVacationList", empNo);
	}
	
	public ArrayList<Vacation> selectLastVacationList(SqlSessionTemplate sqlSession, String empNo){
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectLastVacationList", empNo);
	}

	public int selectYetVacationListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("attendanceMapper.selectYetVacationListCount");
	}

	public ArrayList<Vacation> selectYetVacationList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectYetVacationList", null, rowBounds);
	}
	

	public int selectFinVacationListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("attendanceMapper.selectFinVacationListCount");
	}
	
	public ArrayList<Vacation> selectFinVacationList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectFinVacationList", null, rowBounds);
	}
	
	public int selectAdminDayAttendanceCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("attendanceMapper.selectAdminDayAttendanceCount");
	}
	
	public ArrayList<Attendance> selectAdminDayAttendance(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAdminDayAttendance", null, rowBounds);
	}
	
	public ArrayList<Attendance> selectAdminYear(SqlSessionTemplate sqlSession, String date){
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAdminYear", date);
	}
	
	public int insertArrive(SqlSessionTemplate sqlSession, String empNo) {
		
		return sqlSession.insert("attendanceMapper.insertArrive", empNo);
	}
	
	public int updateArriveStatus(SqlSessionTemplate sqlSession, String empNo) {
		
		return sqlSession.update("attendanceMapper.updateArriveStatus", empNo);
	}
	
	public int updateLeave(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.update("attendanceMapper.updateLeave", empNo);
	}
	
	public int updateLeaveStatus(SqlSessionTemplate sqlSession, String empNo) {
		
		return sqlSession.update("attendanceMapper.updateLeaveStatus", empNo);
	}
	
	public int updateStepout(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.update("attendanceMapper.updateStepout", empNo);
	}
	
	public int updateOutwork(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.update("attendanceMapper.updateOutwork", empNo);
	}
	
	public Attendance ajaxSelectAttendance(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("attendanceMapper.ajaxSelectAttendance", empNo);
	}
	
	public Vacation selectRestVacation(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("attendanceMapper.selectRestVacation", empNo);
	}
	
	
	public int insertVacation(SqlSessionTemplate sqlSession, Vacation vc) {
		return sqlSession.insert("attendanceMapper.insertVacation",vc);
	}
	
	public int updateVacationSum(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.update("attendanceMapper.updateVacationSum", empNo);
	}
	
	public Vacation selectVacationDetail(SqlSessionTemplate sqlSession, int vcno) {
		return sqlSession.selectOne("attendanceMapper.selectVacationDetail", vcno);
	}
	
	
}
