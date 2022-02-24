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
            font-family: 'IBM Plex Sans KR', sans-serif;
    }
    .memberinvite{
                  background-color:white;
                  margin:10px;
                  width:400px;
                  height:300px;
    }
    .memberinvite input{
                        width:300px;
    }
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
        
        <div class="memberinvite">

            <br>
            <h1>멤버 초대</h1>

            <br><br>

			이메일 주소 : <input type="text" placeholder="내용을 입력해주세요">

            <br><br><br><br><br>
            
            <div class="buttonbar" align="center">
                <button type="button" class="btn btn-success">초대 보내기</button>
                <button type="button" class="btn btn-light">취소</button>
            </div>
            

        </div>

    </div>
</body>
</html>