<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*메뉴바 스타일*/
    .menubar{
        width: 1200px;
        float: right;
        height: 170px;
    }
    .menu{
        width: 140px;
        height: 100%;
        float: left;
        box-sizing: border-box;
        text-align: center;       
    }
    .menu>p{
        font-size:medium;
    }
    /*hover*/
    .menu:hover{
        cursor: pointer;
    }
    .menu>a{
        text-decoration: none; 
        color:gray;
    }
</style>
</head>
<body>
    <!--메뉴바 영역-->
    <div class="menubar">
        <div class="menu">
            <a href="">
                <span class="fa-stack fa-3x"> 
                    <i class="fas fa-circle fa-stack-2x" style="color: rgb(177, 212, 241)"></i>
                    <i class="fas fa-briefcase fa-stack-1x"></i>  
                </span>
                <p><b>근태관리</b></p>
            </a>
        </div>
        <div class="menu">
            <a href="">
                <span class="fa-stack fa-3x"> 
                    <i class="fas fa-circle fa-stack-2x" style="color: rgb(147, 205, 207)"></i>
                    <i class="far fa-envelope fa-stack-1x"></i>  
                </span>
                <p><b>메일</b></p>
            </a>
        </div>
        <div class="menu">
            <a href="">
                <span class="fa-stack fa-3x"> 
                    <i class="fas fa-circle fa-stack-2x" style="color: rgb(171, 187, 240)"></i>
                    <i class="far fa-smile fa-stack-1x"></i>  
                </span>
                <p><b>사원관리</b></p>
            </a>
        </div>
        <div class="menu">
            <a href="">
                <span class="fa-stack fa-3x"> 
                    <i class="fas fa-circle fa-stack-2x" style="color: rgb(181, 211, 236)"></i>
                    <i class="fas fa-bullhorn fa-stack-1x"></i>  
                </span>
                <p><b>게시판관리</b></p>
            </a>
        </div>
        <div class="menu">
            <a href="">
                <span class="fa-stack fa-3x"> 
                    <i class="fas fa-circle fa-stack-2x" style="color: rgb(183, 170, 199)"></i>
                    <i class="fas fa-building fa-stack-1x"></i>  
                </span>
                <p><b>회사관리</b></p>
            </a>
        </div>
        <div class="menu">
            <a href="">
                <span class="fa-stack fa-3x"> 
                    <i class="fas fa-circle fa-stack-2x" style="color: rgb(217, 177, 241)"></i>
                    <i class="fas fa-paperclip fa-stack-1x"></i>  
                </span>
                <p><b>결재관리</b></p>
            </a>
        </div>
    </div>
</body>
</html>