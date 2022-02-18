package com.h4j.ITtranet.board.model.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.h4j.ITtranet.board.model.vo.Board;
import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.model.vo.Reply;

public interface BoardService {
	
	// 1. 게시판 리스트 페이지 서비스 (페이징)
	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi);
	
	// 2. 게시글 작성하기 서비스
	int insertBoard(Board b);
	
	// 2-1. 첨부파일 추가 서비스
	int insertAttachment(Attachment at);
	
	// 3. 게시글 상세조회용 서비스
	int increaseCount(int boardNo);
	Board SelectBoard(int boardNo);
	ArrayList<Attachment> selectAttachment(int boardNo);
	
	// 4. 게시글 삭제용 서비스
	int deleteBoard(int boardNo);
	
	// 4-1. 첨부파일 갯수 조회 서비스
	int attachmentCount(int boardNo);
	
	// 4-2. 첨부파일 삭제 서비스
	int deleteAttachment(int attachmentNo);
	
	// 5. 게시글 수정용 서비스
	int updateBoard(Board b);
	
	// 5-1. 게시글 수정 중 첨부파일 추가 서비스
	int insertNewAttachment(Attachment at);
	
	// 6. 댓글 리스트 조회용 서비스 (ajax)
	ArrayList<Reply> selectReplyList(int boardNo);
	
	// 7. 댓글 작성용 서비스 (ajax) (대댓글)
	int insertReply(Reply r);
	
	// 8. 댓글 삭제용 서비스 (ajax) (대댓글)
	int deleteReply(int replyNo);
	
	// 9. 댓글 수정용 서비스 (ajax) (대댓글)
	int updateReply(Reply r);
	
	// 10. 게시글 검색 서비스 (ajax)
	ArrayList<Board> searchBoardList(Board b);
	
}
