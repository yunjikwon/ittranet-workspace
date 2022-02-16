<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    .wrap{
       padding: 30px;
    }
    .menuname{
        display:inline-block;
        border: 1px solid;
        width: 300px;
        margin-left: 20px;
    }
    
    button{
        width: 70px;
        height: 35px;
        border-radius: 1mm;
        border: none;
        font-size: 13px;
        font-weight: bold;
        color: white;
    }
    .button1{
        background-color: rgb(165, 137, 177); 
        float: right;
        margin: 10px;
    }
    .button2{
        background-color: rgb(202, 183, 211);       
        float: right;
        margin: 10px;
    }
    .button3{
        background-color: rgb(160, 156, 163);       
        float: right;
        margin: 10px;
        margin-right: 40px;
    }
    .todo{
        margin-left: 50px;
    }

    tr{
        height: 40px;
        background-color: rgba(255, 255, 255, 0.57);
        border-bottom: 1px solid silver;
        font-size: 13.5px;
    }

    #newsfeed{
       border:1px solid blue;
       padding: 15px;
       margin-left: 10px;
   }

   #feedwrite{
       border:1px solid rgb(190, 190, 190);
       border-radius: 5mm;
       width: 830px;
       height: 150px;
       padding: 10px;
       background-color: rgba(211, 196, 220, 0.47);
   }

   .write{
       width: 700px;
       height: 80px;
       border-radius: 2mm;
       border:1px solid rgb(190, 190, 190);
   }

   #file{
       margin-left: 100px;
       margin-top: 5px;
       font-size: 13px;
   }

   #writeok{
       float: right;
       margin-right: 20px;
   }

   .feedlist{
       border:1px solid rgb(190, 190, 190);
       border-radius: 5mm;
       background-color: rgba(224, 224, 224, 0.87);
       width: 830px;
       padding: 10px;
       
   }
   .profile{
       display:inline-block;
       width: 70px;
       height: 70px;
       background-color: white;
       border-radius: 50%;
       border: 1px solid;
       margin: 10px;
   }
   .projectmem{
       display:inline-block;
       border: 1px solid;
       width: 500px;
       height: 30px;
       margin-left: 10px;
   }
   .feedcontent{
       width: 680px;
       border: 1px solid ;
       margin-left: 105px;
       font-size: 13px;
   }
   .reply{
       background-color: rgb(222, 216, 225);
       border-radius: 3mm;
       width: 700px;
       margin-left: 100px;
       margin-top: 15px;
       padding: 15px;
   }
   .replylist{
       margin-bottom: 15px;
       border: 1px solid;
   }
   .date{
       float: right;
       margin-right: 70px;
   }
   .replycontent{
       width: 585px;
       height: 60px;
       border-radius: 2mm;
       border: 1px solid rgb(199, 198, 198);
   }
   .replyok{
       background-color: rgb(187, 159, 202);   
       margin-left: 8px;
   }

   ::placeholder{
       font-size: 13px;
   }

</style>
</head>
<body>
<div class="back">
 <div class="innerBack">
 	<jsp:include page="../common/pageHeader.jsp" />
 	<jsp:include page="../common/userMenu.jsp" />
 	
 	<br clear="both">
 	<div style="position:relative">
 	<jsp:include page="../common/sidebar.jsp"  />
 		<div class="cont">
          <ul id="ac">
             <li class="division">
               <a href="#">프로젝트</a>
             </li>
                <div id="border">
		               <li class="menu1">
		                  <a href="list.pr">내 프로젝트</a>
		               </li>
		               <li class="menu1">
		                  <a href="#">프로젝트 만들기</a>
		               </li>
		               <li class="menu1">
		                  <a href="#">내 업무</a>
		               </li>
		               <li class="menu1">
		                  <a href="news.pr">뉴스피드</a>
		               </li>
            	</div>
            </ul>
         </div>
 

    <div class="mainOuter"> 
    <div class="wrap">   
        <h4 style="font-weight:bold;">프로젝트 명</h4>
        
        <!--담당 업무, 업무 버튼, 리스트-->
        <div class="menuname">
            <br>
            <h6 style="font-weight: bold;">&emsp;담당 업무</h6>
        </div>
            <button class="button3">삭제</button>
            <button class="button2">상태 변경</button>
            <button class="button1">새 업무</button>
        
            <br><br>
        <table class="todo" width="780" style="text-align: center;" >
            <thead>
                <tr style="background-color: rgba(209, 189, 220, 0.7); border: none; font-size: 14px; ">
                    <th width="50"></th>
                    <th width="100">no</th>
                    <th width="350px">업무</th>
                    <th width="140">상태</th>
                    <th width="140">만료일</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>&emsp;<input type="checkbox"></td>
                    <td>1</td>
                    <td>DB 수정</td>
                    <td>대기</td>
                    <td>22.01.15</td>
                </tr>
                <tr>
                    <td>&emsp;<input type="checkbox"></td>
                    <td>2</td>
                    <td>최종보고서 제출, 발표</td>
                    <td>진행중</td>
                    <td>22.01.13</td>
                </tr>
                <tr>
                    <td>&emsp;<input type="checkbox"></td>
                    <td>3</td>
                    <td>프로젝트 멤버 초대</td>
                    <td>대기</td>
                    <td>22.01.10</td>
                </tr>
            </tbody>
        </table>

        <!-- 소식 뉴스피드 -->
        <div class="menuname">
            <br><br>
            <h6 style="font-weight: bold;">&emsp;소식</h6>
        </div>
        
        <div id="newsfeed">
           <!--게시물 작성-->
           <div id="feedwrite">
                <div class="profile">
                    <br>사진
                </div>
                <input class="write" type="text" name="write" placeholder="&emsp;내용을 입력해주세요">
                <input id="file" type="file">
                <button id="writeok" name="" style="background-color: rgb(187, 159, 202);">등록</button>
            </div>
            
            <br>
            <!-- 게시물 -->
            <c:forEach var="n" items="${ list }">
	            <div class="feedlist">
	                <div class="profile">
	                   <br>사진
	                </div>
	                <div class="projectmem">
	                    <b>${n.empName } &emsp;&emsp;&emsp;</b>
	                    <h style="font-size: 12px; color: dimgray;">${n.nfDate } &emsp; 13:01</h>
	                </div>
	                <div class="feedcontent">
	                    <p>${n.nfContent }</p>
	                </div>
	                <!--댓글-->
	                <div class="reply" style="font-size: 13px;">
	                    <div class="replylist">
	                        <b>오트라</b> &emsp;&emsp;&emsp; 
	                        <span class="replycontents">안녕하세요 !</span>
	                        <span class="date">2022-01-10&emsp;11:48</span>
	                    </div>
	                    <input class="replycontent" type="text" name="reply" placeholder="&emsp;댓글을 입력해주세요">
	                    <button class="replyok" ><b>등록</b></button>
	                </div>
	            </div>
            </c:forEach>
        </div>
    
    </div>
    </div>
    </div>
    </div>
</body>
</html>