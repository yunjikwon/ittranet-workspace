package com.h4j.ITtranet.calendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.calendar.model.dao.CalendarDao;
import com.h4j.ITtranet.calendar.model.vo.Calendar;
import com.h4j.ITtranet.employee.model.dao.EmployeeDao;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Calendar> ajaxSelectCalendar() {
		return cDao.ajaxSelectCalendar(sqlSession);
	}

	@Override
	public ArrayList<Calendar> adminSelectCalendar() {
		return cDao.adminSelectCalendar(sqlSession);
	}

	@Override
	public int ajaxInsertCalendar(Calendar c) {
		return cDao.ajaxInsertCalendar(sqlSession, c);
	}

}
