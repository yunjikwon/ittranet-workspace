package com.h4j.ITtranet.approval.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.approval.model.vo.AppLine;
import com.h4j.ITtranet.approval.model.vo.Approval;
import com.h4j.ITtranet.common.model.vo.PageInfo;

public interface ApprovalService {
	
	// 결재선 검색
	ArrayList<AppLine> selectSearchLine(AppLine appLine);
	
	// 기안 게시판 listCount
	int selectListCount(int category);
	
	// 기안 게시판 select
	ArrayList<Approval> selectList(PageInfo pi, int category);
	
	
	
	
	
}
