package com.h4j.ITtranet.mail.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class MailReceive {
	
	private String receiveMailNo;
	private String sendMailNo;
	private String empNo;
	private String receiverAccount;
	private String read;
	private String important;
	private String spam;
	private String status;
	

	private String empName;
	private String mailTitle;
	private String sendDate;
	private String wroteme_status;
}


