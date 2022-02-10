package com.h4j.ITtranet.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.project.model.service.ProjectService;
import com.h4j.ITtranet.project.model.vo.Project;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService pService;
	
	@RequestMapping("list.pr")
	public String selectProject() {
		return "project/projectList";
	}
	
}
