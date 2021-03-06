package com.h4j.ITtranet.calendar.model.vo;

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
public class Calendar {
	
	private String calNo;
	private String empNo;
	private String calStart;
	private String calEnd;
	private String calContent;
	private String calColor;
	private String allDay;

}
