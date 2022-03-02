package com.h4j.ITtranet.message.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.message.model.vo.Message;

public interface MessageService {
	
	// 1. 받은 메세지함 리스트 
	int selectRMsgCount(int empNo);
	ArrayList<Message> selectRMsgList(PageInfo pi, int empNo);
	
	// 2. 보낸 메세지함 리스트
	int selectSMsgCount(int empNo);
	ArrayList<Message> selectSMsgList(PageInfo pi, int empNo);
	
	// 3. 사원 검색
	ArrayList<Message> selectEmpList(String keyword);
	
	
	// 4. 메세지 보내기
	int sendMessage(Message msg);
	int receiveMessage(Message msg);
	
	// 5. 받은 메세지 읽기
	Message selectRMsg(Message msg);
	int readMessage(int receiveMsgNo);
	
	
	// 6. 보낸 메세지 읽기
	Message selectSMsg(Message msg);
	
	// 7. 받은메세지 삭제
	int deleteRMsg(int receiveMsgNo);
	int deleteSMsg(int sendMsgNo);
}
