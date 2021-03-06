package com.h4j.ITtranet.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor 
@Setter
@Getter
@ToString
public class Attachment {
	
	private int attachmentNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String refCode;
	private int refNo;	
	
	//게시판 용 변수
	private int boardNo;
	private int noticeNo;
	
	//뉴스피드용 변수
	private String prNo;
	private int nfNo;

}
