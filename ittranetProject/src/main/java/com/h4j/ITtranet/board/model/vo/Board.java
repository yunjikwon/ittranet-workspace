package com.h4j.ITtranet.board.model.vo;

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
public class Board {
	
	private int boardNo;
	private int empNo;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private int count;
	private String status;
	
	// 작성자 조회용 변수
	private String empName;
	private String empId;

}
