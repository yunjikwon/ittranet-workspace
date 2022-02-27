package com.h4j.ITtranet.employee.model.vo;

import org.apache.commons.mail.HtmlEmail;

public class EmployeeMail {
	
	/**
	 * ID/PWD찾기 메일
	 * @param emp
	 * @throws Exception
	 */
	public void findIdPwd(Employee emp) throws Exception {
		
		// 메일 서버 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "no1ttranet";
		String hostSMTPpw = "ittr++1775";
		
		// 보내는 메일,이름
		String fromEmail = "no1ttranet@gmail.com";
		String fromName = "잇트라넷";
		
		// 제목, 내용
		String subject = "";
		String msg = "";
		
		subject = "[잇트라넷] IT!tranet 아이디, 임시 비밀번호 안내 메일입니다";
		msg += "<div align='left'>";
		msg += "<h2>" + emp.getEmpName() + " 님의 아이디와 임시 비밀번호 입니다.</h2><br>";
		msg += "<h3> * 보안을 위해 반드시 로그인 후 비밀번호를 변경해 주세요! </h3>";
		msg += "<p>아이디 : " + emp.getEmpId() + "</p>";
		msg += "<p>임시 비밀번호 : " + emp.getEmpPwd() + "</p></div>";
		
		String receiver = emp.getEmail();
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465);
			mail.setAuthentication(hostSMTPid, hostSMTPpw);
			mail.setStartTLSEnabled(true);
			mail.addTo(receiver, charSet);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();			
		} catch(Exception e) {
			e.printStackTrace();
		}
				
	}
	
	/**
	 * 회원 가입 링크 메일
	 * @param inviteMail
	 * @throws Exception
	 */
	public void inviteEmployee(String inviteMail) throws Exception {
		
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "no1ttranet";
		String hostSMTPpw = "ittr++1775";
		
		String fromEmail = "no1ttranet@gmail.com";
		String fromName = "잇트라넷";
		
		String subject = "";
		String msg = "";
		
		subject = "[잇트라넷] IT!tranet 회원가입 안내 메일입니다";
		msg += "<div align='left'>";
		msg += "<h3>우리 회사의 일원이 되신 것을 진심으로 환영합니다.</h3>";
		msg += "<h3>자사는 더 편리한 사내 시스템을 위해</h3>";
		msg += "<h3>자체적인 회사 인트라넷 사이트를 이용하고 있습니다.</h3><br>";
		msg += "<h3>아래의 링크로 접속하신 뒤 회원 가입 양식에 맞추어 정보를 모두 입력하시고</h3>";
		msg += "<h3>초록색 CLICK! 버튼을 누르시면 가입 요청이 완료됩니다.</h3><br>";
		msg += "<h3>회원 가입 요청 후 1~3일 이내에 가입 완료 메일이 발송되니 확인해 주시길 바랍니다.</h3>";
		msg += "<h2><a href=\"http://localhost:8174/ITtranet/joinForm.me\" target=\"_blank\">IT!tranet 회원가입</a></h2><br>";
		msg += "* 회원 가입에 문제가 발생 시 아래의 번호로 연락 바랍니다";
		msg += "<h3>☎ : 070-1111-1775</h3><div>";
		
		String receiver = inviteMail;
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465);
			mail.setAuthentication(hostSMTPid, hostSMTPpw);
			mail.setStartTLSEnabled(true);
			mail.addTo(receiver, charSet);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();			
		} catch(Exception e) {
			e.printStackTrace();
		}
				
	}
	
	/**
	 * 가입 승인 완료 메일
	 * @param confirmMail
	 * @throws Exception
	 */
	public void confirmEmployee(Employee emp) throws Exception {

			String charSet = "utf-8";
			String hostSMTP = "smtp.gmail.com";
			String hostSMTPid = "no1ttranet";
			String hostSMTPpw = "ittr++1775";
			

			String fromEmail = "no1ttranet@gmail.com";
			String fromName = "잇트라넷";
			

			String subject = "";
			String msg = "";
			
			subject = "[잇트라넷] IT!tranet 가입 요청이 승인되었습니다!";
			msg += "<div align='left'>";
			msg += "<h3>" + emp.getEmpName() + " 님 반갑습니다!</h3>";
			msg += "<h3>이제부터 IT!tranet을 이용하실 수 있습니다.</h3>";
			msg += "<h3>아래의 링크를 클릭하시면 로그인 화면으로 이동합니다.</h3><br>";
			msg += "<h3><a href=\"http://localhost:8174/ITtranet\" target=\"_blank\">Go IT!tranet</a></h3><br>";
			msg += "<h3>" + emp.getEmpName() + " 님의 잇트라넷 아이디는</h3><h2>" + emp.getEmpId() + "</h2> <h3>입니다.</h3><br><br>";
			msg += "* 문의사항이 있을 시 아래의 번호로 연락 바랍니다";
			msg += "<h3>☎ : 070-1111-1775</h3><div>";
			
			String receiver = emp.getEmail();
			try {
				HtmlEmail mail = new HtmlEmail();
				mail.setDebug(true);
				mail.setCharset(charSet);
				mail.setSSLOnConnect(true);
				mail.setHostName(hostSMTP);
				mail.setSmtpPort(465);
				mail.setAuthentication(hostSMTPid, hostSMTPpw);
				mail.setStartTLSEnabled(true);
				mail.addTo(receiver, charSet);
				mail.setFrom(fromEmail, fromName, charSet);
				mail.setSubject(subject);
				mail.setHtmlMsg(msg);
				mail.send();			
			} catch(Exception e) {
				e.printStackTrace();
			}
	}
	

}
