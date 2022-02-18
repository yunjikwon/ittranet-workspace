package com.h4j.ITtranet.notice.model.vo;

import java.util.ArrayList;

import com.h4j.ITtranet.board.model.vo.Board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
@AllArgsConstructor
public class Notice {
	
	private int noticeNo;
	private int empNo;
	private int headerNo;
	private String noticeTitle;
	private String noticeContent;
	private String createDate;
	private int count;
	private String status;
	
	// 작성자 조회용 변수
	private String empName;
	private String empId;
	private String headerTitle;
	
	// 검색용 변수
	private String type;
	private String keyword;
	
	// 최신글 조회용 변수
	private ArrayList<Board> Board;
	private int rnum;

}
