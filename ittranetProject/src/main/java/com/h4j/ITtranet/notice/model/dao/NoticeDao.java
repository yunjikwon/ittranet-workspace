package com.h4j.ITtranet.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.model.vo.Reply;
import com.h4j.ITtranet.notice.model.vo.Notice;
import com.h4j.ITtranet.notice.model.vo.NoticeHeader;

@Repository
public class NoticeDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit); 
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.increaseCount", noticeNo);
	}
	
	public Notice selectBoard(SqlSessionTemplate sqlSession, int noticeNo ) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("noticeMapper.insertAttachment", at);
	}
	
	public ArrayList<Attachment> selectAttachment(SqlSessionTemplate sqlSession, int noticeNo){
		return (ArrayList)sqlSession.selectList("noticeMapper.selectAttachment", noticeNo);
	}
	
	public int attachmentCount(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.countAttachment");
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}
	
	public int deleteAttachment(SqlSessionTemplate sqlSession, int attachmentNo) {
		return sqlSession.delete("noticeMapper.deleteAttachment", attachmentNo);
	}
	
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	public int insertNewAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("noticeMapper.insertNewAttachment", at);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int refNo){
		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList", refNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("noticeMapper.insertReply", r);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("noticeMapper.deleteReply", replyNo);
	}
	
	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("noticeMapper.updateReply", r);
	}
	
	public ArrayList<Notice> searchNoticeList(SqlSessionTemplate sqlSession, Notice n){
		return (ArrayList)sqlSession.selectList("noticeMapper.searchNoticeList", n);
	}
	
	public ArrayList<NoticeHeader> selectHeaderList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("noticeMapper.selectHeaderList");
	}
	
	
	
	
	
}
