package com.h4j.ITtranet.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.attendance.model.dao.AttendanceDao;
import com.h4j.ITtranet.attendance.model.vo.Attendance;
import com.h4j.ITtranet.attendance.model.vo.Vacation;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.company.model.vo.Company;

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
	public ArrayList<Attendance> selectAdminYear() {
		return atDao.selectAdminYear(sqlSession);
	}
	
	@Override
	public int insertArrive(String empNo) {
		return atDao.insertArrive(sqlSession, empNo);
	}

	@Override
	public int updateArriveStatus(String empNo) {
		return atDao.updateArriveStatus(sqlSession, empNo);
	}

	@Override
	public int updateLeave(String empNo) {
		return atDao.updateLeave(sqlSession, empNo);
	}

	@Override
	public int updateLeaveStatus(String empNo) {
		return atDao.updateLeaveStatus(sqlSession, empNo);
	}	

	@Override
	public int updateStepout(String empNo) {
		return atDao.updateStepout(sqlSession, empNo);
	}

	@Override
	public int updateOutwork(String empNo) {
		return atDao.updateOutwork(sqlSession, empNo);
	}
	
	@Override
	public Attendance ajaxSelectAttendance(String empNo) {
		return atDao.ajaxSelectAttendance(sqlSession, empNo);
	}

	@Override
	public Vacation selectRestVacation(String empNo) {
		return atDao.selectRestVacation(sqlSession, empNo);
	}

	@Override
	public int insertVacation(Vacation vc) {
		return atDao.insertVacation(sqlSession, vc);
	}

	@Override
	public int updateVacationSum(String empNo) {
		return atDao.updateVacationSum(sqlSession, empNo);
	}

	@Override
	public Vacation selectVacationDetail(int vcno) {
		return atDao.selectVacationDetail(sqlSession, vcno);
	}

	@Override
	public int updateVcRefuse(int vcno) {
		return atDao.updateVcRefuse(sqlSession, vcno);
	}

	@Override
	public int updateVcApproval(int vcno) {
		return atDao.updateVcApproval(sqlSession, vcno);
	}

	@Override
	public ArrayList<Attendance> selectTeam() {
		return atDao.selectTeam(sqlSession);
	}

	@Override
	public ArrayList<Attendance> stSearchList(Attendance at) {
		return atDao.stSearchList(sqlSession, at);
	}

	@Override
	public Attendance selectMainAttendance(String empNo) {
		return atDao.selectMainAttendance(sqlSession, empNo);
	}

	@Override
	public Vacation selectMainVacation(String empNo) {
		return atDao.selectMainVacation(sqlSession, empNo);
	}

	@Override
	public ArrayList<Attendance> atSearchList(Attendance at) {
		return atDao.atSearchList(sqlSession, at);
	}

	


	
	
	
	
	
	
	
	
	
	
	
	
}
