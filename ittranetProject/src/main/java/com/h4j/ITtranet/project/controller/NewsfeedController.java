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
		
		ArrayList<Newsfeed> list1 = nService.selectNews(empNo);
		ArrayList<Newsfeed> list2 = nService.newsProject(empNo);
		
		mv.addObject("list1", list1).setViewName("project/newsfeed");
		mv.addObject("list2", list2).setViewName("project/newsfeed");
		
		System.out.println("뉴스피드 db : " + list1);
		System.out.println("뉴스피드 프로젝트 db : " + list2);
		return mv;
	}
	
	@RequestMapping("feed.pr")
	public ModelAndView prNewsfeed(String prNo, ModelAndView mv) {
		
		ArrayList<Newsfeed> list = nService.prNewsfeed(prNo);
		mv.addObject("list", list).setViewName("project/project");
		System.out.println("프로젝트 뉴스피드 db : " + list);
		return mv;		
	}
	

}
