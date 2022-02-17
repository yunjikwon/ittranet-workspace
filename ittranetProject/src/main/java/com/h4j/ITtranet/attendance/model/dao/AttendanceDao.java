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
	
	
	
	
	
	
	
	
	
	
	
	
}
