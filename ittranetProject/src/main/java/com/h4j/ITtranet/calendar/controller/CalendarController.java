package com.h4j.ITtranet.calendar.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.h4j.ITtranet.calendar.model.service.CalendarService;
import com.h4j.ITtranet.calendar.model.vo.Calendar;

@Controller
public class CalendarController {

	
	@Autowired
	private CalendarService cService;
	
	// 사용자
	@RequestMapping("viewUserCal.ca")
	public String userCalendar() {
		return "calendar/calendar"; //userCalendar로 수정하기
	}
	
	@ResponseBody
	@RequestMapping(value="calList.ca", produces="application/json; charset=utf-8")
	public String ajaxSelectCalendar(String calSelector) {
		// System.out.println("일정 조회자 번호 : " + calSelector);
		ArrayList<Calendar> calendarList = cService.ajaxSelectCalendar();
		return new Gson().toJson(calendarList);
	}
	
	// 관리자
	@RequestMapping("viewAdminCal.ca")
	public String adminCalendar() {
		return "calendar/adminCalendar";
	}
	
	/*
	@RequestMapping("viewCalendar.ca")
	public String adminCalendar() {
		return "calendar/calendar";
	}
	*/
	
	
	
	
}
