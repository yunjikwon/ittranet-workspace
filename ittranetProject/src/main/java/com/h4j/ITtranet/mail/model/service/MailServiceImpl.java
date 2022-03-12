package com.h4j.ITtranet.mail.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

	// 1-2. [받은메일함] 리스트 페이지 (+페이징바)
	@Override
	public ArrayList<Mail> selectList(PageInfo pi, String email) {
		return mDao.selectList(sqlSession, pi, email);
	}

	// 2-1. 메일 쓰기 (+첨부파일)
	@Override
	public int insertMail(Mail m, ArrayList<Attachment> list) {
		
		int result1 = mDao.insertSendMail(sqlSession, m);
		int result2 = mDao.insertReceiveMail(sqlSession, m);
		int result3 = mDao.insertMailAttachment(sqlSession, list);
		
		return result1 * result2 * result3;
	}
	
	// 2-2. 내게 쓰기 (+첨부파일)
	@Override
	public int toMeInsertMail(Mail m, ArrayList<Attachment> list) {
		
		int result1 = mDao.insertSendMail(sqlSession, m);
		int result2 = mDao.insertReceiveMail(sqlSession, m);
		int result3 = mDao.insertMailAttachment(sqlSession, list);
		
		return result1 * result2 * result3;
	}
	
	// 2-3. 답장 (+첨부파일)
	@Override
	public int answerInsertMail(Mail m, ArrayList<Attachment> list) {
		
		int result1 = mDao.insertSendMail(sqlSession, m);
		int result2 = mDao.insertReceiveMail(sqlSession, m);
		int result3 = mDao.insertMailAttachment(sqlSession, list);
		
		return result1 * result2 * result3;
	}

	// 6-1. [휴지통] 메일 리스트 *카운트* 조회
	@Override
	public int selectBinListCount(String empNo) {
		return mDao.selectBinListCount(sqlSession, empNo);
	}

	// 6-2. [휴지통] 리스트 페이지 (+페이징바)
	@Override
	public ArrayList<Mail> selectBinList(PageInfo pi, String email) {
		return mDao.selectBinList(sqlSession, pi, email);
	}

	// 7-1. [안읽은메일함] 메일 리스트 *카운트* 조회
	@Override
	public int selectUnreadListCount(String empNo) {
		return mDao.selectUnreadListCount(sqlSession, empNo);
	}

	// 7-2. [안읽은메일함] 리스트 페이지 (+페이징바)
	@Override
	public ArrayList<Mail> selectUnreadList(PageInfo pi, String email) {
		return mDao.selectUnreadList(sqlSession, pi, email);
	}

	// 8-1. [중요메일함] 메일 리스트 *카운트* 조회
	@Override
	public int selectImpoListCount(String empNo) {
		return mDao.selectImpoListCount(sqlSession, empNo);
	}

	// 8-2. [중요메일함] 리스트 페이지 (+페이징바)
	@Override
	public ArrayList<Mail> selectImpoList(PageInfo pi, String email) {
		return mDao.selectImpoList(sqlSession, pi, email);
	}

	// 9-1. [스팸메일함] 메일 리스트 *카운트* 조회
	@Override
	public int selectSpamListCount(String empNo) {
		return mDao.selectSpamListCount(sqlSession, empNo);
	}

	// 9-2. [스팸메일함] 리스트 페이지 (+페이징바)
	@Override
	public ArrayList<Mail> selectSpamList(PageInfo pi, String email) {
		return mDao.selectSpamList(sqlSession, pi, email);
	}

	// 10-1. [보낸메일함] 메일 리스트 *카운트* 조회
	@Override
	public int selectSendListCount(String empNo) {
		return mDao.selectSendListCount(sqlSession, empNo);
	}

	// 10-2. [보낸메일함] 메일 리스트 (+페이징바)
	@Override
	public ArrayList<Mail> selectSendList(PageInfo pi, String email) {
		return mDao.selectSendList(sqlSession, pi, email);
	}
	
	// 11-1. [임시보관함] 메일 리스트 *카운트* 조회
	@Override
	public int selectTemListCount(String empNo) {
		return mDao.selectTemListCount(sqlSession, empNo);
	}

	// 11-2. [임시보관함] 메일 리스트 (+페이징바)
	@Override
	public ArrayList<Mail> selectTemList(PageInfo pi, String email) {
		return mDao.selectTemList(sqlSession, pi, email);
	}

	// 5-1. [삭제] 리스트 : 메일 삭제 (받은메일테이블 기준:안읽은메일함,받은메일함,중요메일함)
	@Override
	public int deleteMail(List<Integer> receiveMailNo) {
		return mDao.deleteMail(sqlSession, receiveMailNo);
	}
	
	// 5-2. [삭제] 리스트 : 메일 삭제 (보낸메일테이블 기준:보낸메일함,임시보관함)
	@Override
	public int sdDeleteMail(List<Integer> sendMailNo) {
		return mDao.sdDeleteMail(sqlSession, sendMailNo);
	}
	
	// 5-3. [완전삭제] 리스트 : 메일 완전삭제 (스팸메일함,휴지통)
	@Override
	public int comDeleteMail(List<Integer> receiveMailNo) {
		return mDao.comDeleteMail(sqlSession, receiveMailNo);
	}

	// 14. [삭제] 상세조회페이지 : 삭제
	@Override
	public int deleteOneMail(HashMap<String, Integer> map) {
		return mDao.deleteOneMail(sqlSession, map);
	}

	// 4-1. [중요메일체크] 리스트 : 중요 메일 체크/체크해제(뱓은메일 테이블)
	@Override
	public int updateImportantMail(HashMap<String, String> map) {
		return mDao.updateImportantMail(sqlSession, map);
	}

	// 4-2. [중요메일체크] 리스트 : 중요 메일 체크/체크해제(보낸메일 테이블)
	@Override
	public int updateImportantSendMail(HashMap<String, String> map) {
		return mDao.updateImportantSendMail(sqlSession, map);
	}

	// 12. [복원] 리스트 : 메일 복원
	@Override
	public int restorationMail(List<Integer> receiveMailNo) {
		return mDao.restorationMail(sqlSession, receiveMailNo);
	}
	
	// 3-1. 메일 상세조회 (메일)
	@Override
	public Mail selectMail(int sendMailNo) {
		return mDao.selectMail(sqlSession, sendMailNo);
	}
	
	// 3-2. 메일 상세조회 (첨부파일)
	@Override
	public ArrayList<Attachment> selectMailAttachment(int sendMailNo) {
		return mDao.selectMailAttachment(sqlSession, sendMailNo);
	}
	
	// 3-3. 메일 상세조회 (읽음여부)
	@Override
	public int updateUnreadMail(int mno) {
		return mDao.updateUnreadMail(sqlSession, mno);
	}

	// 13. [스팸] 상세조회페이지 : 스팸
	@Override
	public int updateSpamMail(int rvno) {
		return mDao.updateSpamMail(sqlSession, rvno);
	}
	
	

}
