package com.h4j.ITtranet.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.h4j.ITtranet.approval.model.vo.AppLine;
import com.h4j.ITtranet.approval.model.vo.Approval;
import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;

@Repository
public class ApprovalDao {

	// 결재선 검색
	public ArrayList<AppLine> selectSearchTeam(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("appMapper.selectSearchTeam", keyword);
	}
	
	public ArrayList<AppLine> selectSearchName(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("appMapper.selectSearchName", keyword);
	}
	
	
	// 기안 게시판 paging
	public int selectListCount(SqlSession sqlSession, int category, int empNo) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("category",category);
		map.put("empNo",empNo);
		return sqlSession.selectOne("appMapper.selectListCount", map);
	}
	
	// 기안 게시판 select
	//결재자 리스트
	public ArrayList<AppLine> selectAppName(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("appMapper.selectAppName");
	}
	public ArrayList<Approval> selectList(SqlSession sqlSession, PageInfo pi, int category, int empNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("category",category);
		map.put("empNo",empNo);
		return (ArrayList)sqlSession.selectList("appMapper.selectList", map, rowBounds);
		
	}

	// draft insert
	public int insertDraft(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.insertDraft", app);
	}
	
	// 문서별 insert
	public int insertBussinessPlan(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.businessplan", app);
	}
	public int insertApology(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.apology", app);
	}
	public int insertOvertime(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.overtime", app);
	}
	public int insertExpenditure(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.expenditure", app);
	}
	public int insertBudget(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.budget", app);
	}
	public int insertProceedings(SqlSession sqlSession, Approval app) {		
		return sqlSession.insert("appMapper.proceedings", app);
	}
	
	// 결재선 insert
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("appMapper.insertAttachment", at);
	}
	public int insertAppLine(SqlSession sqlSession, Approval app, ArrayList<AppLine> appList) {		
		int result = 0;
		for(AppLine ap : appList) {
			System.out.println("결재선insert appList : " + ap);
			result = sqlSession.insert("appMapper.appline", ap);
		}
		return result;
	}
	
	// 기안게시판 검색
	public ArrayList<Approval> selectSearchForm(SqlSession sqlSession, HashMap<String, Integer> map) {
		return (ArrayList)sqlSession.selectList("appMapper.selectSearchForm",map);
	}
	public ArrayList<Approval> selectSearchDate(SqlSession sqlSession, HashMap<String, Integer> map) {
		return (ArrayList)sqlSession.selectList("appMapper.selectSearchDate",map);
	}
	
	
	// 기안게시판 상세페이지
	public Attachment selectAttachment(SqlSessionTemplate sqlSession, int drNo){
		return (Attachment)sqlSession.selectOne("appMapper.selectAttachment", drNo);
	}
	
	
	public Approval businessDetail(SqlSession sqlSession, int drNo){
		return sqlSession.selectOne("appMapper.businessDetail", drNo);
	}
	public Approval apologyDetail(SqlSession sqlSession, int drNo){
		return sqlSession.selectOne("appMapper.apologyDetail", drNo);
	}
	public Approval overtimeDetail(SqlSession sqlSession, int drNo){
		return sqlSession.selectOne("appMapper.overtimeDetail", drNo);
	}
	public Approval expenditureDetail(SqlSession sqlSession, int drNo){
		return sqlSession.selectOne("appMapper.expenditureDetail", drNo);
	}
	public Approval budgetDetail(SqlSession sqlSession, int drNo){
		return sqlSession.selectOne("appMapper.budgetDetail", drNo);
	}
	public Approval proceedingsDetail(SqlSession sqlSession, int drNo){
		return sqlSession.selectOne("appMapper.proceedingsDetail", drNo);
	}

	//-------------------------------------------------------------------------------
	// 결재 게시판 select
	public int selectApListCount(SqlSession sqlSession, int category, int empNo) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("category",category);
		map.put("empNo", empNo);
		System.out.println("map: " + map);
		return sqlSession.selectOne("appMapper.selectApListCount", map);
	}

	public ArrayList<Approval> selectApList(SqlSession sqlSession, PageInfo pi, int category, int empNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("category",category);
		map.put("empNo", empNo);
		
		return (ArrayList)sqlSession.selectList("appMapper.selectApList", map, rowBounds);
	}

	
	// 반려 상태 update
	public int apUpdateReject(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("appMapper.apReject", map);
	}
	
	public int drUpdateReject(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("appMapper.drReject", map);
	}

	// 완료 상태 update
	public int apUpdateComplete(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("appMapper.apComplete", map);
	}
	
	public int drUpdateComplete(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("appMapper.drComplete", map);
	}

	//_------------------------------------------------------------------
	// 관리자 권한 결재 리스트
	public int selectadminApListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("appMapper.selectadminApListCount");
	}

	public ArrayList<Approval> selectadminApList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("appMapper.selectadminApList", rowBounds);
	}
	
	// 관리자 권한 반려/결재 update
	public int apAdminReject(SqlSession sqlSession, int drNo) {
		return sqlSession.update("appMapper.apAdminReject", drNo);
	}
	
	public int drAdminReject(SqlSession sqlSession, int drNo) {
		return sqlSession.update("appMapper.drAdminReject", drNo);
	}
	
	public int drAdminComplete(SqlSession sqlSession, int drNo) {
		return sqlSession.update("appMapper.drAdminComplete", drNo);
	}

	public int apAdminComplete(SqlSessionTemplate sqlSession, int drNo) {
		return sqlSession.update("appMapper.apAdminComplete", drNo);
	}
	
	
}
