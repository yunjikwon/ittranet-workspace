package com.h4j.ITtranet.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.project.model.service.ProjectService;
import com.h4j.ITtranet.project.model.vo.Project;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService pService;
	
	@RequestMapping("list.pr")
	public ModelAndView selectProject(ModelAndView mv, HttpSession session){
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String empNo = loginUser.getEmpNo();
		
		ArrayList<Project> list1 = pService.selectProject(empNo);
		ArrayList<Project> list2 = pService.selectEndProject(empNo);
		
		mv.addObject("list1", list1).setViewName("project/projectList");
		mv.addObject("list2", list2).setViewName("project/projectList");
		
		System.out.println("진행중 :" + list1);
		System.out.println("종료된 : " + list2);
		return mv ;
	}
	
}
