package com.h4j.ITtranet.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.h4j.ITtranet.calendar.model.service.CalendarService;

@Controller
public class CalendarController {

	@Autowired
	private CalendarService cService;
	
	
	
}
