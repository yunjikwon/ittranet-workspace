package com.h4j.ITtranet.attendance.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.attendance.model.vo.Attendance;
import com.h4j.ITtranet.attendance.model.vo.Vacation;
import com.h4j.ITtranet.common.model.vo.PageInfo;

public interface AttendanceService {

	// 사용자 예정휴가신청 리스트
	ArrayList<Vacation> selectUpVacationList(String empNo);
	// 사용자 지난휴가신청 리스트
	ArrayList<Vacation> selectLastVacationList(String empNo);
	
	// 관리자 미처리 휴가신청 리스트
	int selectYetVacationListCount();
	ArrayList<Vacation> selectYetVacationList(PageInfo pi);
	
	// 관리자 처리완료 휴가신청 리스트
	int selectFinVacationListCount();
	ArrayList<Vacation> selectFinVacationList(PageInfo pi);
	
	// 관리자 일일근태 조회
	int selectAdminDayAttendanceCount();
	ArrayList<Attendance> selectAdminDayAttendance(PageInfo pi);
	
	// 관리자 근무통계 조회
	ArrayList<Attendance> selectAdminYear(String date);

	
	
	
	
	
	
	
	
	
	
	
	

}
