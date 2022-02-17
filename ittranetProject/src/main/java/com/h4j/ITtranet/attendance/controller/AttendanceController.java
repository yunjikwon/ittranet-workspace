package com.h4j.ITtranet.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("main.at")
	public String selectAttendanceMain() {
		return "attendance/attendanceMain";
	}
	
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
	
	
	
	
	
	
	

	
	
	
}
