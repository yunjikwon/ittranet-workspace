package com.h4j.ITtranet.message.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.template.Pagination;
import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.message.model.service.MessageService;
import com.h4j.ITtranet.message.model.vo.Message;

@Controller
public class MessageController {

	@Autowired
	private MessageService mService;
	
	// 1. 받은메세지함 이동 서비스
	@RequestMapping("list.ms")
	public ModelAndView selectRMsgList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		
		int empNo = Integer.parseInt(((Employee)session.getAttribute("loginUser")).getEmpNo());
		//System.out.println(empNo);
		int listCount = mService.selectRMsgCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Message> list = mService.selectRMsgList(pi, empNo);
		
		//System.out.println(pi);
		//System.out.println(list);
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("message/rmsgListView");
		
		return mv;
	}
	
	// 2. 사원 자동검색 서비스
	@ResponseBody
	@RequestMapping(value="searchEmp.ms", produces="application/json; charset=utf-8")
	public String ajaxSearchEmp(String keyword) {
		ArrayList<Message> list = mService.selectEmpList(keyword);
		return new Gson().toJson(list);
	}
	
	// 3. 메세지 전송 서비스 (insert)
	@RequestMapping("sendMsg.ms")
	public String insertMsg( int[] rEmpNo, int sEmpNo, Message msg, String content, HttpSession session) {
		
		// send테이블 저장 (senderNo, msgContent)
		// receiver테이블 저장 (sendMsgNo, receiverNo)
		int resultS = 0;
		int resultR = 0;
		msg.setSenderNo(sEmpNo);
		msg.setMsgContent(content);
		resultS = mService.sendMessage(msg);

		for(int receiverNo : rEmpNo) {
			msg.setReceiverNo(receiverNo);
			
			resultR = mService.receiveMessage(msg);
		}
		
		if(resultS + resultR > 0) {
			session.setAttribute("alertMsg", "쪽지를 성공적으로 발송하였습니다.");
			return "redirect:list.ms";
		}else {
			return "common/error";
		}
	}
	
	// 4. 메세지 읽기 
	@ResponseBody
	@RequestMapping(value="selectRMsg.ms", produces="application/json; charset=utf-8")
	public String selectRMsg(int receiverNo, int sendMsgNo, int receiveMsgNo, Message msg) {
		
		msg.setReceiverNo(receiverNo);
		msg.setSendMsgNo(sendMsgNo);
		Message m = mService.selectRMsg(msg);

		// 4_1. 처음받은 메시지면 읽음 시간도 함께 업데이트
		if(m.getReadDate() == null) {
			int result = mService.readMessage(receiveMsgNo);
			//System.out.println(result);
		}
		
		return new Gson().toJson(m);
	}
	
	// 5. 보낸메세지함 이동 서비스
	@RequestMapping("slist.ms")
	public ModelAndView selectSMsgList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		
		int empNo = Integer.parseInt(((Employee)session.getAttribute("loginUser")).getEmpNo());
		//System.out.println(empNo);
		int listCount = mService.selectRMsgCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Message> list = mService.selectSMsgList(pi, empNo);
		
		//System.out.println(pi);
		//System.out.println(list);
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("message/smsgListView");
		
		return mv;
	}
	
	// 6. 보낸 메세지 읽기 
	@ResponseBody
	@RequestMapping(value="selectSMsg.ms", produces="application/json; charset=utf-8")
	public String selectSMsg(int receiverNo, int sendMsgNo, int senderNo, Message msg) {
		
		msg.setReceiverNo(receiverNo);
		msg.setSendMsgNo(sendMsgNo);
		msg.setSenderNo(senderNo);
		Message m = mService.selectSMsg(msg);

		return new Gson().toJson(m);
	}
		
	// 7.받은 메세지 삭제하기
	@RequestMapping("deleteRMsg.ms")
	public String deleteRMsg(@RequestParam(value="msgNoDel[]") int[] checkArr, HttpSession session) {
		
		int result = 0;
		
		for(int rno : checkArr) {
			result = mService.deleteRMsg(rno);
		}
		
		if(result > 0) {
			session.setAttribute("alertMsg", "메세지를 삭제하였습니다.");
			return "redirect:list.ms";
		}else {
			return "common/error";
		}
	}

	// 8. 보낸 메세지 삭제하기
	@RequestMapping("deleteSMsg.ms")
	public String deleteSMsg(@RequestParam(value="msgNoDel[]") int[] checkArr, HttpSession session) {
		
		int result = 0;
		
		for(int sno : checkArr) {
			result = mService.deleteSMsg(sno);
		}
		System.out.println(result);
		if(result > 0) {
			session.setAttribute("alertMsg", "메세지를 삭제하였습니다.");
			return "redirect:slist.ms";
		}else {
			return "common/error";
		}
	}
}
