package com.h4j.ITtranet.company.model.vo;

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
public class Company {
	
	private int empNo;
	private String empName;
	
	private String deptCode;
	private String deptName;
	private String teamCode;
	private String teamName;
	private String jobCode;
	private String jobName;
	
	private String phone;
	private String email;
	private String profile;
	
	private String status;

	// 검색용 변수
	private String type;
	private String keyword;
}
