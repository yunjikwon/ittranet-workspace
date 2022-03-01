package com.h4j.ITtranet.approval.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor //기본생성자
@AllArgsConstructor //매개변수 생성자
@Setter
@Getter
@ToString

public class AppLine {
	
	private String team;
	private String job;
	private String empId;
	private String empName;
	
	private int aplineNo; 			// 결재선 번호 (seq_lino)
	private int drNo;				// 기안문서번호(seq_drno)
	private int empNo;				// 결재자 사원번호
	private String aplineOrder;		// 결재순번(결재순서1순위 2순위)
	private String apStatus;		// 결재상태 (미처리/반려/완료)
	private Date apDate;			// 결재일
	
	//검색 필터
	private String keywordTeam; 	// 팀 이름 검색
	private String keywordName; 	// 사원명 검색

}
