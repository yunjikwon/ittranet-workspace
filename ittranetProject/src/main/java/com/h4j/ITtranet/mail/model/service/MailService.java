package com.h4j.ITtranet.mail.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.mail.model.vo.Mail;

public interface MailService {
	
	// 1. 받은메일함 (리스트 페이지 (페이징바))
	int selectListCount(String empNo);
	ArrayList<Mail> selectList(PageInfo pi, String email);
	
	// 2. 메일쓰기
	int insertMail(Mail m, ArrayList<Attachment> list);
	
	// 12. 내게쓰기
	int toMeInsertMail(Mail m, ArrayList<Attachment> list);
	
	// 3. 메일 상세조회
	Mail selectMail(int sendMailNo);
	
	// 중요 메일
	int importantMail(int receiveMailNo);
	
	// 5. 메일 삭제
	int deleteMail(List<Integer> receiveMailNo);
	
	// 5-2. (상세조회) 메일 삭제
	int deleteOneMail(int rvno);
	
	// 중요 메일
	int updateImportantMail(HashMap<String, String> map);
	
	// 중요 메일 (보낸메일함)
	int updateImportantSendMail(HashMap<String, String> map);
	
	
	// 6. 휴지통
	int selectBinListCount(String empNo);
	ArrayList<Mail> selectBinList(PageInfo pi, String email);

	// 7. 안읽은메일
	int selectUnreadListCount(String empNo);
	ArrayList<Mail> selectUnreadList(PageInfo pi, String email);
	
	// 8. 중요메일함 
	int selectImpoListCount(String empNo);
	ArrayList<Mail> selectImpoList(PageInfo pi, String email);
	
	// 9. 스팸메일함
	int selectSpamListCount(String empNo);
	ArrayList<Mail> selectSpamList(PageInfo pi, String email);
	
	// 10. 보낸메일함
	int selectSendListCount(String empNo);
	ArrayList<Mail> selectSendList(PageInfo pi, String email);
	
	// 11. 임시보관함
	int selectTemListCount(String empNo);
	ArrayList<Mail> selectTemList(PageInfo pi, String email);
	
	
}
