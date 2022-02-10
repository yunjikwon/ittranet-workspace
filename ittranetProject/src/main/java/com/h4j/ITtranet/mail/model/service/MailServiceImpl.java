package com.h4j.ITtranet.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.mail.model.dao.MailDao;
import com.h4j.ITtranet.mail.model.vo.MailReceive;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public int selectListCount() {
		return mDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<MailReceive> selectList(PageInfo pi) {
		return mDao.selectList(sqlSession, pi);
	}

}
