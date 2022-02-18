package com.h4j.ITtranet.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.model.vo.Reply;
import com.h4j.ITtranet.notice.model.dao.NoticeDao;
import com.h4j.ITtranet.notice.model.vo.Notice;
import com.h4j.ITtranet.notice.model.vo.NoticeHeader;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao nDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {		
		
		return nDao.insertNotice(sqlSession, n);
	}

	@Override
	public int insertAttachment(Attachment at) {
		return nDao.insertAttachment(sqlSession, at);
	}
	
	@Override
	public int increaseCount(int noticeNo) {
		return nDao.increaseCount(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return nDao.selectBoard(sqlSession, noticeNo);
	}

	@Override
	public ArrayList<Attachment> selectAttachment(int noticeNo) {
		return nDao.selectAttachment(sqlSession, noticeNo);
	}

	@Override
	public ArrayList<NoticeHeader> selectHeaderList() {
		return nDao.selectHeaderList(sqlSession);
	}
	
	@Override
	public int deleteNotice(int noticeNo) {
		return nDao.deleteNotice(sqlSession, noticeNo);
	}
	
	@Override
	public int attachmentCount(int noticeNo) {
		return nDao.attachmentCount(sqlSession, noticeNo);
	}

	@Override
	public int deleteAttachment(int attachmentNo) {
		return nDao.deleteAttachment(sqlSession, attachmentNo);
	}
	
	@Override
	public int updateNotice(Notice n) {
		return nDao.updateNotice(sqlSession, n);
	}

	@Override
	public int insertNewAttachment(Attachment at) {
		return nDao.insertNewAttachment(sqlSession, at);
	}
	
	@Override
	public ArrayList<Reply> selectReplyList(int noticeNo) {
		return nDao.selectReplyList(sqlSession, noticeNo);
	}

	@Override
	public int insertReply(Reply r) {
		return nDao.insertReply(sqlSession, r);
	}


	@Override
	public int deleteReply(int replyNo) {
		return nDao.deleteReply(sqlSession, replyNo);
	}

	@Override
	public int updateReply(Reply r) {
		return nDao.updateReply(sqlSession, r);
	}

	@Override
	public ArrayList<Notice> searchNoticeList(Notice n) {
		return nDao.searchNoticeList(sqlSession, n);
	}
	
	@Override
	public ArrayList<Notice> selectNewNoticeList() {
		return null;
	}

	





	
}
