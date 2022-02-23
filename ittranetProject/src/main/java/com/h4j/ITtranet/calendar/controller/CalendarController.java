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
	
	// ================ 사용자 ================
	@RequestMapping("viewUserCal.ca")
	public String userCalendar() {
		return "calendar/userCalendar"; //userCalendar로 수정하기
	}
	
	/**
	 * 사용자 캘린더 조회
	 * @param empNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="calList.ca", produces="application/json; charset=utf-8")
	public String ajaxSelectCalendar(String empNo) {
		// System.out.println("일정 조회자 번호 : " + empNo);
		ArrayList<Calendar> calendarList = cService.ajaxSelectCalendar(empNo);
		return new Gson().toJson(calendarList);
	}
	
	/**
	 * 사용자 일정 삽입
	 * @param c
	 * @return String 결과값
	 */
	@ResponseBody
	@RequestMapping("insertUserCal.ca")
	public String ajaxInsertCalendar(Calendar c) {
		// System.out.println(c);
		int result = cService.ajaxInsertCalendar(c);
		return result>0 ? "success" : "fail";
	}
	
	/**
	 * 사용자 일정 삭제
	 * @param calNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteUserCal.ca")
	public String ajaxDeleteCalendar(String calNo) {
		// System.out.println("삭제 일정 넘버 : " + calNo);
		int result = cService.ajaxDeleteCalendar(calNo);
		return result>0 ? "success" : "fail";
	}
	
	/**
	 * 일정 수정
	 * @param c
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updateUserCal.ca")
	public String ajaxUpdateCalendar(Calendar c) {
		// System.out.println(c);
		int result = cService.ajaxUpdateCalendar(c);
		return result>0 ? "success" : "fail";
	}
	
	// ================ 관리자 ================
	@RequestMapping("viewAdminCal.ca")
	public String adminCalendar() {
		return "calendar/adminCalendar";
	}
	
	@ResponseBody
	@RequestMapping(value="adminCalList.ca", produces="application/json; charset=utf-8")
	public String adminSelectCalendar(String calSelector) {
		ArrayList<Calendar> calendarList = cService.adminSelectCalendar();
		return new Gson().toJson(calendarList);
	}
	
	/**
	 * 관리자 일정 삽입
	 * @param c
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="insertAdminCa.ca") // 여기에 produces를 넣어서 ajax통신에 실패했던 거였음!!
	public String adminInsertCalendar(Calendar c) {
		int result = 0;
		result = cService.adminInsertCalendar(c);
		// System.out.println(result);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}

	
	
	
	
}
