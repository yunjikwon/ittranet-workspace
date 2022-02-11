package com.h4j.ITtranet.approval.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.approval.model.vo.AppLine;

public interface ApprovalService {
	
	// 결재선 검색
	ArrayList<AppLine> selectSearchLine(AppLine appLine);
	
	
	
	
	
	
}
