package com.h4j.ITtranet.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.employee.model.service.EmployeeService;
import com.h4j.ITtranet.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	
	// 로그인
	@RequestMapping("hi.me")
	public ModelAndView loginMember(Employee e, HttpSession session, ModelAndView mv) {
		
		Employee loginUser = eService.loginMember(e);
		
		if(loginUser == null) {
			mv.setViewName("common/error");
		} else {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("common/userMain");
		}
		
		return mv;
	}
	
	// 로그아웃
	@RequestMapping("bye.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입페이지 호출(메일 => 링크 클릭 => 회원가입 페이지(당연히 서버 돌고 있어야 함)
	// 링크 주소 : http://localhost:8174/ITtranet/joinForm.me
	@RequestMapping("joinForm.me")
	public String joinForm() {
		return "member/joinForm";
	}
	
	// 회원가입 요청 => DB에 정보 담김 but 상태(status)는 W(wait)
	// 관리자가 가입 승인을 하면 status가 Y로 바뀌고 로그인 가능
	// * 회원가입 요청시에는 status W로 insert
	@RequestMapping("join.me")
	public void joinMember(Employee e) {
		System.out.println(e);
	}
	

}
