package com.h4j.ITtranet.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.mail.model.vo.Mail;

@Repository
public class MailDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, String empNo) {
		
		return sqlSession.selectOne("mailMapper.selectListCount", empNo);
		
	}
	
	public ArrayList<Mail>  selectList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectList", empNo, rowBounds);
		
	}
	
	public int insertMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertMail", m);
	}
	
	public Mail selectMail(SqlSessionTemplate sqlSession, int sendMailNo) {
		return sqlSession.selectOne("mailMapper.selectMail", sendMailNo);
	}

}
