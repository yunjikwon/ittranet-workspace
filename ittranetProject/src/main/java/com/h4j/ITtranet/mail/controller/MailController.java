package com.h4j.ITtranet.mail.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		String empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		
		int listCount = mService.selectListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Mail> rvlist = mService.selectList(pi, email);


		model.addAttribute("pi", pi);
		model.addAttribute("rvlist", rvlist);
		 
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
	
	// 2-1. 내게쓰기 폼
	@RequestMapping("enrollForm.mlme")
	public String toMeEnrollForm() {
		return "mail/mailTomeEnrollForm";
	}
	
	// 2-2. 내게쓰기 새로운 메일 데이터 추가 (+첨부파일)
	@RequestMapping("tomeinsert.ml")
	public String toMeInsertMail(Mail m, MultipartFile[] upfile, HttpSession session, Model model) {
		
		
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
	
	
	// 2-1. 답장하기 폼
	@RequestMapping("enrollForm.mlas")
	public ModelAndView answerEnrollForm(int mno, ModelAndView mv) {
		
		Mail m = mService.selectMail(mno);
		
		mv.addObject("m", m).setViewName("mail/mailAnswerView");
		
		return mv;
	}
	// 2-2. 답장하기 새로운 메일 데이터 추가 (+첨부파일)
	@RequestMapping("asinsert.ml")
	public String answerInsertMail(Mail m, MultipartFile[] upfile, HttpSession session, Model model) {
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

		ArrayList<Attachment> list = mService.selectMailAttachment(mno);
		
		
		mv.addObject("m", m).addObject("list", list).setViewName("mail/mailDetailView");
		return mv;


	}
	
	// 4. 중요 메일 조회
	@ResponseBody
	@RequestMapping(value="impo.ml", produces="application/text; charset=UTF-8")
	public String importantmail(String rvno, String important) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("rvno", rvno);
		map.put("important", important);
		
		int result = mService.updateImportantMail(map);
		
		return result>0? "success" : "fail";
	}
	
	// 4-2. 중요 메일 조회 (보낸편지함)	// 왜 맨 상위만 선택되는가??????????????????????
	/*
	@ResponseBody
	@RequestMapping(value="impo.sdml", produces="application/text; charset=UTF-8")
	public String importantsendmail (String mno, String important) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mno", mno);
		map.put("important", important);
		
		System.out.println(map);
		int result = mService.updateImportantSendMail(map);
		
		return result>0? "success" : "fail";
		
	}
	*/
	
	
	// 5. (리스트에서) 메일 삭제
	@ResponseBody
	@RequestMapping(value="delete.ml", produces="application/text; charset=UTF-8")
	public String deletemail(@RequestParam(value="receiveMailNo[]") List<Integer> receiveMailNo) {
		
		
		
		int result = mService.deleteMail(receiveMailNo);
		
	
		return result>0? "success" : "fail";
	}
	
	// 12. (리스트에서) 메일 복원
	@ResponseBody
	@RequestMapping(value="resto.ml", produces="application/text; charset=UTF-8")
	public String restorationmail(@RequestParam(value="receiveMailNo[]") List<Integer> receiveMailNo) {
		int result = mService.restorationMail(receiveMailNo);

		return result>0? "success" : "fail";
	}
	
	



	
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
	
	// 6. 휴지통 조회 (받은메일함에서 상태값이 'N'인 메일)
	@RequestMapping("binlist.ml")
	public String selectBinList(@RequestParam (value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		//String empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = mService.selectBinListCount(email);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Mail> binlist = mService.selectBinList(pi, email);


		model.addAttribute("pi", pi);
		model.addAttribute("binlist", binlist);
		 
		return "mail/mailBinView";

	}
	
	// 7. 안읽은메일 조회
	@RequestMapping("unreadlist.ml")
	public String selectUnreadList(@RequestParam (value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		//String empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = mService.selectUnreadListCount(email);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Mail> unreadlist = mService.selectUnreadList(pi, email);
		
		model.addAttribute("pi", pi);
		model.addAttribute("unreadlist", unreadlist);
		
		return "mail/mailUnreadView";
	}
	
	// 8. 중요메일 조회
	@RequestMapping("impolist.ml")
	public String selectImpoList(@RequestParam (value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		//String empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = mService.selectImpoListCount(email);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Mail> impolist = mService.selectImpoList(pi, email);
		
		model.addAttribute("pi", pi);
		model.addAttribute("impolist", impolist);
		
		return "mail/mailImpoView";
	}
	
	// 9. 스팸메일 조회
	@RequestMapping("spamlist.ml")
	public String selectSpamList(@RequestParam (value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		//String empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = mService.selectSpamListCount(email);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Mail> spamlist = mService.selectSpamList(pi, email);
		
		model.addAttribute("pi", pi);
		model.addAttribute("spamlist", spamlist);
		
		return "mail/mailSpamView";
	}
	
	// 10. 보낸메일함
	@RequestMapping("sendlist.ml")
	public String selectSendList(@RequestParam (value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		//String empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = mService.selectSendListCount(email);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Mail> sendlist = mService.selectSendList(pi, email);
		
		model.addAttribute("pi", pi);
		model.addAttribute("sendlist", sendlist);
		
		return "mail/mailSendView";
	}
	
	// 11. 임시보관함
	@RequestMapping("temlist.ml")
	public String selectTemList(@RequestParam (value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		String email = ((Employee)session.getAttribute("loginUser")).getEmail();
		//String empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = mService.selectTemListCount(email);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Mail> temlist = mService.selectTemList(pi, email);
		
		model.addAttribute("pi", pi);
		model.addAttribute("temlist", temlist);
		
		return "mail/mailTemView";
	}
	
	// 디테일화면 : 스팸메일
	@ResponseBody
	@RequestMapping(value="dtspam.ml", produces="application/text; charset=UTF-8")
	public String updateSpamMail(int rvno) {
		
		int result = mService.updateSpamMail(rvno);

		System.out.println(result);
		return result>0? "success" : "fail";
	}
	
	/*
	// 5-2. (상세조회페이지에서) 메일 삭제 //////////////////////////////// 수정해야됨
	@RequestMapping("deleteone.ml")
	public String deleteOneMail(int rvno, HttpSession session, Model model) {
		int result = mService.deleteOneMail(rvno);
		
		
		if(result>0) {
			return "redirect:alllist.ml";
		}else {
			return "common/errorPage";
		}

	}
	*/

}
