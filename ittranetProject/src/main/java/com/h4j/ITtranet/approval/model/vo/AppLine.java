package com.h4j.ITtranet.approval.model.vo;

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
	
	//검색 필터
	private String keywordTeam; 	// 팀 이름 검색
	private String keywordName; 	// 사원명 검색

}
