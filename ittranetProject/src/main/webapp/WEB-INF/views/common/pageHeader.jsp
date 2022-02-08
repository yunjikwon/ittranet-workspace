<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        height:130px; 
        width:300px;
    }
    #pageLogo>img{
        width:80%;
        height:100px;
        margin:auto;
        margin-top: 20px;
        margin-left: 40px;
        display: inline-block;
    }
</style>
</head>
<body>
    <!--헤더 영역-->
    <div class="header" align="right">
        <span style="font-size: 16px;">김땡땡</span> <span style="font-size: 16px;">사원</span>
        <button class="header-btn" onclick="location.href=''">마이페이지</button>
        <button class="header-btn" onclick="location.href='bye.me'">로그아웃</button>
        <!--관리자에게만 보여지도록-->
        <button class="header-btn" onclick="location.href=''">관리자페이지</button>            
    </div>
    <!--로고영역-->
    <div id="pageLogo">
        <img src="resources/images/colorLogo.png"/>
    </div>
</body>
</html>