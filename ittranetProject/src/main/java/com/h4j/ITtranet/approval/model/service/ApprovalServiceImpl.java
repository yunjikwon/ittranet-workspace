package com.h4j.ITtranet.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.approval.model.dao.ApprovalDao;
import com.h4j.ITtranet.approval.model.vo.AppLine;
import com.h4j.ITtranet.approval.model.vo.Approval;
import com.h4j.ITtranet.common.model.vo.Attachment;
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
	public int insertAttachment(Attachment at) {
		return aDao.insertAttachment(sqlSession, at);
	}
	
	@Override
	public int insertDraft(Approval app, int formNo, ArrayList<AppLine> appList) {
		int result1 = aDao.insertDraft(sqlSession, app);
		
		int result2 = 0;
		switch(formNo) {
			case 1: result2 = aDao.insertBussinessPlan(sqlSession, app);
			        break;
			case 2: result2 = aDao.insertApology(sqlSession, app);
					break;
			case 3: result2 = aDao.insertOvertime(sqlSession, app);	
					break;
			case 4: result2 = aDao.insertExpenditure(sqlSession, app);
					break;
			case 5: result2 = aDao.insertBudget(sqlSession, app);		
					break;
			case 6: result2 = aDao.insertProceedings(sqlSession, app);		
					break;
		}
		
		int result3 = aDao.insertAppLine(sqlSession, app, appList);
		return result1 * result2 * result3;
		
	}
	
	// 기안게시판 select
	@Override
	public int selectListCount(int category, int empNo) {
		return aDao.selectListCount(sqlSession, category, empNo);
	}

	@Override
	public ArrayList<AppLine> selectAppName() {
		return aDao.selectAppName(sqlSession);
	}
	
	@Override
	public ArrayList<Approval> selectList(PageInfo pi, int category, int empNo) {
		return aDao.selectList(sqlSession, pi, category, empNo);
	}

	
	// 기안게시판 검색
	public ArrayList<Approval> selectSearchForm(HashMap<String, Integer> map) {
		return aDao.selectSearchForm(sqlSession, map);
	}
	public ArrayList<Approval> selectSearchDate(HashMap<String, Integer> map) {
		return aDao.selectSearchDate(sqlSession, map);
	}

	// 기안게시판 상세조회
	@Override
	public Attachment selectAttachment(int drNo) {
		return aDao.selectAttachment(sqlSession, drNo);
	}
	
	@Override
	public Approval selectDetail(int drNo, String drDivision) {
		
		Approval result2 = null;
		switch(drDivision) {
			case "사업계획서" : result2 = aDao.businessDetail(sqlSession, drNo);
			        break;
			case "시말서": result2 = aDao.apologyDetail(sqlSession, drNo);
					break;
			case "연장근무신청": result2 = aDao.overtimeDetail(sqlSession, drNo);
					break;
			case "지출결의서": result2  = aDao.expenditureDetail(sqlSession, drNo);
					break;
			case "추가예산신청": result2 = aDao.budgetDetail(sqlSession, drNo);	
					break;
			case "회의록": result2 = aDao.proceedingsDetail(sqlSession, drNo);
					break;
		}
		return result2;
	}

	//---------------------------------------------------------------------------------------
	// 결재 게시판 select
	@Override
	public int selectApListCount(int category, int empNo) {
		return aDao.selectApListCount(sqlSession, category, empNo);
	}

	@Override
	public ArrayList<Approval> selectApList(PageInfo pi, int category, int empNo) {
		return aDao.selectApList(sqlSession,pi, category, empNo);
	}

	// 반려 상태 update
	@Override
	public int updateReject(HashMap<String, Integer> map) {
		int result1 = aDao.apUpdateReject(sqlSession, map);
		int result2 = aDao.drUpdateReject(sqlSession, map);
		return result1 * result2;
	}

	// 완료 상태 update
	@Override
	public int updateComplete(HashMap<String, Integer> map) {
		int result1 = aDao.apUpdateComplete(sqlSession, map);
		int result2 = aDao.drUpdateComplete(sqlSession, map);
		return result1 * result2;
	}
	

	
	
	

}
