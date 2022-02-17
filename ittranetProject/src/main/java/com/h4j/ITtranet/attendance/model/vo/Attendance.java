package com.h4j.ITtranet.attendance.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Attendance {
	 private int attNo;
	 private int empNo;
	 private String attDate;
	 private String arriveTime;
	 private String leaveTime;
	 private String stepoutTime;
	 private String outworkTime;
	 private String attStatus;
	 
	 private int lateCount;
	 private int earlyCount;
	 private int dayCount;
	 private double workSum;
	 private int absenceCount;
}
