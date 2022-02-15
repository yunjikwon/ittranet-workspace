package com.h4j.ITtranet.mail.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.template.Pagination;
import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.mail.model.service.MailService;
import com.h4j.ITtranet.mail.model.vo.Mail;


@Controller
public class MailController {
	
	
	@Autowired
	private MailService mService;
	
	// 1. 받은메일함 조회 (메일 전체조회)
	@RequestMapping("alllist.ml")
	public String selectList(@RequestParam (value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		String empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = mService.selectListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Mail> rvlist = mService.selectList(pi, empNo);

		model.addAttribute("pi", pi);
		model.addAttribute("list", rvlist);
		 
		return "mail/mailReceiveView";

	}
	
	// 2-1. 메일쓰기 폼
	@RequestMapping("enrollForm.ml")
	public String enrollForm() {
		return "mail/mailEnrollForm";
	}
	
	// 2-2. 새로운 메일 데이터 추가 (+첨부파일)
	@RequestMapping("insert.ml")
	public String insertMail(Mail m, MultipartFile[] upfile, HttpSession session, Model model) {
		
		
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(MultipartFile f : upfile) {
			
			if(!f.getOriginalFilename().equals("")) {
				Attachment at = new Attachment();
				
				at.setOriginName(f.getOriginalFilename());
				at.setChangeName(saveFile(f, session));
				at.setFilePath("resources/uploadFiles/");
				
				list.add(at);
			}
		}
		
		int result = mService.insertMail(m, list);

		return "redirect:alllist.ml";
	}
	
	// 3. 상세조회 메일
	@RequestMapping("detail.ml")
	public ModelAndView selectMail(int mno, ModelAndView mv) {
		
		Mail m = mService.selectMail(mno);
		mv.addObject("m", m).setViewName("mail/mailDetailView");
		

		return mv;
	}
	
	// 5. 메일 삭제
	//@RequestMapping("delete.ml")

	
	// 넘어온 첨부파일 서버의 폴더에 저장시킴
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		System.out.println(originName);
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
			
		}catch(IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}

}