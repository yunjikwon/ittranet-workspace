package com.h4j.ITtranet.employee.model.vo;

import java.sql.Date;

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
public class Employee {
	
	private String empNo;
	private String empId;
	private String empPwd;
	private String empName;
	private String phone;
	private String email;
	private String address;
	private String deptCode;
	private String teamCode;
	private String jobCode;
	private String hireDate;
	private String entDate;
	private Date joinDate;
	private String status;
	private String admin;
	private String profile;
	private String deptName;
	private String teamName;
	private String jobName;


}
