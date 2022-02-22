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
	public ArrayList<Calendar> ajaxSelectCalendar(String empNo) {
		return cDao.ajaxSelectCalendar(sqlSession, empNo);
	}

	@Override
	public ArrayList<Calendar> adminSelectCalendar() {
		return cDao.adminSelectCalendar(sqlSession);
	}

	@Override
	public int ajaxInsertCalendar(Calendar c) {
		return cDao.ajaxInsertCalendar(sqlSession, c);
	}

	@Override
	public int ajaxDeleteCalendar(String calNo) {
		return cDao.ajaxDeleteCalendar(sqlSession, calNo);
	}

	@Override
	public int ajaxUpdateCalendar(Calendar c) {
		return cDao.ajaxUpdateCalendar(sqlSession, c);
	}

	@Override
	public int adminInsertCalendar(Calendar c) {
		return cDao.adminInsertCalendar(sqlSession, c);
	}

}
