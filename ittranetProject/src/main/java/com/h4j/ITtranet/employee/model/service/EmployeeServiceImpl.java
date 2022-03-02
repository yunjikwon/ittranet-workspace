package com.h4j.ITtranet.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.calendar.model.vo.Calendar;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.employee.model.dao.EmployeeDao;
import com.h4j.ITtranet.employee.model.vo.Department;
import com.h4j.ITtranet.employee.model.vo.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao eDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Employee loginMember(Employee e) {
		Employee loginUser = eDao.loginMember(sqlSession, e);
		return loginUser;
	}
	
	@Override
	public Department empCount() {
		Department dlist = new Department();
		dlist.setAllEmp(eDao.selectYemployeeCount(sqlSession));
		dlist.setDzero(eDao.selectD0employeeCount(sqlSession));
		dlist.setDone(eDao.selectD1employeeCount(sqlSession));
		dlist.setDtwo(eDao.selectD2employeeCount(sqlSession));
		dlist.setDthr(eDao.selectD3employeeCount(sqlSession));
		dlist.setDfour(eDao.selectD4employeeCount(sqlSession));
		dlist.setDfive(eDao.selectD5employeeCount(sqlSession));
		dlist.setDsix(eDao.selectD6employeeCount(sqlSession));
		dlist.setDsev(eDao.selectD7employeeCount(sqlSession));
		return dlist;
	}
	
	@Override
	public ArrayList<Calendar> selectAdminSchedule() {
		return eDao.selectAdminSchedule(sqlSession);
	}
	

	@Override
	public ArrayList<Calendar> selectUserSchedule(String empNo) {
		return eDao.selectUserSchedule(sqlSession, empNo);
	}


	@Override
	public int mailCheck(String checkMail) {
		return eDao.mailCheck(sqlSession, checkMail);
	}
	
	@Override
	public int idCheck(String checkId) {
		return eDao.idCheck(sqlSession, checkId);
	}
	
	@Override
	public Employee whosMail(String accordMail) {
		return eDao.whosMail(sqlSession, accordMail);
	}
	
	@Override
	public int setTempwd(Employee e) {
		return eDao.setTempwd(sqlSession, e);
	}

	@Override
	public int insertMember(Employee e) {
		int result = eDao.insertMember(sqlSession, e);
		return result;
	}

	@Override
	public int updateMember(Employee e) {
		return eDao.updateMember(sqlSession, e);
	}

	@Override
	public int deleteMember(String empNo) {
		return eDao.deleteMember(sqlSession, empNo);
	}


	@Override
	public int updatePwd(Employee e) {
		return eDao.updatePwd(sqlSession, e);
	}

	@Override
	public int selectWemployeeCount() {
		return eDao.selectWemployeeCount(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectWemployee(PageInfo pi) {
		return eDao.selectWemployee(sqlSession, pi);
	}

	@Override
	public int confirmMember(Employee e) {
		return eDao.confirmMember(sqlSession, e);
	}

	@Override
	public int selectAllemployeeCount() {
		return eDao.selectAllemployeeCount(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectAllemployee(PageInfo pi) {
		return eDao.selectAllemployee(sqlSession, pi);
	}

	@Override
	public ArrayList<Employee> selectAllemployee2() {
		return eDao.selectAllemployee2(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectEmpJobList() {
		return eDao.selectEmpJobList(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectAllemployeeByDept(String deptCode) {
		return eDao.selectAllemployeeByDept(sqlSession, deptCode);
	}

	
	
}
