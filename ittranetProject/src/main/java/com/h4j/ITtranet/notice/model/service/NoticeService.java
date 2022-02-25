package com.h4j.ITtranet.notice.model.service;


import java.util.ArrayList;

import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.common.model.vo.Reply;
import com.h4j.ITtranet.notice.model.vo.Notice;
import com.h4j.ITtranet.notice.model.vo.NoticeHeader;

public interface NoticeService {
	
	// 1. 게시판 리스트 페이지 서비스 (페이징)
	int selectListCount();
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 2. 게시글 작성하기 서비스
	int insertNotice(Notice n);
	
	// 2-1. 첨부파일 추가 서비스
	int insertAttachment(Attachment at);
	
	// 3. 게시글 상세조회용 서비스
	int increaseCount(int noticeNo);
	
	// 3-1. 공지사항 특정 글 선택 서비스
	Notice selectNotice(int noticeNo);
	
	// 3-2. 첨부파일 불러오는 서비스
	ArrayList<Attachment> selectAttachment(int noticeNo);
	
	// 3-3. 말머리 리스트 불러오는 서비스
	ArrayList<NoticeHeader> selectHeaderList();
	
	// 4. 게시글 삭제용 서비스
	int deleteNotice(int noticeNo);
	
	// 4-1. 첨부파일 갯수 조회 서비스
	int attachmentCount(int noticeNo);
	
	// 4-2. 첨부파일 삭제 서비스
	int deleteAttachment(int attachmentNo);
	
	// 5. 게시글 수정용 서비스
	int updateNotice(Notice n);
	
	// 5-1. 게시글 수정 중 첨부파일 추가 서비스
	int insertNewAttachment(Attachment at);
	
	// 6. 댓글 리스트 조회용 서비스 (ajax)
	ArrayList<Reply> selectReplyList(int noticeNo);
	
	// 7. 댓글 작성용 서비스 (ajax) (대댓글)
	int insertReply(Reply r);
	
	// 8. 댓글 삭제용 서비스 (ajax) (대댓글)
	int deleteReply(int replyNo);
	
	// 9. 댓글 수정용 서비스 (ajax) (대댓글)
	int updateReply(Reply r);
	
	// 10. 게시글 검색 서비스 (ajax)
	ArrayList<Notice> searchNoticeList(Notice n);
	
	// 11. 메인페이지 새글 조회 서비스 
	ArrayList<Notice> selectNewNoticeList();
	
	// 12. 말머리 추가 서비스
	int insertHeader(String headerTitle);
	
	// 13. 말머리 수정 서비스
	int updateHeader(NoticeHeader nh);
	
	// 14. 말머리 삭제 서비스
	int deleteHeader(int headerNo);

}
