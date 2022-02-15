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
        border: 1px solid red;
        width: 900px;
    }
   #list{
       border: 1px solid orange;
       width: 900px;
       height: 160px;
   }
   .projectbox{
       border:1px solid rgb(190, 190, 190); 
       background-color: rgb(246, 228, 187);
       border-radius: 10%;
       width: 125px;
       height: 130px;
       margin: 15px;
       float: left;
   }
   .projectboxes{
       border:1px solid rgb(190, 190, 190); 
       background-color: rgb(220, 206, 228);
       border-radius: 10%;
       width: 125px;
       height: 130px;
       margin: 15px;
       float: left;
   }
   .projectlogo{
       background-color: white;
       border-radius: 10%;
       width: 100px;
       height: 73px;
       margin: 12px;
   }

   #newsfeed{
       border:1px solid blue;
       padding: 15px;
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
       height: 90px;
       margin-left: 100px;
       margin-top: 15px;
       padding: 15px;
   }
   .replycontent{
       width: 585px;
       height: 60px;
       border-radius: 2mm;
       border: 1px solid rgb(199, 198, 198);
   }
   .replyok{
       background-color: rgb(187, 159, 202);
       border: none; 
       border-radius: 2mm;
       width: 70px;
       height: 35px;
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
		                  <a href="#">내 프로젝트</a>
		               </li>
		               <li class="menu1">
		                  <a href="#">프로젝트 만들기</a>
		               </li>
		               <li class="menu1">
		                  <a href="#">내 업무</a>
		               </li>
		               <li class="menu1">
		                  <a href="#">뉴스피드</a>
		               </li>
            	</div>
            </ul>
         </div>
 

    <div class="mainOuter"> 
    <div class="wrap">  
        <h4 style="font-weight:bold;">뉴스피드</h4>
        
        <!--프로젝트 리스트-->
        <div id="list">
            <div class="projectbox">
                <div class="projectlogo">
                    // 로고
                </div>
                <p class="projectname" style="font-size: 13px; text-align: center;">전체 소식</p>   
            </div>
            <div class="projectbox">
                <div class="projectlogo">
                    // 로고
                </div>
                <p class="projectname" style="font-size: 13px; text-align: center;">북마크</p>   
            </div>
            <div class="projectboxes">
                <div class="projectlogo">
                    // 로고
                </div>
                <p class="projectname" style="font-size: 13px; text-align: center;">IT!tranet</p>   
            </div>
        </div>
    
        <br>
        <!--뉴스피드 리스트-->
        <div id="newsfeed">
            <div class="feedlist">
                <div class="profile">
                   <br>사진
                </div>
                <div class="projectmem">
                    <b>IT!tranet &emsp; > &emsp;이트라 &emsp;&emsp;&emsp;</b>
                    <h style="font-size: 12px; color: dimgray;">2022-01-10 &emsp; 13:01</h>
                </div>
                <div class="feedcontent">
                    <p>새로운 프로젝트 ! 넘 기대돼요 ㅎㅎ 잘 부탁드립니다</p>
                </div>
                <!--댓글-->
                <div class="reply">
                    <input class="replycontent" type="text" name="reply" placeholder="&emsp;댓글을 입력해주세요">
                    <button class="replyok" style="font-size: 13px; color: white;"><b>등록</b></button>
                </div>
            </div>
        </div>
    
        <div id="newsfeed">
            <div class="feedlist">
                <div class="profile">
                   <br>사진
                </div>
                <div class="projectmem">
                    <b>IT!tranet &emsp; > &emsp;이트라 &emsp;&emsp;&emsp;</b>
                    <h style="font-size: 12px; color: dimgray;">2022-01-10 &emsp; 13:01</h>
                </div>
                <div class="feedcontent">
                    <p>새로운 프로젝트 ! 넘 기대돼요 ㅎㅎ 잘 부탁드립니다</p>
                </div>
                <!--댓글-->
                <div class="reply">
                    <input class="replycontent" type="text" name="reply" placeholder="&emsp;댓글을 입력해주세요">
                    <button class="replyok" style="font-size: 13px; color: white;"><b>등록</b></button>
                </div>
            </div>
        </div>
        
        </div>
        </div>
        </div>
    </div>
</body>
</html>