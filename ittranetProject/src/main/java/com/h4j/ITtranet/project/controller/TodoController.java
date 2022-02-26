package com.h4j.ITtranet.project.controller;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.project.model.service.TodoService;
import com.h4j.ITtranet.project.model.vo.Todo;

@Controller
public class TodoController {
	
	@Autowired
	private TodoService tService;
	
	@RequestMapping("todo.pr")
	public ModelAndView selectTodo(ModelAndView mv , HttpSession session) {
	
		int todoW = 0;
		int todoY = 0;
		int todoO = 0;
		int todoL = 0;
		int todoN = 0;
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String empNo = loginUser.getEmpNo();

	
		ArrayList<Todo> list = tService.selectTodo(empNo);
		ArrayList<Todo> count = tService.countTodo(empNo);
		// 업무 갯수 구하는 반복문
			for(Todo td : list) {
				if(td.getStatus().equals("W")) {
					todoW += td.getTodoNo()/td.getTodoNo();
				}else if(td.getStatus().equals("Y")) {
					todoY += td.getTodoNo()/td.getTodoNo();
				}else if(td.getStatus().equals("O")) {
					todoO += td.getTodoNo()/td.getTodoNo();
				}else if(td.getStatus().equals("L")) {
					todoL += td.getTodoNo()/td.getTodoNo();
				}else {
					todoN += td.getTodoNo()/td.getTodoNo();
				}				
			}
			System.out.println("대기 : " + todoW + ", 진행중 : " + todoY + ", 완료 : " + todoO + ", 지연 : " + todoL + ", 삭제 : " + todoN);
			int todoAll = todoW + todoY + todoO + todoL;
			
			System.out.println("업무 리스트 : " + list );
			System.out.println("프로젝트별 대기중 업무수  : " + count);

			// 지금 진행중인 프로젝트 중에서 업무를 갖고와야함
		mv.addObject("list", list)
		.addObject("todoW", todoW)
		.addObject("todoY", todoY)
		.addObject("todoO", todoO)
		.addObject("todoL", todoL)
		.addObject("todoN", todoN)
		.addObject("todoAll", todoAll)
		.addObject("count", count).setViewName("project/todo");
		

		return mv;

	}
	
	// 새 업무 추가하기
	@ResponseBody
	@RequestMapping(value="tdinsert.pr")
	public String newTodo(Todo td, String empNo, String prNo) {
		
		//System.out.println("여기까지는 되나? " + td);
		int result = tService.newTodo(td);
		
		return result>0 ? "success" : "fail";
	}

	// 업무 수정하기
	@ResponseBody
	@RequestMapping(value="tdupdate.pr")
	public String updateTodo(Todo td, String empNo, String prNo) {
		
		int result = tService.updateTodo(td);
		
		return result>0 ? "success" : "fail";
	}
	
	// 업무 선택 삭제
	@RequestMapping(value = "/delete")
	public String deleteTodo(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		System.out.println(ajaxMsg);
		
		for( int i=0; i<size; i++) {
			tService.deleteTodo(ajaxMsg[i]);
		}
		
		return "project/todo";
	}
}
