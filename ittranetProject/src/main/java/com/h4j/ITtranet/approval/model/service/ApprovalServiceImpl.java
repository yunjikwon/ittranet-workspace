package com.h4j.ITtranet.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.approval.model.dao.ApprovalDao;
import com.h4j.ITtranet.approval.model.vo.AppLine;
import com.h4j.ITtranet.approval.model.vo.Approval;
import com.h4j.ITtranet.common.model.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 결재선 검색 - 팀
	@Override
	public ArrayList<AppLine> selectSearchTeam(String keyword) {
		return aDao.selectSearchTeam(sqlSession, keyword);
	}
	
	// 결재선 검색 - 성명
	@Override
	public ArrayList<AppLine> selectSearchName(String keyword) {
		return aDao.selectSearchName(sqlSession, keyword);
	}
	
	// 기안 insert
	@Override
	public int insertDraft(Approval app, int formNo, ArrayList<AppLine> appList) {
		int result1 = aDao.insertDraft(sqlSession, app);
		
		int result2 = 0;
		switch(formNo) {
			case 1: aDao.insertBussinessPlan(sqlSession, app);
			        break;
			case 2: aDao.insertApology(sqlSession, app);
					break;
			case 3: aDao.insertOvertime(sqlSession, app);	
					break;
			case 4: aDao.insertExpenditure(sqlSession, app);
					break;
			case 5: aDao.insertBudget(sqlSession, app);		
					break;
			case 6: aDao.insertProceedings(sqlSession, app);		
					break;
		}
		
		int result3 = aDao.insertAppLine(sqlSession, app, appList);
		return result1 * result2 * result3;
		
	}
	
	// 기안게시판 select
	@Override
	public int selectListCount(int category) {
		return aDao.selectListCount(sqlSession, category);
	}

	@Override
	public ArrayList<Approval> selectList(PageInfo pi, int category) {
		return aDao.selectList(sqlSession, pi, category);
	}

	
	// 기안게시판 검색
	public ArrayList<Approval> selectSearchForm(HashMap<String, Integer> map) {
		return aDao.selectSearchForm(sqlSession, map);
	}
	public ArrayList<Approval> selectSearchDate(HashMap<String, Integer> map) {
		return aDao.selectSearchDate(sqlSession, map);
	}

	

	
	
	

}
