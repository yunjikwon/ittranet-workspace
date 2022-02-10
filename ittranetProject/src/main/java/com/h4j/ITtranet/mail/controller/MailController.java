package com.h4j.ITtranet.mail.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.mail.model.service.MailService;
import com.h4j.ITtranet.mail.model.vo.MailReceive;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.template.Pagination;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	@RequestMapping("alllist.ml")
	public String selectList(@RequestParam (value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = mService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<MailReceive> rvlist = mService.selectList(pi);

		
		model.addAttribute("pi", pi);
		model.addAttribute("lsit", rvlist);
		 
		return "mail/mailReceiveView";

	}

}
