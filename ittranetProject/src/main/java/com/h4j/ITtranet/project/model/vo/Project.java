package com.h4j.ITtranet.project.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.h4j.ITtranet.employee.model.vo.Employee;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString

public class Project {
	
	private String prNo;
	private String empNo;
	private String prTitle;
	private Date prStartdate;
	private String prEnddate;
	private String prContent;
	private String prLogo;
	private String status;
	
	private ArrayList<Employee> newprMem;

}
