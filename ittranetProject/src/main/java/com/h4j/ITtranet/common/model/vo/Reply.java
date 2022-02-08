package com.h4j.ITtranet.common.model.vo;


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
public class Reply {

	private int replyNo;
	private String empNo;
	private String refCode;
	private int refNo;
	private String replyContent;
	private int replyOriginNo;
	private int replyBranch;
	private String createDate;
	private String status;
}
