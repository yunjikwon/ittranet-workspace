package com.h4j.ITtranet.message.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.message.model.dao.MessageDao;
import com.h4j.ITtranet.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectRMsgCount(int empNo) {
		return mDao.selectRMsgCount(sqlSession, empNo);
	}
	
	@Override
	public ArrayList<Message> selectRMsgList(PageInfo pi, int empNo) {
		return mDao.selectRMsgList(sqlSession, pi, empNo);
	}

	@Override
	public ArrayList<Message> selectEmpList(String keyword) {
		return mDao.selectEmpList(sqlSession, keyword);
	}


	@Override
	public int sendMessage(Message msg) {
		return mDao.sendMessage(sqlSession, msg);
	}

	@Override
	public int receiveMessage(Message msg) {
		return mDao.receiveMessage(sqlSession, msg);
	}
	
	@Override
	public Message selectRMsg(Message msg) {
		return mDao.selectRMsg(sqlSession, msg);
	}

	@Override
	public int readMessage(int receiveMsgNo) {
		return mDao.readMessage(sqlSession, receiveMsgNo);
	}


	@Override
	public int selectSMsgCount(int empNo) {
		return mDao.selectSMsgCount(sqlSession, empNo);
	}

	@Override
	public ArrayList<Message> selectSMsgList(PageInfo pi, int empNo) {
		return mDao.selectSMsgList(sqlSession, pi, empNo);
	}

	@Override
	public Message selectSMsg(Message msg) {
		return mDao.selectSMsg(sqlSession, msg);
	}

	@Override
	public int deleteRMsg(int receiveMsgNo) {
		return mDao.deleteRMsg(sqlSession, receiveMsgNo);
	}
	
	@Override
	public int deleteSMsg(int sendMsgNo) {
		return mDao.deleteSMsg(sqlSession, sendMsgNo);
	}


}
