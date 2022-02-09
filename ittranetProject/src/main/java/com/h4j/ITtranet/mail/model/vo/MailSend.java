package com.h4j.ITtranet.mail.model.vo;

import java.sql.Date;

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
public class MailSend {
	
	private String sendMailNo;
	private String empNo;
	private String senderAccount;
	private String mailTitle;
	private String mailContent;
	private Date sendDate;
	private String temStatus;
	private String status;
	private String wrotemeStatus;
}
