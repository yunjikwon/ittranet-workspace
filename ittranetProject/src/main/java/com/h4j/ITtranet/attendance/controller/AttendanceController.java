package com.h4j.ITtranet.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.h4j.ITtranet.attendance.model.service.AttendanceService;
import com.h4j.ITtranet.attendance.model.vo.Attendance;
import com.h4j.ITtranet.attendance.model.vo.Vacation;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.template.Pagination;
import com.h4j.ITtranet.employee.model.vo.Employee;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService atService;
	
	//사용자 휴가신청 리스트 조회
	@RequestMapping("vclist.at")
	public ModelAndView selectVacationList(ModelAndView mv, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String empNo = loginUser.getEmpNo();
		
		ArrayList<Vacation> ulist = atService.selectUpVacationList(empNo);
		ArrayList<Vacation> llist = atService.selectLastVacationList(empNo);
		
		mv.addObject("ulist", ulist).setViewName("attendance/vacationApplyList");
		mv.addObject("llist", llist).setViewName("attendance/vacationApplyList");

		return mv;
	}
	
	//관리자 미처리 휴가신청 리스트 조회
	@RequestMapping("yvclist.ad")
	public ModelAndView selectAdminYetVacationList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = atService.selectYetVacationListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Vacation> list = atService.selectYetVacationList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("attendance/adminVacationApplyList");
		
		return mv;	
	}
	
	//관리자 처리완료 휴가신청 리스트 조회
	@RequestMapping("fvclist.ad")
	public ModelAndView selectAdminFinVacationList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = atService.selectFinVacationListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Vacation> list = atService.selectFinVacationList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("attendance/adminFinVacationApplyList");
		
		return mv;	
	}
	
	//관리자 일일근태 조회
	@RequestMapping("dayat.ad")
	public ModelAndView selectAdminDayAttendance(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = atService.selectAdminDayAttendanceCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Attendance> list = atService.selectAdminDayAttendance(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("attendance/adminAttendanceDay");
		
		return mv;	
	}
	
	// 관리자 근무통계 조회
	@RequestMapping("yearat.ad")
	public ModelAndView selectAdminYearAttendance(ModelAndView mv, HttpSession session) {
		
		String date = new SimpleDateFormat("yyyy").format(new Date());
		
		ArrayList<Attendance> list = atService.selectAdminYear(date);
		
		mv.addObject("list", list).setViewName("attendance/adminAttendanceYear");

		return mv;
			
	}
	
	
	// 내 근무 페이지
	@RequestMapping("main.at")
	public String attendanceMain() {
		return "attendance/attendanceMain";
	}
	
	// 사용자 출근
	@ResponseBody
	@RequestMapping(value="arrive.at")
	public String insertArrive(String empNo) {
		
		int result1 = atService.insertArrive(empNo);
		int result2 = atService.updateArriveStatus(empNo);
		
		return result1>0 && result2>0? "success" : "fail";
		
	}
	
	// 사용자 퇴근
	@ResponseBody
	@RequestMapping(value="leave.at")
	public String updateLeave(String empNo) {
		
		int result1 = atService.updateLeave(empNo);
		int result2 = atService.updateLeaveStatus(empNo);
		
		return result1>0 && result2>0? "success" : "fail";
		
	}
	
	// 사용자 외출
	@ResponseBody
	@RequestMapping(value="stepout.at")
	public String updateStepout(String empNo) {
		
		int result = atService.updateStepout(empNo);
		
		return result>0 ? "success" : "fail";
		
	}
	
	// 사용자 외근
	@ResponseBody
	@RequestMapping(value="outwork.at")
	public String updateOutwork(String empNo) {
		
		int result = atService.updateOutwork(empNo);
		
		return result>0 ? "success" : "fail";
		
	}
		
		
	
	// 출퇴근기록 조회
	@ResponseBody
	@RequestMapping(value="list.at", produces="application/json; charset=UTF-8")
	public String ajaxSelectAttendance(String empNo, HttpSession session) {
		
		Attendance at = atService.ajaxSelectAttendance(empNo);
		
		return new Gson().toJson(at);
	}
	
	
	
	
	

	
	
	
}
