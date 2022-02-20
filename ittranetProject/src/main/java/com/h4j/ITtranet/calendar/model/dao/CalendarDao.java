package com.h4j.ITtranet.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.calendar.model.vo.Calendar;

@Repository
public class CalendarDao {
	
	public ArrayList<Calendar> ajaxSelectCalendar(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("calendarMapper.ajaxSelectCalendar");
	}
	
	public ArrayList<Calendar> adminSelectCalendar(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("calendarMapper.adminSelectCalendar");
	}
	
	public int ajaxInsertCalendar(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("calendarMapper.ajaxInsertCalendar", c);
	}

}
