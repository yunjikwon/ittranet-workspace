package com.h4j.ITtranet.mail.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.template.Pagination;
import com.h4j.ITtranet.mail.model.service.MailService;
import com.h4j.ITtranet.mail.model.vo.Mail;

@Controller
public class MailController {
	
	
	@Autowired
	private MailService mService;
	
	// 1. 받은메일함 조회 (메일 전체조회)
	@RequestMapping("alllist.ml")
	public String selectList(@RequestParam (value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = mService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Mail> rvlist = mService.selectList(pi);


		
		model.addAttribute("pi", pi);
		model.addAttribute("list", rvlist);
		 
		return "mail/mailReceiveView";

	}
	
	// 2. 메일쓰기 폼
	@RequestMapping("enrollForm.ml")
	public String enrollForm() {
		return "mail/mailEnrollForm";
	}
	
	// 3. 새로운 메일 데이터 추가
	@RequestMapping("insert.ml")
	public String insertMail(Mail m, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			
			m.setOriginName(upfile.getOriginalFilename());
			m.setChangeName("resources/uploadFiles/" + changeName);
			
		}
		
		int result = mService.insertMail(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 메일이 발송되었습니다.");
			return "redirect:alllist.ml";
		}else {
			model.addAttribute("errorMsg", "메일 보내기에 실패하였습니다.");
			return "common/errer";
		}
	}
	
	// 4. 상세조회 메일
	@RequestMapping("detail.ml")
	public ModelAndView selectMail(int sendMailNo, ModelAndView mv) {
		
		Mail m = mService.selectMail(sendMailNo);
		mv.addObject("m", m).setViewName("mail/mailDetailView");
		
		
		System.out.println(sendMailNo);
		System.out.println(m);
		return mv;
	}

}
