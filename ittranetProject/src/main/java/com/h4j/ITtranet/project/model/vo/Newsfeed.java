package com.h4j.ITtranet.project.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString


public class Newsfeed {

	private String nfNo;
	private String prNo;
	private String empNo;
	private String nfContent;
	private Date nfDate;
	private String status;
	private String prTitle;
	private String empName;
	private String profile;
	private String prLogo;
}
