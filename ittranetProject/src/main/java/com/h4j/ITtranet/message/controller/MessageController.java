package com.h4j.ITtranet.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.h4j.ITtranet.message.model.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService mService;
	
	// 1. 메세지함 이동 서비스
	@RequestMapping("list.ms")
	public String messageMain() {
		return "message/rmsgListView";
	}
}
