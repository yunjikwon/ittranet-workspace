package com.h4j.ITtranet.mail.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.mail.model.vo.MailReceive;

public interface MailService {
	
	// 1. 받은메일함 리스트 페이지 (페이징바)
	int selectListCount();
	ArrayList<MailReceive> selectList(PageInfo pi);
	

}
