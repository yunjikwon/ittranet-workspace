package com.h4j.ITtranet.attendance.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.h4j.ITtranet.attendance.model.service.AttendanceService;
import com.h4j.ITtranet.attendance.model.vo.Attendance;
import com.h4j.ITtranet.attendance.model.vo.Vacation;
import com.h4j.ITtranet.board.model.vo.Board;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.template.Pagination;
import com.h4j.ITtranet.company.model.vo.Company;
import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.notice.model.vo.Notice;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService atService;
	
	//사용자 휴가신청 리스트 조회
	@RequestMapping("vclist.at")
	public ModelAndView selectVacationList(ModelAndView mv, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String empNo = loginUser.getEmpNo();
		
		// 휴가신청 리스트
		ArrayList<Vacation> ulist = atService.selectUpVacationList(empNo);
		ArrayList<Vacation> llist = atService.selectLastVacationList(empNo);
		
		// 잔여휴가
		Vacation rest = atService.selectRestVacation(empNo);
		
		mv.addObject("rest", rest).setViewName("attendance/vacationApplyList");
		mv.addObject("ulist", ulist).setViewName("attendance/vacationApplyList");
		mv.addObject("llist", llist).setViewName("attendance/vacationApplyList");

		return mv;
	}
	
	//관리자 미처리 휴가신청 리스트 조회
	@RequestMapping("yvclist.ad")
	public ModelAndView selectAdminYetVacationList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = atService.selectYetVacationListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Vacation> list = atService.selectYetVacationList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("attendance/adminVacationApplyList");
		
		return mv;	
	}
	
	//관리자 처리완료 휴가신청 리스트 조회
	@RequestMapping("fvclist.ad")
	public ModelAndView selectAdminFinVacationList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = atService.selectFinVacationListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Vacation> list = atService.selectFinVacationList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("attendance/adminFinVacationApplyList");
		
		return mv;	
	}
	
	//관리자 일일근태 조회
	/*
	@RequestMapping("dayat.ad")
	public ModelAndView selectAdminDayAttendance(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = atService.selectAdminDayAttendanceCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Attendance> list = atService.selectAdminDayAttendance(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("attendance/adminAttendanceDay");
		
		return mv;	
	}
	*/
	
	// 관리자 근무통계 조회
	/*
	@RequestMapping("yearat.ad")
	public ModelAndView selectAdminYearAttendance(ModelAndView mv, HttpSession session) {
		
		// 근무통계 조회
		ArrayList<Attendance> list = atService.selectAdminYear();
		// 부서명 조회
		ArrayList<Attendance> tlist = atService.selectTeam();
		
		mv.addObject("list", list).setViewName("attendance/adminAttendanceYear");
		mv.addObject("tlist", tlist).setViewName("attendance/adminAttendanceYear");

		return mv;
			
	}
	*/
	
	// 내 근무 페이지
	@RequestMapping("main.at")
	public ModelAndView attendanceMain(ModelAndView mv, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String empNo = loginUser.getEmpNo();
		
		// 근무통계 조회
		Attendance result = atService.selectMainAttendance(empNo);
		// 잔여연차 조회
		Vacation vc = atService.selectMainVacation(empNo);
		
		mv.addObject("result", result).setViewName("attendance/attendanceMain");
		mv.addObject("vc", vc).setViewName("attendance/attendanceMain");
		
		return mv;
	}
	
	// 사용자 출근
	@ResponseBody
	@RequestMapping(value="arrive.at")
	public String insertArrive(String empNo) {
		
		int result1 = atService.insertArrive(empNo);
		int result2 = atService.updateArriveStatus(empNo);
		
		return result1>0 && result2>0? "success" : "fail";
		
	}
	
	// 사용자 퇴근
	@ResponseBody
	@RequestMapping(value="leave.at")
	public String updateLeave(String empNo) {
		
		int result1 = atService.updateLeave(empNo);
		int result2 = atService.updateLeaveStatus(empNo);
		
		return result1>0 && result2>0? "success" : "fail";
		
	}
	
	// 사용자 외출
	@ResponseBody
	@RequestMapping(value="stepout.at")
	public String updateStepout(String empNo) {
		
		int result = atService.updateStepout(empNo);
		
		return result>0 ? "success" : "fail";
		
	}
	
	// 사용자 외근
	@ResponseBody
	@RequestMapping(value="outwork.at")
	public String updateOutwork(String empNo) {
		
		int result = atService.updateOutwork(empNo);
		
		return result>0 ? "success" : "fail";
		
	}

	// 출퇴근기록 조회
	@ResponseBody
	@RequestMapping(value="list.at", produces="application/json; charset=UTF-8")
	public String ajaxSelectAttendance(String empNo, HttpSession session) {
		
		Attendance at = atService.ajaxSelectAttendance(empNo);
		
		return new Gson().toJson(at);
	}
	
	// 휴가 신청
	@RequestMapping("vcinsert.at")
	public String insertVacation(Vacation vc, String empNo, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			
			// 원본명, 서버업로드된 경로를 Board b에 이어서 담기
			vc.setOriginName(upfile.getOriginalFilename());
			vc.setChangeName("resources/uploadFiles/" + changeName);
		}
		
		int result1 = atService.insertVacation(vc);
		int result2 = atService.updateVacationSum(empNo);
		
		if(result1 > 0 && result2 > 0) { // 성공
			session.setAttribute("alertMsg", "휴가신청 완료!");
			return "redirect:vclist.at";
		}else { // 실패
			model.addAttribute("errorMsg", "휴가 신청 실패");
			return "common/errorPage";
		}
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
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	// 관리자 휴가신청 디테일
	@RequestMapping("vcdetail.at")
	public ModelAndView selectVacationDetail(int vcno, ModelAndView mv) {
		
		Vacation vc = atService.selectVacationDetail(vcno);
		mv.addObject("vc", vc).setViewName("attendance/adminVacationApplyDetail");
		
		return mv;
	}
	
	// 관리자 휴가 거절
	@RequestMapping("vcrefuse.at")
	public String updateVcRefuse(int vcno, HttpSession session, Model model) {
		int result = atService.updateVcRefuse(vcno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "휴가신청이 거절됐습니다.");
			return "redirect:yvclist.ad";
			
		}else {
			model.addAttribute("errorMsg", "휴가신청 거절 실패");
			return "common/errorPage";
		}
	}

	// 관리자 휴가 승인
	@RequestMapping("vcapproval.at")
	public String updateVcApproval(int vcno, HttpSession session, Model model) {
		int result = atService.updateVcApproval(vcno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "휴가신청이 승인됐습니다.");
			return "redirect:yvclist.ad";
			
		}else {
			model.addAttribute("errorMsg", "휴가신청 승인 실패");
			return "common/errorPage";
		}
	}
	
	// 관리자 근무통계
	@RequestMapping("atstats.ad")
	public ModelAndView statisticsList(ModelAndView mv, HttpSession session) {
		
		// 부서명 조회
		ArrayList<Attendance> tlist = atService.selectTeam();
		mv.addObject("tlist", tlist).setViewName("attendance/adminAttendanceStats");
		return mv;
	} 
	
	// 근무통계 검색
	@ResponseBody
	@RequestMapping(value="searchstats.at", produces="application/json; charset=utf-8")
	public String stSearchList(Attendance at) {
		
		ArrayList<Attendance> list = atService.stSearchList(at);
		
		return new Gson().toJson(list);
	}
	
	// 사용자 근태현황 페이지
	@RequestMapping("attlist.at")
	public String attendanceList() {
		
		return "attendance/attendanceStatus";
	} 
	
	// 사용자 내 근태현황 조회
	@ResponseBody
	@RequestMapping(value="selectat.at", produces="application/json; charset=utf-8")
	public String ajaxAtList(int empNo) {
		
		ArrayList<Attendance> list = atService.ajaxAtList(empNo);
		
		return new Gson().toJson(list);
	}
	
	// 사용자 내 근태현황 검색
	@ResponseBody
	@RequestMapping(value="searchlist.at", produces="application/json; charset=utf-8")
	public String atSearchList(Attendance at) {
		
		ArrayList<Attendance> list = atService.atSearchList(at);
		
		return new Gson().toJson(list);
	}
	
	// 관리자 일일근태
	@RequestMapping("dayat.ad")
	public String adminAttendanceList() {
		
		return "attendance/adminDayAttendance";
	} 
	
	// 관리자 일일근태 전체조회
	@ResponseBody
	@RequestMapping(value="selectat.ad", produces="application/json; charset=utf-8")
	public String ajaxAdminAtList() {
		
		ArrayList<Attendance> list = atService.ajaxAdminAtList();
		
		return new Gson().toJson(list);
	}
	
	// 관리자 일일근태 검색
	@ResponseBody
	@RequestMapping(value="searchlist.ad", produces="application/json; charset=utf-8")
	public String ajaxAdminAtSearchList(Attendance at) {
		
		ArrayList<Attendance> list = atService.ajaxAdminAtSearchList(at);
		return new Gson().toJson(list);
	}
	
	// 사용자 휴가신청 취소
	@RequestMapping("vcdelete.at")
	public String updateVcDelete(int vcno, HttpSession session, Model model) {
		int result = atService.updateVcDelete(vcno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "휴가신청이 취소됐습니다.");
			return "redirect:vclist.at";
			
		}else {
			model.addAttribute("errorMsg", "휴가신청 취소 실패");
			return "common/errorPage";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
