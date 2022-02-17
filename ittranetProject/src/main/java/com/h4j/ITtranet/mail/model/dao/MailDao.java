package com.h4j.ITtranet.mail.model.dao;

import java.util.ArrayList;

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
	
	// 2. 메일 쓰기 (+첨부파일)
	public int insertSendMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertMailSd", m);
	}
	
	public int insertReceiveMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertMailRv", m);
	}
	
	public int insertMailAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		int result = 1;
		for(Attachment at : list) {
			result += sqlSession.insert("mailMapper.insertMailAttachment", at);
		}
		
		return result;
	}

	// 3. 메일 상세조회
	public Mail selectMail(SqlSessionTemplate sqlSession, int sendMailNo) {
		return sqlSession.selectOne("mailMapper.selectMail", sendMailNo);
	}
	
	// 5. 삭제
	
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
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectUnreadList", email);
	}

}
