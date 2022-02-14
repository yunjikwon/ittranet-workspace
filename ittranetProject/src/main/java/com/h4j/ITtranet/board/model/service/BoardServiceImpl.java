package com.h4j.ITtranet.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.board.model.dao.BoardDao;
import com.h4j.ITtranet.board.model.vo.Board;
import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.model.vo.Reply;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return bDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Board b) {		
		
		return bDao.insertBoard(sqlSession, b);
	}

	@Override
	public int insertAttachment(Attachment at) {
		return bDao.insertAttachment(sqlSession, at);
	}
	
	@Override
	public int increaseCount(int boardNo) {
		return bDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Board SelectBoard(int boardNo) {
		return bDao.selectBoard(sqlSession, boardNo);
	}

	@Override
	public ArrayList<Attachment> selectAttachment(int boardNo) {
		return bDao.selectAttachment(sqlSession, boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return bDao.deleteBoard(sqlSession, boardNo);
	}
	
	@Override
	public int attachmentCount(int boardNo) {
		return bDao.attachmentCount(sqlSession, boardNo);
	}

	@Override
	public int deleteAttachment(int attachmentNo) {
		return bDao.deleteAttachment(sqlSession, attachmentNo);
	}
	
	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(sqlSession, b);
	}

	@Override
	public int insertNewAttachment(Attachment at) {
		return bDao.insertNewAttachment(sqlSession, at);
	}
	
	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return null;
	}

	@Override
	public int insertReply(Reply r) {
		return 0;
	}

	@Override
	public ArrayList<Board> selectNewBoardList() {
		return null;
	}





	
}
