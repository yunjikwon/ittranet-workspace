package com.h4j.ITtranet.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.template.Pagination;
import com.h4j.ITtranet.employee.model.service.EmployeeService;
import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.employee.model.vo.EmployeeMail;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/**
	 * 사용자 메인 페이지
	 * @return
	 */
	@RequestMapping("goUserMain.me")
	public String goUserMain() {
		return "common/userMain";
	}
	
	/**
	 * 관리자 메인페이지
	 * @return
	 */
	@RequestMapping("goAdminMain.me")
	public String goAdminMain() {
		return "common/adminMain";
	}
	
	/**
	 * 로그인
	 * @param e
	 * @param session
	 * @param mv
	 * @return ModelAndView mv
	 */
	@RequestMapping("hi.me")
	public ModelAndView loginMember(Employee e, HttpSession session, ModelAndView mv, Model model) {
		
		Employee loginUser = eService.loginMember(e);
		
		// System.out.println(loginUser);
		
		if(loginUser != null && (loginUser.getAdmin()).equals("Y") && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("common/adminMain");
		} else if(loginUser != null && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("common/userMain");
		} else {
			model.addAttribute("errorMsg", "아이디 혹은 비밀번호를 다시 확인해주세요!");
			mv.setViewName("common/error");
		}
		
		/*
		if(loginUser != null && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("common/userMain");
		}else {
			mv.setViewName("common/error");
		}
		*/
		
		return mv;
	}
	
	/**
	 * 로그아웃
	 * @param session
	 * @return String
	 */
	@RequestMapping("bye.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	/**
	 * ID/PWD 찾기
	 * @param accordMail
	 * @return String result
	 */
	@ResponseBody
	@RequestMapping(value="findIdPwd.me")
	public String findIdPwd(String accordMail) {
		
		// System.out.println("화면에서 입력 받은 메일 : " + accordMail);

		String result = null;
		Employee e = new Employee();
		int count = eService.mailCheck(accordMail);
		// 가입된 메일이 있으면 1 => 일치하는 회원 찾아서 비밀번호 바꾸기(암호화) => 메일 발송 => result : yeah (메일 발송되었다는 알림)
		// 가입된 메일이 없으면 0 => result : miss (가입된 메일이 없다는 알림)
		
		// System.out.println("결과 : " + count);
		
		if(count>0) {
			
			// 입력한 이메일과 일치하는 회원 정보 조회
			e = eService.whosMail(accordMail);
			
			// System.out.println("일치하는 회원 정보 " + e);
			
			// 임시 비밀번호 생성 후 setter메소드로 비밀번호 바꾸기
			String temporaryPwd = UUID.randomUUID().toString().replace("-", "");
			temporaryPwd = temporaryPwd.substring(0, 7);
			
			// System.out.println("임시 비밀번호 생성 : " + temporaryPwd);
			
			e.setEmpPwd(temporaryPwd);
			
			// System.out.println("임시 비밀번호로 정보 변경 : " + e);
			
			// 메일 발송
			EmployeeMail em = new EmployeeMail();
			try {
				em.findIdPwd(e);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			// 임시 비밀번호 암호화 후 데이터 수정
			String changePwd = bcryptPasswordEncoder.encode(temporaryPwd);
			e.setEmpPwd(changePwd);
			
			// System.out.println("암호화 : " + changePwd);
			// System.out.println("최종 업데이트 : " + e);
			
			int updateResult = eService.setTempwd(e);
			
			// System.out.println("updateResult : " + updateResult);
			
			if(updateResult>0) {
				result = "yeah";
			} else {
				result = "oops";
			}
			
		}else {
			result = "miss";
		}
		
		// System.out.println("result : " + result);
		return result;
	}
	
	/**
	 * 회원가입  페이지 호출
	 * @return 응답페이지
	 * 
	 * (회원가입 메일 => 링크 클릭 => 회원가입 페이지)
	 * 링크 주소 : http://localhost:8174/ITtranet/joinForm.me
	 */
	@RequestMapping("joinForm.me")
	public String joinForm() {
		return "member/joinForm";
	}
	
	/**
	 * 회원가입 메일 중복 확인
	 * @param checkMail
	 * @return int count(중복 o => 1 | 중복 x => 0)
	 */
	@ResponseBody
	@RequestMapping("mailCheck.me")
	public String mailCheck(String checkMail) {
		// System.out.println(checkMail);
		int count = eService.mailCheck(checkMail);
		// System.out.println(count);
		return count>0 ? "FAIL" : "PASS";
		
		/*
		 * where조건문 수정으로 오류 해결 
		 * => 이메일,아이디 상태값이 Y인 회원들만 중복 확인해서 생긴 문제
		 *    DB에는 모든 상태값의 회원 정보가 있음
		 */
	}
	
	/**
	 * 회원가입 아이디 중복 확인
	 * @param checkId
	 * @return (중복 o => 1 => FAIL | 중복 x => 0 => PASS)
	 */
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		return eService.idCheck(checkId) > 0 ? "FAIL" : "PASS";
	}
	
	/**
	 * 회원가입 요청
	 * => DB에 status 'W(wait)'로 정보 담김 && 가입 승인 대기 페이지로 이동(사원관리)
	 * => 관리자가 가입을 승인하면 status 'W'에서 'Y'로 변경 && 가입 승인 메일 발송
	 * @param e
	 * @param model
	 * @param session
	 * @return String 페이지
	 */
	@RequestMapping("join.me")
	public String insertMember(Employee e, Model model, HttpSession session) {
		
		// System.out.println(e);
		
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd()); // 암호화
		
		// System.out.println(encPwd);
		
		e.setEmpPwd(encPwd); // empPwd필드 암호문으로 변경
		
		int result = eService.insertMember(e);
		
		if(result>0) {
			session.setAttribute("alertMsg", "승인 후 가입시 작성한 이메일로 링크가 발송됩니다");
			return "redirect:joinForm.me";
		}else {
			model.addAttribute("errorMsg", "회원 가입에 실패하셨습니다");
			return "common/error";
		}	
	}
	
	/**
	 * 마이페이지 호출
	 * @return
	 */
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/mymyPage";
	}
	
	/**
	 * 회원 정보 변경
	 * @param e
	 * @param session
	 * @return
	 */
	@RequestMapping("update.me")
	public String updateMember(Employee e, MultipartFile upfile, HttpSession session, Model model) {
		
		// System.out.println(upfile);
		
		if(!upfile.getOriginalFilename().equals("")) { // 파일명이 빈 문자열이 아닐 때(존재할 때)
		
			// saveFile에서 return된 파일수정명 changeName으로 받아옴
			// 와~~~ 이 부분 너무 중요함
			String changeName = saveFile(upfile, session);
		
			// 원본명 & 서버업로드된경로를 Board b에 이어서 담기 (마지막 과정)
			e.setProfile("resources/images/profile/" + changeName);
		
		}
		
		// System.out.println(e);

		int result = eService.updateMember(e);
		if(result>0) {
			session.setAttribute("loginUser",  eService.loginMember(e));
			session.setAttribute("alertifyMsg", "성공적으로 회원정보가 변경되었습니다");
			return "redirect:myPage.me";
		}else { 
			session.setAttribute("fail", "실패");
			return "redirect:myPage.me";
		}	
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {

		
		// "년월일시분초"
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// "랜덤숫자5개"
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String changeName = currentTime + ranNum;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		// 경로 알아내려면 세션 객체 필요함 HttpSession 매개변수로 받기
		String savePath = session.getServletContext().getRealPath("resources/images/profile/"); // jsp에서도 했었음!! 
		
		// savePath 경로에 changeName으로 이름 바꾼 첨부파일 업로드
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		// 이 메소드를 호출했던 곳으로 수정명 return
		return changeName;
	}

	/**
	 * 회원 탈퇴
	 * @param empPwd
	 * @param empNo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("delete.me")
	public String deleteMember(String empPwd, String empNo, HttpSession session, Model model) {
		
		// empPwd 매개변수(요청시 전달값이 담긴 매개변수) == 회원탈퇴요청시 사용자가 입력한 비밀번호 평문
		// session에 loginUser Employee객체 empPwd필드 == db로부터 조회된 비번 (암호문)
		// 평문과 암호문을 내부적으로 비교할 것임 =>  session객체 필요 => 매개변수로 추가
		
		String encPwd = ((Employee)session.getAttribute("loginUser")).getEmpPwd();
		
		if(bcryptPasswordEncoder.matches(empPwd, encPwd)) { 
			// matches => 비번 맞음 => 탈퇴 처리
			int result = eService.deleteMember(empNo);
			
			// 탈퇴 처리 실패할 일은 없을 것이지만~ 그래도 조건문 처리
			// 탈퇴 처리 성공 => session에 loginUser지움, alert문구 담기 =>메인페이지 url 재요청
			if(result > 0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
				return "redirect:/";
			}else {
				model.addAttribute("errorMsg", "회원 탈퇴에 실패하셨습니다");
				return "common/error";
			}
			
		}else { 
			// 비번 틀림 => 비밀번호 틀림을 알리고
			session.setAttribute("alertifyMsg", "비밀번호를 잘못 입력하셨습니다. 다시 확인해주세요!");
			// => 마이페이지 보여지게
			return "redirect:myPage.me";
		}
		
	} 
	
	/**
	 * 비밀번호 변경 페이지 호출
	 * @return
	 */
	@RequestMapping("setPwdForm.me")
	public String setPwdForm() {
		return "member/setPwdForm";
	}
	
	/**
	 * ajax현재 비밀번호 체크
	 * @param checkPwd
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("nowPwdCheck.me")
	public String nowPwdCheck(String checkPwd, HttpSession session) {
		
		String encPwd = ((Employee)session.getAttribute("loginUser")).getEmpPwd();

		if(bcryptPasswordEncoder.matches(checkPwd, encPwd)) {
			return "PASS";
		}else {
			return "FAIL";
		}

	}
	
	/**
	 * 비밀번호 변경
	 * @param e
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("setPwd.me")
	public String setPwd(Employee e, Model model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
		
		e.setEmpPwd(encPwd);
		
		int result = eService.updatePwd(e);
		
		if(result>0) {
			session.setAttribute("alertMsg", "비밀번호 변경 성공! 새 비밀번호로 로그인하세요!");
			return "redirect:/";
		}else { 
			model.addAttribute("errorMsg", "비밀번호 변경에 실패하셨습니다");
			return "common/error";
		}	
		
	}
	
	// ============================ 사원 관리 =================================
	
	/**
	 * 사원 초대 페이지 호출
	 * @return
	 */
	@RequestMapping("addEmpForm.me")
	public String inviteEmpForm() {
		return "member/adminMemberInsert";
	}
	
	/**
	 * ajax 사원 초대 메일 발송
	 * @param inviteMail
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addEmp.me")
	public String inviteEmployee(String inviteMail) {
		
		EmployeeMail em = new EmployeeMail();
		try {
			em.inviteEmployee(inviteMail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";

	} 
	
	/**
	 * 가입 승인 페이지 호출
	 * @return
	 */
	@RequestMapping("appEmpForm.me")
	public ModelAndView approvalEmpForm(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int employeeCount = eService.selectWemployeeCount();
		
		PageInfo pi = Pagination.getPageInfo(employeeCount, currentPage, 5, 5);
		
		ArrayList<Employee> wlist = eService.selectWemployee(pi);

		mv.addObject("pi", pi)
		  .addObject("wlist", wlist)
		  .setViewName("member/adminMemberWtoY");
		
		return mv;
	}
	
	/**
	 * ajax 사원 가입 승인 완료 (메일 && update)
	 * @param e
	 * @return
	 */
	@ResponseBody
	@RequestMapping("appEmp.me")
	public String confirmMember(Employee e) {
		
		// System.out.println(e);
		
		EmployeeMail em = new EmployeeMail(); // status W => Y 변경 후 메일 보내기
		
		int result = eService.confirmMember(e);
		
		if(result>0) {
			// 메일 보내기
			try {
				em.confirmEmployee(e);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			return "PASS";
			
		}else {
			return "FAIL";
		}

	} 
	
	@ResponseBody
	@RequestMapping("delEmps.me")
	public String delEmpls(Employee e) {
		int result = eService.deleteMember(e.getEmpNo());
		
		return result > 0 ? "PASS" : "FAIL";
		
	}
	
	
	/**
	 * 직위 직무 관리 페이지 호출
	 * @return
	 */
	@RequestMapping("setEmpForm.me")
	public String approvalEmployee() {
		return "member/adminMemberUpdate";
	}
	
	/**
	 * 사원 계정 삭제 페이지 호출
	 * @return
	 */
	@RequestMapping("delEmpForm.me")
	public ModelAndView delEmpForm(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int employeeCount = eService.selectAllemployeeCount();
		
		PageInfo pi = Pagination.getPageInfo(employeeCount, currentPage, 5, 15);
		
		ArrayList<Employee> list = eService.selectAllemployee(pi);

		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("member/adminMemberDelete");
		
		return mv;
	}

	
	
	

	// adminJobcode => 사원 정보 
	// adminJobcodeDetail => 사원 정보 디테일
	// adminMemberDelete => 사원 ㄱㅖ정 삭제 ★ 체크 표시 있음!! 대박~~ 테이블 짱
	// adminMemberInsert => 사원 초대
	/*
	 * 사원 추가
	 * 사원 가입 승인
	 * 직위/직무 관리
	 * 사원 계정 삭제
	 */

	// ~~사원 추가
	// 사원 추가 페이지 호출 addEmpForm.me (사원관리 메뉴를 누르면 제일 처음 보여지는 페이지 - DB연결 x)
	
	// 사원 추가 addEmp.me (이메일 주소 작성하고 버튼 누르면 회원가입폼 보내는 메일 발송 - DB연결 x)
	
	// ~~가입 승인
	// 사원 가입 승인 페이지 호출 appEmpForm.me
	
	// 사원 가입 승인 appEmpApp.me (status를 W에서 Y로 update)
	
	// 사원 가입 반려 addEmpCom.me (status를 W에서 N으로 update)
	
	// ~~직위,직무 관리
	// 직위직무관리 페이지 호출 empSetForm.me
	
	// 직위 직무 관리 empSet.me (Department, Team, Job 변경 / jsp에서 한 번에 값 담아서 보내고 update시키기)
	
	// ~~사원 계정 삭제
	// 사원 계정 삭제 페이지 호출 delEmpForm.me
	
	// 사원 계정 삭제 delEmp.me (status Y에서 N으로 update)
	
	
	

}
