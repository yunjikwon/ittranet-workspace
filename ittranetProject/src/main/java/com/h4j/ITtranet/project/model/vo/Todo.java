package com.h4j.ITtranet.project.model.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString

public class Todo {
	
	private int todoNo;
	private String prNo;
	private String EmpNo;
	private String todoTitle;
	private String todoStartdate;
	private String todoEnddate;
	private String todoContent;
	private String status;
	private String prTitle;

}
