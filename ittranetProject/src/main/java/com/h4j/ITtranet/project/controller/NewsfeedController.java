package com.h4j.ITtranet.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.project.model.service.NewsfeedService;
import com.h4j.ITtranet.project.model.vo.Newsfeed;

@Controller
public class NewsfeedController {
	
	@Autowired
	private NewsfeedService nService;
	
	@RequestMapping("news.pr")
	public ModelAndView selectNews(ModelAndView mv, HttpSession session) {
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String empNo = loginUser.getEmpNo();
		
		ArrayList<Newsfeed> list = nService.selectNews(empNo);
		mv.addObject("list", list).setViewName("project/newsfeed");
		System.out.println("뉴스피드 db : " + list);
		return mv;
	}
	

}
