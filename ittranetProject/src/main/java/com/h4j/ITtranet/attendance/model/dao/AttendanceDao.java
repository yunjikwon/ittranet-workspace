package com.h4j.ITtranet.attendance.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}
