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
        width: 1400px;
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
</style>
</head>
<body>
    <!--메뉴바 영역-->
    <!--a태그에 각 메뉴 연결해주시면 됩니다-->
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
                    <i class="far fa-comment-dots fa-stack-1x"></i>  
                </span>
                <p><b>채팅</b></p>
            </a>
        </div>
        <div class="menu">
            <a href="">
                <span class="fa-stack fa-3x"> 
                    <i class="fas fa-circle fa-stack-2x" style="color: rgb(191, 177, 241)"></i>
                    <i class="far fa-edit fa-stack-1x"></i>  
                </span>
                <p><b>쪽지</b></p>
            </a>
        </div>
        <div class="menu">
            <a href="">
                <span class="fa-stack fa-3x"> 
                    <i class="fas fa-circle fa-stack-2x" style="color: rgb(181, 211, 236)"></i>
                    <i class="fas fa-bullhorn fa-stack-1x"></i>  
                </span>
                <p><b>게시판</b></p>
            </a>
        </div>
        <div class="menu">
            <a href="">
                <span class="fa-stack fa-3x"> 
                    <i class="fas fa-circle fa-stack-2x" style="color: rgb(183, 170, 199)"></i>
                    <i class="fas fa-desktop fa-stack-1x"></i>  
                </span>
                <p><b>프로젝트</b></p>
            </a>
        </div>
        <div class="menu">
            <a href="">
                <span class="fa-stack fa-3x"> 
                    <i class="fas fa-circle fa-stack-2x" style="color: rgb(177, 183, 241)"></i>
                    <i class="fas fa-calendar-alt fa-stack-1x"></i>  
                </span>
                <p><b>일정</b></p>
            </a>
        </div>
        <div class="menu">
            <a href="">
                <span class="fa-stack fa-3x"> 
                    <i class="fas fa-circle fa-stack-2x" style="color: rgb(199, 177, 241)"></i>
                    <i class="far fa-user fa-stack-1x"></i>  
                </span>
                <p><b>조직도</b></p>
            </a>
        </div>
        <div class="menu">
            <a href="">
                <span class="fa-stack fa-3x"> 
                    <i class="fas fa-circle fa-stack-2x" style="color: rgb(217, 177, 241)"></i>
                    <i class="fas fa-paperclip fa-stack-1x"></i>  
                </span>
                <p><b>전자결재</b></p>
            </a>
        </div>
    </div>
</body>
</html>