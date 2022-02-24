package com.h4j.ITtranet.project.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.Reply;
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
	
	// 게시글 조회, 첨부파일 조회
	@RequestMapping("feed.pr")
	public ModelAndView prNewsfeed(Newsfeed n, String prNo, ModelAndView mv) {
		
		ArrayList<Newsfeed> list = nService.prNewsfeed(prNo);
		ArrayList<Todo> todo = nService.prTodo(prNo);
		Newsfeed nf = nService.nfNo(prNo);

		
		mv.addObject("list", list).addObject("todo", todo).addObject("nf",nf).setViewName("project/project");
		System.out.println("프로젝트 뉴스피드 db : " + list);
		System.out.println("프로젝트 업무 db : " + todo);
		System.out.println("nf : " + nf);
		return mv;		
	}
	
	// 게시글 등록, 첨부파일 추가
	
	//@ResponseBody
	@RequestMapping(value="ninsert.pr")
	public String ajaxInsertNews(Newsfeed n, Attachment a, MultipartFile file, HttpSession session) {
		
		System.out.println(n);
		System.out.println(file);
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, session);
			String filePath = session.getServletContext().getRealPath("/resources/uploadFiles");
			a.setOriginName(file.getOriginalFilename());
			a.setChangeName("resources/uploadFiles/" + changeName);
		}
		
		
		int result = nService.insertFeed(n);
		return result>0 ? "redirect:feed.pr?prNo=" + n.getPrNo() : "fail";
	}
		
	// 첨부파일 저장
	public String saveFile(MultipartFile upfile, HttpSession session) {		
			String originName = upfile.getOriginalFilename();
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random() * 90000 + 10000);
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + ranNum + ext;		
			
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
		
	}	
	
	@RequestMapping("delete.pr")
	public String deleteFeed(int nfNo, HttpSession session, Model model) {
		
		int result = nService.deleteFeed(nfNo);
		System.out.println("여기 되나?" + nfNo);
		if(result > 0) {
			// 삭제 성공 
			// 게시판 리스트페이지   feed.pr  url재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "project/project";
			
		}else {
			// 삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	
	@RequestMapping("updateForm.pr")
	public String updateForm(String nfNo, Model model) {
		model.addAttribute("n", nService.prNewsfeed(nfNo));
		System.out.println("수정하기 클릭");
		return "redirect:feed.pr";
	}
	
	/*
	@ResponseBody
	@RequestMapping(value="rinsert.pr")
	public String ajaxInsertReply(Reply r) {
		int result = nService.insertReply(r);
		return result>0 ? "success" : "fail";
	}
	*/

}
