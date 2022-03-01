<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .middle{
        width:800px;
        height:800px;
    }
    #searchbar{
        width:300px;
    }
    table{
        text-align:center;
        width:800px;
    }
    .slideTogglebox {
     	width:100%;
     	height:300px;
     	font-weight:bold;
     	background-color:mistyrose;
    }
</style>
</head>
<body>
	<!-- 공용 -->
    <div class="back">
    
    	<!-- 상단: 페이지헤더, 메뉴바 -->
        <div class="innerBack">
			<jsp:include page="../common/pageHeader.jsp" />
 			<jsp:include page="../common/adminMenu.jsp" />

		<!-- 왼쪽 : 사이드바 -->
 		<br clear="both">
 		<div style="position:relative">
			<jsp:include page="../common/sidebar.jsp" />
			<div class="cont">
            <ul id="ac">
                <li class="division">
                    <a href="#">사원관리</a>
                </li>
                <div id="border">
		           <li class="menu1">
	                  <a href="addEmpForm.me">사원 초대</a>
	               </li>
	               <li class="menu1">
	                  <a href="delEmpForm.me">사원 계정 삭제</a>
	               </li>
	               <li class="menu1">
	                  <a href="appEmpForm.me">가입 승인/반려</a>
	               </li>
	               <li class="menu1" style="background:rgb(147, 205, 207);">
	                  <a href="setEmpForm.me" style="color:white;">직무/직위 관리</a>
	               </li>
            	</div>
            </ul>
         	</div>
		</div>
    	<div class="mainOuter" id="mainOuter" style="font-family: 'Gowun Dodum', sans-serif; background:whitesmoke;">
			  	<br><br>

		        <div class="buttonbar" border="1px">
		        	<button type="button" class="btn btn-info">승인</button>
		            <button type="button" class="btn btn-danger">반려</button>
		        </div>

		        <br><br>
		        <div align="center">
		            <table class="table table-striped table-hover">
		            	<thead>
			            	<tr>
			                    <th width="50px"><input type="checkbox"></th>
			                    <th width="100px">이름</th>
			                    <th width="250px">번호</th>
			                    <th width="250px">이메일</th>
			                    <th width="150px">부서</th>
			                    <th width="150px">팀</th>
			                    <th width="150px">직급</th>
			                </tr>
		            	</thead>
		                <tbody>
		                	<c:forEach var="w" items="${ wlist }">
		                		<input type="hidden" value="${ w.empNo }">
				                <tr>
				                    <td><input type="checkbox"></td>
				                    <td>${ w.empName }</td>
				                    <td>${ w.phone }</td>
				                    <td>${ w.email }</td>
				                    <td>
					                    <select name="dept_code">
								            <option value="D2">경영지원부</option>
								            <option value="D3">영업부</option>
								            <option value="D4">재무부</option>
								            <option value="D5">광고홍보부</option>
								            <option value="D6">IT전략부</option>
								            <option value="D7">CS</option>
								            <option selected value="D0">미정</option>
								        </select>
				              		</td>
				                    		                    <td>
					                    <select name="team_code">
								            <option value="T2">총무팀</option>
								            <option value="T3">인사팀</option>
								            <option value="T4">영업팀</option>
								            <option value="T5">영업관리팀</option>
								            <option value="T6">구매팀</option>
								            <option value="T7">회계팀</option>
								            <option value="T8">홍보마케팅팀</option>
								            <option value="T9">기획팀</option>
								            <option value="T10">디자인팀</option>
								            <option value="T11">개발팀</option>
								            <option value="T12">솔루션제작팀</option>
								            <option value="T13">서버운영팀</option>
								            <option value="T14">보안팀</option>
								            <option value="T15">지원팀</option>
								            <option selected value="T0">미정</option>
								        </select>
				              		</td>
				                    <td>
					                    <select name="job_code">
								            <option value="J2">부장</option>
								            <option value="J3">팀장</option>
								            <option value="J4">과장</option>
								            <option value="J5">대리</option>
								            <option value="J6">주임</option>
								            <option value="J7">사원</option>
								            <option value="J8">인턴</option>
								            <option selected value="J0">미정</option>
								        </select>
				              		</td>
				                </tr>
			                </c:forEach>
		                </tbody>

		            </table>
				</div>

        	    <div id="pagingArea">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="appEmpForm.me?cpage=${ pi.currentPage-1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="appEmpForm.me?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="appEmpForm.me?cpage=${ pi.currentPage+1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                </ul>
            	</div>
			        
        	  </div> <%-- mainOuter --%>         

        </div><%-- innerback --%>

    </div><%-- back --%>

</body>
</html>