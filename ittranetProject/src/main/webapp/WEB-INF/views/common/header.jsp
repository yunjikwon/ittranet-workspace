<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- alert창 꾸미기 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/07e0557a32.js" crossorigin="anonymous"></script>
<style>
    /*헤더 스타일*/
    div{
        box-sizing: border-box;
    }
    .outer{
        margin:auto;
        background:rgb(238, 235, 235);
        width:100vw;
        height:100vh;
    }
    .headerOuter{
        width: 1200px;
        float:right;
        height: 50px;
        margin-bottom: 20px;
        margin-right: 30px;
    }
    .header-btn{
        border: none;
        background: rgb(168, 201, 185);
        height: 35px;
        border-radius: 5px;
        margin: 7px;
    }
    .header-btn:hover {
    	transform: scale(1.2);
    	background:lightseagreen;
    	color:white;
    }
    .menu>a{
        text-decoration: none; 
        color:gray;
    }
</style>
</head>
<body>

        <!--헤더 영역-->
        <div class="headerOuter" align="right">
            <span style="font-size: 16px;">${ loginUser.empName }</span> <span style="font-size: 16px;">님 환영합니다</span>
            <button class="header-btn" onclick="location.href='myPage.me'">마이페이지</button>
            <button class="header-btn" onclick="location.href='bye.me'">로그아웃</button>
           	<c:if test="${ loginUser.empNo eq '1' }">
            	<button class="header-btn" onclick="location.href='goUserMain.me'">유저페이지</button>
            </c:if>        
        </div>

</body>
</html>