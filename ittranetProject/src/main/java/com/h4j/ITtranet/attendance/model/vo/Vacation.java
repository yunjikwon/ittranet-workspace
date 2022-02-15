package com.h4j.ITtranet.attendance.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Vacation {
	 private int vcApplyNo;
	 private int empNo;
	 private String vcType;
	 private String vcStartDate;
	 private String vcEndDate;
	 private String vcTime;
	 private int vcSum;
	 private String vcContent;
	 private String filePath;
	 private String vcEnrollDate;
	 private String applyYn;
	 private String vcStatus;
}
