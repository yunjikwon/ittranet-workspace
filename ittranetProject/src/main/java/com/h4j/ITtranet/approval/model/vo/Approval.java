package com.h4j.ITtranet.approval.model.vo;


import java.util.ArrayList;
import java.sql.Date;

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

public class Approval {
	private int drNo;
	private String drTitle;
	private Date drDate;
	private String drStatus; // 결재 상태
	private String drDivision;  //양식 종류 - sql문에서 decode함수 이용하여 이름으로 출력
	private int empNo;
	private String empName;
	private String teamName;
	
	private String drContent; // 내용
	private String drSum; 	  // 지결합계
	private String drReason;  // 사유
	private int drMoney;   	  // 추가비용청구
	private int drOvertime;		// 연장근무시간
	private String drOverDate;  // 연장근무일
	private String drBusiness;  // 프로젝트 제안
	private String drProTitle;  // 회의안건
	private String drProDate;   // 회의일
	
	private int aplineOrder; 
	private int aplineNo;
	
	private ArrayList<AppLine> appList;
	// appList[0].empNo 
	// appList[0].aplineOrder
	
	// appList[1].empNo 
	// appList[1].aplineOrder
	
	private String originName;
	private String changeName;
}
