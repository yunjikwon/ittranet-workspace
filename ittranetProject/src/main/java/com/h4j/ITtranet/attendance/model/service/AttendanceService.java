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
	
	// 사용자 출근
	int insertArrive(String empNo);
	// 사용자 출근 시 근태 업데이트
	int updateArriveStatus(String empNo);
	
	// 사용자 퇴근
	int updateLeave(String empNo);
	// 사용자 퇴근 시 근태 업데이트
	int updateLeaveStatus(String empNo);
	
	// 사용자 외출
	int updateStepout(String empNo);
	
	// 사용자 외근
	int updateOutwork(String empNo);
	
	// 사용자 출퇴근기록 조회
	Attendance ajaxSelectAttendance(String empNo);
	
	// 사용자 잔여휴가 조회
	Vacation selectRestVacation(String empNo);
	
	// 휴가 신청
	int insertVacation(Vacation vc);
	// 휴가 신청 시 총휴가시간 수정
	int updateVacationSum(String empNo);
	
	// 관리자 휴가신청 상세조회
	Vacation selectVacationDetail(int vcno);
	
	
	
	
	
	
	

}
