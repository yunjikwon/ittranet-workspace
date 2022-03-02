package com.h4j.ITtranet.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.project.model.service.ProjectService;
import com.h4j.ITtranet.project.model.vo.Prmember;
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
	
	@RequestMapping("newpro.pr")
	public String newProject() {
		return "project/newProject";
	}

	
	@RequestMapping("npro.pr")
	public String newProject(Project p, HttpSession session) {
		
		//Employee loginUser = (Employee)session.getAttribute("loginUser");
		//String empNo = loginUser.getEmpNo();
		
		int result = pService.insertProject(p);
		
		session.setAttribute("alertMsg", "새로운 프로젝트를 생성했습니다.");
		return "redirect:list.pr";
	}
	
	@ResponseBody
	@RequestMapping(value ="addmem.pr", produces="application/json; charset=utf-8")
	public String searchMember(String search) {
		
		ArrayList<Prmember> list = pService.searchMember(search);
		//System.out.println("클릭했을때 list : " + list);
		return new Gson().toJson(list);
		
	}
	
}
