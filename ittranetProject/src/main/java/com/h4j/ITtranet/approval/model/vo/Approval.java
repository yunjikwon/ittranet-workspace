package com.h4j.ITtranet.approval.model.vo;

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
	private int drDivision;  //양식 종류
	private int empNo;
	private String empName;
	private String teamName;
}
