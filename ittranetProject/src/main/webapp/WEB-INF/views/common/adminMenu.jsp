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
        width: 72%;
        float: right;
        height: 150px;
        list-style: none;
        margin-bottom: 30px;
    }
    .menu{
        width: 120px;
        height: 100%;
        float: left;
        box-sizing: border-box;
        text-align: center;       
    }
    .menu>p{
        font-size:medium;
    }
    .circle{
        border-radius:75px; 
        width: 75px; 
        height: 75px; 
        margin: auto; 
        padding-top: 18px;
        margin-bottom: 15px;
    }
    /*hover*/
    div.circle:after {
        bottom: 4px;
        box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.4);
        right: 4px;
        -webkit-transform: skew(2deg, 2deg);
        transform: skew(2deg, 2deg);
        position: absolute;
        z-index: -1;
        -webkit-transition: all 0.4s ease;
        transition: all 0.4s ease;
        content: "";
        height: 200px;
        width: 90%;
    }
    div.circle:hover {
        box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);
    }

    .menu {
        color: #333;
        text-decoration: none;
        display: inline-block;
        padding: 15px 0;
        position: relative;
    }
    .menu:after {    
        background: none repeat scroll 0 0 transparent;
        bottom: 0;
        content: "";
        display: block;
        height: 2px;
        left: 50%;
        position: absolute;
        background: #e6a4e0;
        transition: width 0.3s ease 0s, left 0.3s ease 0s;
        width: 0;
    }
    .menu:hover:after { 
        width: 100%; 
        left: 0; 
    }
    .menu a:hover{
        text-decoration: none;
        color: black;
    }
    .menu i{
        font-size: 35px;
    }
</style>
</head>
<body>
    <!--메뉴바 영역-->
    <ul class="menubar">
        <li class="menu">
            <a href="">
                    <div class="circle" style="background: rgb(147, 205, 207)">
                        <i class="fas fa-briefcase fa-3x"></i> 
                    </div>
                <p><b>근태관리</b></p>
            </a>
        </li>
        <li class="menu">
            <a href="">
                    <div class="circle" style="background: rgb(171, 187, 240)">
                        <i class="far fa-envelope fa-3x"></i>  
                    </div>
                    <p><b>메일</b></p>
            </a>
        </li>
        <li class="menu">
            <a href="">
                    <div class="circle" style="background: rgb(191, 177, 241)">
                        <i class="far fa-smile fa-3x"></i> 
                    </div>
                    <p><b>사원관리</b></p>
            </a>
        </li>        
        <li class="menu">
            <a href="">
                    <div class="circle" style="background: rgb(194, 184, 206)">
                        <i class="fas fa-bullhorn fa-3x"></i> 
                    </div>
                    <p><b>게시판관리</b></p>
            </a>
        </li>
        <li class="menu">
            <a href="">
                    <div class="circle" style="background: rgb(194, 151, 250)">
                        <i class="fas fa-building fa-3x"></i> 
                    </div>
                    <p><b>회사관리</b></p>
            </a>
        </li>
        <li class="menu">
            <a href="">
                    <div class="circle" style="background: rgb(240, 195, 237)">
                        <i class="fas fa-paperclip fa-3x"></i> 
                    </div>
                    <p><b>결재관리</b></p>
            </a>
        </li>
    </ul>
</body>
</html>