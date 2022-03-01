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
public class Department {
	
	private int allEmp;
	private int dzero; // 미정
	private int done; // 대표
	private int dtwo; // 경영지원부
	private int dthr; // 영업부
	private int dfour; // 재무부
	private int dfive; // 광고홍보부
	private int dsix; // IT전략부
	private int dsev; // CS

}
