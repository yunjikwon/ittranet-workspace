package com.h4j.ITtranet.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.h4j.ITtranet.approval.model.vo.AppLine;
import com.h4j.ITtranet.approval.model.vo.Approval;
import com.h4j.ITtranet.common.model.vo.PageInfo;

public interface ApprovalService {
	
	// 결재선 검색
	ArrayList<AppLine> selectSearchTeam(String keyword);
	ArrayList<AppLine> selectSearchName(String keyword);
	
	// 기안 insert
	int insertDraft(Approval app, int formNo, ArrayList<AppLine> appList);
	
	// 기안 게시판 listCount
	int selectListCount(int category);
	
	// 기안 게시판 select
	ArrayList<Approval> selectList(PageInfo pi, int category);
	
	// 기안 게시판 검색
	ArrayList<Approval> selectSearchForm(HashMap<String, Integer> map);
	ArrayList<Approval> selectSearchDate(HashMap<String, Integer> map);
	
	
	
}
