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
    /*그라데이션배경*/
    .back{
        background: rgb(142,207,246);
        background: linear-gradient(157deg, rgba(142,207,246,1) 0%
        , rgba(134,189,251,1) 15%, rgba(169,160,255,1) 52%, rgba(237,198,241,1) 87%
        , rgba(252,225,255,1) 100%);
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        padding: 60px;
        padding-bottom:0px;
    }
    /*연회색배경*/
    .innerBack{
        width:1700px;
        margin:auto;
        padding: 10px;
        background:rgb(233, 232, 232);
        border-radius: 30px;
        margin-bottom: 100px;
    }
    .header{
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
    .menu>a{
        text-decoration: none; 
        color:gray;
    }
    /*컬러로고스타일*/
    #pageLogo{
        height:10px;
        width: 250px; 
    }
    #pageLogo img{
        width:270px;
        height:120px;
        margin:auto;
        margin-top: 75px;
        margin-left: 70px;
        display: inline-block;
    }
    .header-btn:hover {
    	transform: scale(1.1);
    	background:lightseagreen;
    	color:white;
    }
    #pageLogo:hover {
    	transform:scale(1.1);
    	cursor:pointer;
    }
</style>
</head>
<body>
    <!--헤더 영역-->
    <div class="header" align="right">
        <span style="font-size: 16px;">${ loginUser.empName }</span> <span style="font-size: 16px;">사원</span>
        <button class="header-btn" onclick="location.href=''">마이페이지</button>
        <button class="header-btn" onclick="location.href='bye.me'">로그아웃</button>
        <!--관리자에게만 보여지도록-->
        <button class="header-btn" onclick="location.href=''">관리자페이지</button>            
    </div>
    <!--로고영역-->
    <c:choose>
    	<c:when test="${ loginUser.empNo == '1' }">
    		<div id="pageLogo" onclick="goAdminMain();">
		        <img src="resources/images/colorLogo.png"/>
		    </div>
    	</c:when>
    	<c:otherwise>
    		<div id="pageLogo" onclick="goUserMain();">
		        <img src="resources/images/colorLogo.png"/>
		    </div>
    	</c:otherwise>
    </c:choose>
    
    <script>
     	function goUserMain(){
     		location.href="goUserMain.me"; 
     	}
     	
     	function goAdminMain(){
     		location.href="goAdminMain.me"; 
     	}
    </script>
</body>
</html>