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
    .buttonbar{
        float:right;
    }
    table{
        text-align:center;
        width:800px;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
		                  <a href="#">사원 추가</a>
		               </li>
		               <li class="menu1">
		                  <a href="#">사원 가입승인</a>
		               </li>
		               <li class="menu1">
		                  <a href="#">직위/직무 관리</a>
		               </li>
		               <li class="menu1">
		                  <a href="#">사원 계정삭제</a>
		               </li>
            	</div>
            </ul>
         	</div>
		</div>
		
		   <div class="middle">

        <br><br>
        <div class="input-group mb-3" id="searchbar">
            <input class="form-control mr-sm-2" type="text" placeholder="이름을 입력하세요" style="width:10px">
            <button class="btn btn-success" type="submit">검색</button>
        </div>

        <div class="buttonbar">
            <button type="button" class="btn btn-danger">계정삭제</button>
        </div>

        <br><br>
        <div class="table table-hover" align="center">
            <table>
                <tr>
                    <th width="50px"><input type="checkbox"></th>
                    <th width="100px">이름</th>
                    <th width="100px">아이디</th>
                    <th width="250px">이메일</th>
                    <th width="150px">직위</th>
                    <th width="150px">직무</th>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>이트라</td>
                    <td>ittranet</td>
                    <td>ittranet@gmail.com</td>
                    <td>사원</td>
                    <td>총무</td>
                </tr>
            </table>

		페이징바 자리
        </div>
		
		</div>
	</div>
	</div>

</body>
</html>