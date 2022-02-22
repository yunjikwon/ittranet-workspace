package com.h4j.ITtranet.calendar.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.calendar.model.vo.Calendar;

public interface CalendarService {
	
	// 일정 조회
	ArrayList<Calendar> ajaxSelectCalendar(); 
	
	ArrayList<Calendar> adminSelectCalendar();
	
	// 일정 삽입
	int ajaxInsertCalendar(Calendar c);
	
	// 일정 수정
	
	// 일정 삭제

}
