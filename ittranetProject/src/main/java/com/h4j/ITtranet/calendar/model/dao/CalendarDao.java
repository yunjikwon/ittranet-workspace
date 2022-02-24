package com.h4j.ITtranet.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.calendar.model.vo.Calendar;

@Repository
public class CalendarDao {
	
	public ArrayList<Calendar> ajaxSelectCalendar(SqlSessionTemplate sqlSession, String empNo){
		return (ArrayList)sqlSession.selectList("calendarMapper.ajaxSelectCalendar", empNo);
	}
	
	public ArrayList<Calendar> adminSelectCalendar(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("calendarMapper.adminSelectCalendar");
	}
	
	public int ajaxInsertCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("calendarMapper.ajaxInsertCalendar", c);
	}
	
	public int ajaxDeleteCalendar(SqlSessionTemplate sqlSession, String calNo) {
		return sqlSession.delete("calendarMapper.ajaxDeleteCalendar", calNo);
	}
	
	public int ajaxUpdateCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.update("calendarMapper.ajaxUpdateCalendar", c);
	}
	
	public int adminInsertCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("calendarMapper.adminInsertCalendar", c);
	}

}
