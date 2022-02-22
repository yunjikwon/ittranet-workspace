package com.h4j.ITtranet.calendar.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.calendar.model.vo.Calendar;

public interface CalendarService {
	
	// 일정 조회
	ArrayList<Calendar> ajaxSelectCalendar(String empNo); 

	// 일정 삽입
	int ajaxInsertCalendar(Calendar c);
	
	// 일정 삭제
	int ajaxDeleteCalendar(String calNo);
	
	// 일정 수정
	int ajaxUpdateCalendar(Calendar c);
	
	// 관리자 일정 조회
	ArrayList<Calendar> adminSelectCalendar();
	
	// 관리자 일정 삽입
	int adminInsertCalendar(Calendar c);
	

}
