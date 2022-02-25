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
            height:700px;
            font-family: 'IBM Plex Sans KR', sans-serif;
    }
    .info{
          font-size:20px;
          width:550px;
          height:600px;
    }
    #profileimg{
                border-radius:70%;
    }
    .buttonbar{
           font-family: 'IBM Plex Sans KR', sans-serif;
    }
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
         
        <br><br>
    	<div class="middle">
        <br><br><br>

        <table class="info" align="center">
                <tr>
                    <th>이름 : </th>
                    <td>이정경</td>
                </tr>
                <tr>
                    <th>아이디 : </th>
                    <td>leejk92</td>
                </tr>
                <tr>
                    <th>이메일 : </th>
                    <td>leefk92@gmail.com</td>
                </tr>
                <tr>
                    <th>전화번호 : </th>
                    <td>010-1234-5678</td>
                </tr>
                <tr>
                    <th>주소 : </th>
                    <td>서울시 강남구 압구정동</td>
                </tr>
                <tr>
                    <th>입사일 : </th>
                    <td>2021-02-04</td>
                </tr>
                <tr>
                    <th>퇴사일 : </th>
                    <td></td>
                </tr>
                <tr>
                    <th>직위 : </th>
                    <td>
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
							직위
                        </button>
                        <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">과장</a>
                        <a class="dropdown-item" href="#">대리</a>
                        <a class="dropdown-item" href="#">사원</a>
                    </td>
                </tr>
                <tr>
                    <th>직무 : </th>
                    <td>
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
							직무
                        </button>
                        <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">개발</a>
                        <a class="dropdown-item" href="#">솔루션제작</a>
                        <a class="dropdown-item" href="#">서버운영</a>
                    </td>
                </tr>
            </table>


        <br><br><br><br><br>

        <div class="buttonbar" align="center">
            <button type="button" class="btn btn-success">수정</button>
            <button type="button" class="btn btn-light">취소</button>
        </div>
        <br><br><br><br><br>

    	 </div>
        </div>
       </div>

</body>
</html>