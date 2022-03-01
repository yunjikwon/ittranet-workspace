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
    <!--a태그에 각 메뉴 연결해주시면 됩니다-->
    <div class="menubar">
        <ul>
            <li class="menu">
                <a href="main.at">
                        <div class="circle" style="background: rgba(26, 161, 121, 0.18)">
                            <i class="fas fa-briefcase attendance_mn"></i> 
                        </div>
                    <p class="attendance_mn"><b>근태관리</b></p>
                </a>
            </li>
            <li class="menu">
                <a href="alllist.ml">
                        <div class="circle" style="background: rgba(91, 211, 211, 0.17)">
                            <i class="far fa-envelope fa-3x mail_mn"></i>  
                        </div>
                        <p class="mail_mn"><b>메일</b></p>
                </a>
            </li>
            <li class="menu">
                <a href="">
                        <div class="circle" style="background: rgba(88, 187, 211, 0.3)">
                            <i class="far fa-comment-dots fa-3x chat_mn"></i> 
                        </div>
                        <p class="chat_mn"><b>채팅</b></p>
                </a>
            </li>
            <li class="menu">
                <a href="list.ms">
                        <div class="circle" style="background: rgba(68, 135, 191, 0.24)">
                            <i class="fas fa-edit fa-3x message_mn"></i> 
                        </div>
                        <p class="message_mn"><b>쪽지</b></p>
                </a>
            </li>
            <li class="menu">
                <a href="list.bo">
                        <div class="circle" style="background: rgba(66, 103, 202, 0.17)">
                            <i class="fas fa-bullhorn fa-3x board_mn"></i> 
                        </div>
                        <p class="board_mn"><b>게시판</b></p>
                </a>
            </li>
            <li class="menu">
                <a href="list.pr">
                        <div class="circle" style="background: rgba(19, 33, 142, 0.2)">
                            <i class="fas fa-desktop fa-3x project_mn"></i> 
                        </div>
                        <p class="project_mn"><b>프로젝트</b></p>
                </a>
            </li>
            <li class="menu">
                <a href="viewUserCal.ca">
                        <div class="circle" style="background: rgba(125, 96, 206, 0.24)">
                            <i class="fas fa-calendar-alt fa-3x schedule schedule_mn"></i> 
                        </div>
                        <p class="schedule schedule_mn"><b>일정</b></p>
                </a>
            </li>
            <li class="menu">
                <a href="chartMain.co">
                        <div class="circle" style="background: rgba(129, 70, 161, 0.26)">
                            <i class="far fa-user fa-3x company_mn"></i> 
                        </div>
                        <p class="company_mn"><b>조직도</b></p>
                </a>
            </li>
            <li class="menu">
                <a href="draftWait.dr?drpersonNo=${loginUser.empNo }">
                        <div class="circle" style="background: rgba(122, 39, 135, 0.26)">
                            <i class="fas fa-paperclip fa-3x approval_mn"></i> 
                        </div>
                        <p class="approval_mn"><b>전자결재</b></p>
                </a>
            </li>
        </ul>
    </div>
</body>
</html>