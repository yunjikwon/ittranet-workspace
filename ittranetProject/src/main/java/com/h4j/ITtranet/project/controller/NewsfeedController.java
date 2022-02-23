package com.h4j.ITtranet.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.project.model.service.NewsfeedService;
import com.h4j.ITtranet.project.model.vo.Newsfeed;
import com.h4j.ITtranet.project.model.vo.Todo;

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
		
		mv.addObject("list1", list1).addObject("list2", list2).setViewName("project/newsfeed");
		
		System.out.println("뉴스피드 db : " + list1);
		System.out.println("뉴스피드 프로젝트 db : " + list2);
		return mv;
	}
	
	@RequestMapping("feed.pr")
	public ModelAndView prNewsfeed(String prNo, ModelAndView mv) {
		
		ArrayList<Newsfeed> list = nService.prNewsfeed(prNo);
		ArrayList<Todo> todo = nService.prTodo(prNo);
		
		mv.addObject("list", list).addObject("todo", todo).setViewName("project/project");
		System.out.println("프로젝트 뉴스피드 db : " + list);
		System.out.println("프로젝트 업무 db : " + todo);
		return mv;		
	}
	
	@ResponseBody
	@RequestMapping(value="ninsert.pr")
	public String ajaxInsertReply(Newsfeed n) {
		int result = nService.insertFeed(n);
		return result>0 ? "success" : "fail";
	}
	
	@RequestMapping("ndelete.pr")
	public String deleteFeed(int nfNo, HttpSession session, Model model) {
		
		int result = nService.deleteFeed(nfNo);
		
		if(result > 0) {
			// 삭제 성공 
			// 게시판 리스트페이지   feed.pr  url재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:feed.pr";
			
		}else {
			// 삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	/*
	@RequestMapping("nupdateForm.pr")
	public String updateForm(int nfNo, Model model) {
		model.addAttribute("n", nService.prNewsfeed(nfNo));
		return "project/boardUpdateForm";
	}
	*/
	

}
