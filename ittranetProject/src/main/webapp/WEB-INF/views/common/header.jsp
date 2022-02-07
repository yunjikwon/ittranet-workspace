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
    .outer{
        margin:auto;
        background:rgb(238, 235, 235);
        width:100vw;
        height:100vh;
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

</body>
</html>