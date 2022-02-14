package com.h4j.ITtranet.employee.model.service;

import com.h4j.ITtranet.employee.model.vo.Employee;

public interface EmployeeService {
	
	// 로그인 (select)
	Employee loginMember(Employee e);
	
	// 이메일 중복체크(ajax/select)
	int mailCheck(String checkMail);
	
	// 아이디 중복체크 (ajax / select)
	// 아이디 개수 반환 (이미 있는 아이디면 1, 없는 아이디면 0)
	int idCheck(String checkId);
	
	// 회원가입 (insert)
	int insertMember(Employee e);
	
	// 정보수정 (update)
	int updateMember(Employee e);
	
	// 회원탈퇴 (update)
	int deleteMember(String empId);

}
