<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*메인페이지 스타일*/
    body{
		margin:0;
        padding: 0;
	}
    .profile-area{
        width: 400px;
        height: 100%;
        background: rgb(142,207,246);
        background: linear-gradient(157deg, rgba(142,207,246,1) 0%
        , rgba(134,189,251,1) 15%, rgba(169,160,255,1) 52%, rgba(237,198,241,1) 87%
        , rgba(252,225,255,1) 100%);
        position: absolute;
    }
    .logo{
        height: 220px;
    }
    .logo>img{
        width:80%;
        height:100px;
        margin:auto;
        margin-top: 25px;
        margin-left:40px;
        display: inline-block;
    }
    /*프로필 스타일*/
    .profile-box{
        width: 300px;
        height: 300px;
        margin: auto;
        background: lightgray;
        border-radius: 20px;
        margin-bottom: 30px;
    }
    .photo{
        padding: 20px;
        height: 125px;
    }
    .profile{
        height:80px;
        text-align: center;
        font-size: 16px;
    }
    /*근태 스타일*/
    .commute-box{
        width: 300px;
        height: 250px;
        margin: auto;
        background: lightgray;
        border-radius: 20px;
        text-align: center;
    }
    .commute-btn{
        float: left;
        margin-top: 20px;
        height: 120px;
        width: 149px;
        font-size: 14px;
    }
    .content-area{
        width: 1500px;
        float: right;
        padding: 0px 100px;
    }
    /*게시판 연결*/
    .contentbox{
        background: lightgray;
        border-radius: 20px;
        float: left;
        margin-top: 30px;
        margin-left: 30px;
        margin-right: 30px;
    }
    .category-title{
        height: 40px;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
        background-color: rgba(196, 158, 212, 0.8);
        font-size: 18px;
        font-weight: 600;
        line-height: 40px;
        color: rgb(61, 58, 58);
    }
    .plus-btn{
        color: rgb(53, 50, 50);
        text-decoration: none;
        float: right;
        font-size: 22px;
        margin-right: 15px;
    }
    table{
        margin: auto;
        border-spacing: 0 20px;
        width: 90%;
        text-align: left;
        font-size: 15px;
    }
    .newBoardTr:hover {
    	cursor:pointer;
    	background-color: rgb(177, 176, 176);
    }
    .btnStyle:hover{
    	cursor:pointer;
    	text-decoration:none;
    }
