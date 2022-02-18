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
	
	@RequestMapping("viewCalendar.ca")
	public String adminCalendar() {
		return "calendar/calendar";
	}
	
	@ResponseBody
	@RequestMapping(value="calList.ca", produces="application/json; charset=utf-8")
	public String ajaxSelectCalendar() {
		ArrayList<Calendar> calendarList = cService.ajaxSelectCalendar();
		//return "calendar/calendar";
		return new Gson().toJson(calendarList);
	}
	
	/*
	@RequestMapping("viewCalendar.ca")
	public String adminCalendar() {
		return "calendar/calendar";
	}
	*/
	
	
	
	
}
