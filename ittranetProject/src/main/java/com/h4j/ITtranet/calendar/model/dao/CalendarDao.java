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

}
