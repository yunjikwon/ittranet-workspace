package com.h4j.ITtranet.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.attendance.model.dao.AttendanceDao;
import com.h4j.ITtranet.attendance.model.vo.Attendance;
import com.h4j.ITtranet.attendance.model.vo.Vacation;
import com.h4j.ITtranet.common.model.vo.PageInfo;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceDao atDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Vacation> selectUpVacationList(String empNo) {
		return atDao.selectUpVacationList(sqlSession, empNo);
	}

	@Override
	public ArrayList<Vacation> selectLastVacationList(String empNo) {
		return atDao.selectLastVacationList(sqlSession, empNo);
	}
	
	@Override
	public int selectYetVacationListCount() {
		return atDao.selectYetVacationListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Vacation> selectYetVacationList(PageInfo pi) {
		return atDao.selectYetVacationList(sqlSession, pi);
	}


	@Override
	public int selectFinVacationListCount() {
		return atDao.selectFinVacationListCount(sqlSession);
	}

	@Override
	public ArrayList<Vacation> selectFinVacationList(PageInfo pi) {
		return atDao.selectFinVacationList(sqlSession, pi);
	}

	@Override
	public int selectAdminDayAttendanceCount() {
		return atDao.selectAdminDayAttendanceCount(sqlSession);
	}

	@Override
	public ArrayList<Attendance> selectAdminDayAttendance(PageInfo pi) {
		return atDao.selectAdminDayAttendance(sqlSession, pi);
	}

	@Override
	public ArrayList<Attendance> selectAdminLate(String date) {
		return atDao.selectAdminLate(sqlSession, date);
	}
	
	/*
	@Override
	public ArrayList<Attendance> selectAdminEarly(String date) {
		return atDao.selectAdminEarly(sqlSession, date);
	}
	*/


	
	
	
	
	
	
	
	
	
	
	
	
}
