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
public class Mail {
	
	private int receiveMailNo;
	private int sendMailNo;
	private String empNameRv;
	private String receiverAccount;
	private String read;
	private String important;
	private String spam;
	private String statusRv;
	private String empNameSd;
	private String senderAccount;
	private String mailTitle;
	private String mailContent;
	private String sendDate;
	private String temStatus;
	private String statusSd;
	private String wrotemeStatus;
	
	private int statusCheck;

}
