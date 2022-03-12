package com.h4j.ITtranet.mail.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.mail.model.vo.Mail;

@Repository
public class MailDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, String empNo) {
		
		return sqlSession.selectOne("mailMapper.selectListCount", empNo);
		
	}
	
	// 1. 받은메일함 조회 (페이징바를 위해 카운트 조회)
	public ArrayList<Mail>  selectList(SqlSessionTemplate sqlSession, PageInfo pi, String email){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectList", email, rowBounds);
	}
	
	// 2-1. 메일 쓰기 (+첨부파일)
	// 보낸메일 테이블에 추가
	public int insertSendMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertMailSd", m);
	}
	// 받은메일 테이블에 추가
	public int insertReceiveMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertMailRv", m);
	}
	// 첨부파일 테이블에 추가
	public int insertMailAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		int result = 1;
		for(Attachment at : list) {
			result += sqlSession.insert("mailMapper.insertMailAttachment", at);
		}
		return result;
	}
	
	// 2-2. 내게쓰기 (+첨부파일)
	public int insertToMeSendMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertMailSd", m);
	}
	public int insertToMeReceiveMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertMailRv", m);
	}
	public int insertToMeMailAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		int result = 1;
		for(Attachment at : list) {
			result += sqlSession.insert("mailMapper.insertMailAttachment", at);
		}
		return result;
	}
	
	// 2-3. 답장 (+첨부파일)
	public int insertAnswerSendMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertMailSd", m);
	}
	public int insertAnswerReceiveMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertMailRv", m);
	}
	public int insertAnswerMailAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		int result = 1;
		for(Attachment at : list) {
			result += sqlSession.insert("mailMapper.insertMailAttachment", at);
		}
		return result;
	}

	// 3. 메일 상세페이지 조회
	public Mail selectMail(SqlSessionTemplate sqlSession, int sendMailNo) {
		return sqlSession.selectOne("mailMapper.selectMail", sendMailNo);
	}
	public ArrayList<Attachment> selectMailAttachment(SqlSessionTemplate sqlSession, int sendMailNo) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectMailAttachment", sendMailNo);
	}
	public int updateUnreadMail(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.update("mailMapper.updateUnreadMail", mno);
	}
	
	// 5-1. 리스트 : 삭제 (받은메일테이블 기준)
	public int deleteMail(SqlSessionTemplate sqlSession, List<Integer> receiveMailNo) {
		int result = 0;
		for(int i=0; i<receiveMailNo.size(); i++) {
			result = sqlSession.update("mailMapper.deleteMail",receiveMailNo.get(i));
		}
		return result;
	}
	
	// 5-2. 리스트 : 삭제 (보낸메일테이블 기준:보낸메일함, 임시보관함)
	public int sdDeleteMail(SqlSessionTemplate sqlSession, List<Integer> sendMailNo) {
		int result = 0;
		for(int i=0; i<sendMailNo.size(); i++) {
			result = sqlSession.update("mailMapper.sdDeleteMail", sendMailNo.get(i));
		}
		return result;
	}
	
	// 5-3. 리스트 : 완전삭제
	public int comDeleteMail(SqlSessionTemplate sqlSession, List<Integer> receiveMailNo) {
		int result = 0;
		for(int i=0; i<receiveMailNo.size(); i++) {
			result = sqlSession.update("mailMapper.comDeleteMail", receiveMailNo.get(i));
		}
		return result;
	}
	
	// 12. 복원
	public int restorationMail(SqlSessionTemplate sqlSession, List<Integer> receiveMailNo) {
		int result = 0;
		for(int i=0; i<receiveMailNo.size(); i++) {
			result = sqlSession.update("mailMapper.restorationMail", receiveMailNo.get(i));
		}
		return result;
	}
	
	// 14. 디테일화면 : 삭제
	public int deleteOneMail(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("mailMapper.deleteOneMail", map);
	}
	
	// 6-1. [휴지통] 메일 리스트 카운트 조회
	public int selectBinListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("mailMapper.selectBinListCount", empNo);
		
	}
	
	// 6-2. [휴지통] 메일 리스트 조회
	public ArrayList<Mail>  selectBinList(SqlSessionTemplate sqlSession, PageInfo pi, String email){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectBinList", email, rowBounds);
	}
	
	// 7-1. [안읽은메일함] 메일 리스트 카운트 조회
	public int selectUnreadListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("mailMapper.selectUnreadListCount", empNo);
	}
	
	// 7-2. [안읽은메일함] 메일 리스트 조회
	public ArrayList<Mail> selectUnreadList(SqlSessionTemplate sqlSession, PageInfo pi, String email) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectUnreadList", email, rowBounds);
	}
	
	// 8-1. [중요메일함] 메일 리스트 카운트 조회
	public int selectImpoListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("mailMapper.selectImpoListCount", empNo);
	}
	
	// 8-2. [중요메일함] 메일 리스트 조회
	public ArrayList<Mail> selectImpoList(SqlSessionTemplate sqlSession, PageInfo pi, String email) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectImpoList", email, rowBounds);
	}
	
	// 9-1. [스팸메일함] 메일 리스트 카운트 조회
	public int selectSpamListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("mailMapper.selectSpamListCount", empNo);
	}
	
	// 9-2. [스팸메일함] 메일 리스트 조회
	public ArrayList<Mail> selectSpamList(SqlSessionTemplate sqlSession, PageInfo pi, String email) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSpamList", email, rowBounds);
	}
	
	// 10-1. [보낸메일함] 메일 리스트 카운트 조회
	public int selectSendListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("mailMapper.selectSendListCount", empNo);
	}
	
	// 10-2. [보낸메일함] 메일 리스트 조회
	public ArrayList<Mail> selectSendList(SqlSessionTemplate sqlSession, PageInfo pi, String email) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSendList", email, rowBounds);
	}
	
	// 11-1. [임시보관함] 메일 리스트 카운트 조회
	public int selectTemListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("mailMapper.selectTemListCount", empNo);
	}
	
	// 11-2. [임시보관함] 메일 리스트 조회
	public ArrayList<Mail> selectTemList(SqlSessionTemplate sqlSession, PageInfo pi, String email) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectTemList", email, rowBounds);
	}
	
	// 4-1. 중요 메일 (받은메일)
	public int updateImportantMail(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("mailMapper.updateImportantMail", map);
	}
	
	// 4-2. 중요 메일 (보낸메일)
	public int updateImportantSendMail(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("mailMapper.updateImportantSendMail", map);
	}
	
	// 13. 디테일화면 : 스팸
	public int updateSpamMail(SqlSessionTemplate sqlSession, int rvno) {
		return sqlSession.update("mailMapper.updateSpamMail", rvno);
	}
	

	
}