</style>
</head>
<body>
    <div class="outer">
    <!-- 헤더 -->
    <jsp:include page="header.jsp" />
    <!-- 메뉴바 -->
    <jsp:include page="userMenu.jsp" />
        <!--메인페이지-->
        <!--좌측 프로필 영역-->
        <div class="profile-area">
            <div class="logo">
                <img src="resources/images/logo.png"  alt="logo	" />
            </div>
            <div class="profile-box">
                <div class="photo" align="center">
                    <!--case1:프로필사진 미등록 시-->
                    <span class="fa-stack fa-3x"> 
                        <i class="fas fa-circle fa-stack-2x" style="color:white"></i>
                        <i class="far fa-user fa-stack-1x"></i>  
                    </span>
                    <!--case2:프로필사진 등록 시 등록된 이미지-->
                    <!--
                        <img src=""/>
                    -->
                </div>
                <div class="profile">
                    <!--사용자 이름, 부서명 연결-->
                    <p style="font-weight: 900;">김땡땡 사원</p>
                    개발팀
                </div>
                <div align="center">
                    <button class="header-btn" onclick="location.href=''">마이페이지</button>
                    <button class="header-btn" onclick="location.href='bye.me'">로그아웃</button>   
                </div>
            </div>
            <div class="commute-box">
                <div style="height: 50px; font-size: 18px; margin: 20px; padding-top: 20px;">
                    <!--오늘날짜-->
                    xxxx년 xx월 xx일 <br>
                    <!--현재시간-->
                    12:00:00
                </div>
                <div class="commute-btn" style="border-right: 0.1px solid rgb(156, 156, 156);">
                    <i class="far fa-arrow-alt-circle-right fa-4x fa-rotate-90" style="color: rgb(163, 100, 223);"></i>
                    <br>
                    <p>
                        출근하기 <br>
                        00:00:00
                    </p>   
                </div>
                <div class="commute-btn">
                    <i class="far fa-arrow-alt-circle-right fa-4x" style="color: rgb(163, 100, 223);"></i>
                    <br>
                    <p>
                        퇴근하기 <br>
                        00:00:00
                    </p>   
                </div>
            </div>
        </div>

        <!--각 메뉴 연결할 영역-->
        <div class="content-area">
            <div class="contentbox" style="width: 390px; height: 280px;">
                <div class="category-title">
                    &nbsp;&nbsp;프로젝트
                    <a href="" class="plus-btn">+</a>
                </div>
                <table>
                    <tr>
                        <th width="90">프로젝트명</th>
                        <td>내용</td>
                    </tr>
                </table>
            </div>
            <div class="contentbox" style="width: 390px; height: 280px; margin-left: 0px;">
                <div class="category-title">
                    &nbsp;&nbsp;결제내역
                    <a href="" class="plus-btn">+</a>
                </div>
                <table>
                    <tr>
                        <th width="300">기안 제목</th>
                        <td>상태</td>
                    </tr>
                </table>
            </div>
            <div class="contentbox" style="width: 390px; height: 590px; float: right; margin-left: 0px;">
                <div class="category-title">
                    &nbsp;&nbsp;일정
                    <a href="" class="plus-btn">+</a>
                </div>
                <div id="calendar-area" style="height: 320px; padding: 10px;" align="center">
                    <!--캘린더 넣은 다음 border 지우기!-->
                    <div style="width: 300px; height: 300px; border: solid 1px;">
                        캘린더자리
                    </div>         
                </div>
                <table>
                    <tr>
                        <th colspan="2">오늘의 일정</th>
                    </tr>
                    <tr>
                        <td width="50">12:00</td>
                        <td>일정내용</td>
                    </tr>
                </table>
            </div>
            <div class="contentbox" style="width: 810px; height: 280px;">
                <div class="category-title">
                    &nbsp;&nbsp;게시판
                    <a href="list.no" class="plus-btn btnStyle">+</a>
                </div>
                <table id="newBoardList">
                    <tbody>
                    
                    </tbody>
                </table>
                <script>
                	$(function(){
                		selectNewList();
                		
                		$(document).on("click", "#newBoardList>tbody>tr", function(){
                			
                			var type = $(this).children(".type").text();
                			console.log(type);
                			var number = $(this).children(".type").children(".number").val();
                			console.log(number);
                			
                			if(type === '공지사항'){
                				location.href = "detail.no?nno=" + number;
                			}else{
                				location.href = "detail.bo?bno=" + number;
                			}
                		})
                	})
                	
                	function selectNewList(){
                		$.ajax({
                			url: "newList.no",
                			success:function(list){
                				console.log(list);
                				
                				let value="";
                				for(let i in list){
                					value += "<tr class='newBoardTr'>"
                							+ 	"<th width='120' class='type' height='30'>";
                					if(list[i].headerNo == 0){
                						value += "자유게시판" + "<input type='hidden' name='bno' class='number' value='" + list[i].noticeNo + "'>" + "</th>"
		                						+ 	"<td class='title' width='500' height='30'>" + list[i].noticeTitle + "</td>"
		            							+	"<td width='120' height='30'>" + list[i].createDate + "</td>";
                					}else{
                						value += "공지사항" + "<input type='hidden' name='nno' class='number' value='" + list[i].noticeNo + "'>" + "</th>"
	                							+ 	"<td class='title' width='500' height='30'>" + list[i].noticeTitle + "</td>"
	                							+	"<td width='120' height='30'>" + list[i].createDate + "</td>";
                					}
                				}
                				
                				$("#newBoardList>tbody").html(value);
                			},error:function(){
                				console.log("최신글 ajax 통신 실패");
                			}
                		})
                	}
                </script>
            </div>
        </div>
    </div>
    <br clear="both">
    <!-- 푸터바 -->
    <jsp:include page="footer.jsp" />
</body>
</html>