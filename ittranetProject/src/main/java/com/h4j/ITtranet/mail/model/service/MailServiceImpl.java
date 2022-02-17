package com.h4j.ITtranet.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.mail.model.dao.MailDao;
import com.h4j.ITtranet.mail.model.vo.Mail;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 1-1. [받은메일함] 메일 리스트 *카운트* 조회
	@Override
	public int selectListCount(String empNo) {
		return mDao.selectListCount(sqlSession, empNo);
	}

	// 1-2. [받은메일함] 리스트 페이지 (페이징바)
	@Override
	public ArrayList<Mail> selectList(PageInfo pi, String email) {
		return mDao.selectList(sqlSession, pi, email);
	}

	// 2. 메일 쓰기 (+첨부파일)
	@Override
	public int insertMail(Mail m, ArrayList<Attachment> list) {
		
		int result1 = mDao.insertSendMail(sqlSession, m);
		int result2 = mDao.insertReceiveMail(sqlSession, m);
		
		int result3 = mDao.insertMailAttachment(sqlSession, list);
		
		return result1 * result2 * result3;
		
	}

	// 3. 메일 상세조회
	@Override
	public Mail selectMail(int sendMailNo) {
		return mDao.selectMail(sqlSession, sendMailNo);
	}
	
	// 5. 삭제

	// 6-1. [휴지통] 메일 리스트 *카운트* 조회
	@Override
	public int selectBinListCount(String empNo) {
		return mDao.selectBinListCount(sqlSession, empNo);
	}

	// 6-2. [휴지통] 리스트 페이지 (페이징바)
	@Override
	public ArrayList<Mail> selectBinList(PageInfo pi, String email) {
		return mDao.selectBinList(sqlSession, pi, email);
	}

	// 7-1. [안읽은메일함] 메일 리스트 *카운트* 조회
	@Override
	public int selectUnreadListCount(String empNo) {
		return mDao.selectUnreadListCount(sqlSession, empNo);
	}

	// 7-2. [안읽은메일함] 리스트 페이지 (페이징바)
	@Override
	public ArrayList<Mail> selectUnreadList(PageInfo pi, String email) {
		return mDao.selectUnreadList(sqlSession, pi, email);
	}


	
	

}
