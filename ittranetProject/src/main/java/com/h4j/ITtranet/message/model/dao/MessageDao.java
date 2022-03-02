package com.h4j.ITtranet.message.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.message.model.vo.Message;

@Repository
public class MessageDao {

	public int selectRMsgCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("messageMapper.selectRMsgCount", empNo);
	}
	
	public ArrayList<Message> selectRMsgList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("messageMapper.selectRMsgList", empNo, rowBounds);
	}
	
	public ArrayList<Message> selectEmpList(SqlSessionTemplate sqlSession, String keyword){
		return (ArrayList)sqlSession.selectList("messageMapper.selectEmpList", keyword);
	}
	
	public int sendMessage(SqlSessionTemplate sqlSession, Message msg) {
		return sqlSession.insert("messageMapper.sendMessage", msg);
	}
	
	public int receiveMessage(SqlSessionTemplate sqlSession, Message msg) {
		return sqlSession.insert("messageMapper.receiveMessage", msg);
	}
	
	public Message selectRMsg(SqlSessionTemplate sqlSession, Message msg) {
		return sqlSession.selectOne("messageMapper.selectRMsg", msg);
	}
	
	public int readMessage(SqlSessionTemplate sqlSession, int receiverMsgNo) {
		return sqlSession.update("messageMapper.readMessage", receiverMsgNo);
	}
	
	public int selectSMsgCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("messageMapper.selectSMsgCount", empNo);
	}
	
	public ArrayList<Message> selectSMsgList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("messageMapper.selectSMsgList", empNo, rowBounds);
	}
	
	public Message selectSMsg(SqlSessionTemplate sqlSession, Message msg){
		return sqlSession.selectOne("messageMapper.selectSMsg", msg);
	}
	
	public int deleteRMsg(SqlSessionTemplate sqlSession, int receiveMsgNo) {
		return sqlSession.update("messageMapper.deleteRMsg", receiveMsgNo);
	}
	
	public int deleteSMsg(SqlSessionTemplate sqlSession, int sendMsgNo) {
		return sqlSession.update("messageMapper.deleteSMsg", sendMsgNo);
	}
	
	
}
