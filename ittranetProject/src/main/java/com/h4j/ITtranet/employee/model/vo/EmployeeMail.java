package com.h4j.ITtranet.employee.model.vo;

import org.apache.commons.mail.HtmlEmail;

public class EmployeeMail {
	
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

}
