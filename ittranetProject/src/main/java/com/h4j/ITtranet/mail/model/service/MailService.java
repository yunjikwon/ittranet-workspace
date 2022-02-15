package com.h4j.ITtranet.mail.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.mail.model.vo.Mail;

public interface MailService {
	
	// 1. 받은메일함 리스트 페이지 (페이징바)
	int selectListCount(String empNo);
	ArrayList<Mail> selectList(PageInfo pi, String empNo);
	
	// 2. 메일쓰기
	int insertMail(Mail m, ArrayList<Attachment> list);
	
	
	
	// 3. 메일 상세조회
	Mail selectMail(int sendMailNo);
	

	

}
