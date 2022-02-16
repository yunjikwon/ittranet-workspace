package com.h4j.ITtranet.attendance.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.attendance.model.service.AttendanceService;
import com.h4j.ITtranet.attendance.model.vo.Vacation;
import com.h4j.ITtranet.employee.model.vo.Employee;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService atService;
	
	@RequestMapping("main.at")
	public String selectAttendanceMain() {
		return "attendance/attendanceMain";
	}
	
	
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
	
}
