package com.h4j.ITtranet.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.mail.model.dao.MailDao;
import com.h4j.ITtranet.mail.model.vo.Mail;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public int selectListCount(String empNo) {
		return mDao.selectListCount(sqlSession, empNo);
	}

	@Override
	public ArrayList<Mail> selectList(PageInfo pi, String empNo) {
		return mDao.selectList(sqlSession, pi, empNo);
	}

	@Override
	public Mail selectMail(int sendMailNo) {
		return mDao.selectMail(sqlSession, sendMailNo);
	}

	@Override
	public int insertMail(Mail m) {
		return mDao.insertMail(sqlSession, m);
	}

}
