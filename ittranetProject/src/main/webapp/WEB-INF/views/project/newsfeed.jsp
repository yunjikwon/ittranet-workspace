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
    
   #list{
       width: 1000px;
       height: 200px;
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
   .logoimg{
   	   width: 60px;
   	   height: 60px;
	   margin: 20px;
	   margin-top: 7px;
   }

   #newsfeed{
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
   .userProfile{
       display:inline-block;
       width: 70px;
       height: 70px;
       background-color: white;
       border-radius: 50%;
       margin: 10px;
   }
   .projectmem{
       display:inline-block;
       width: 500px;
       height: 30px;
       margin-left: 10px;
   }
   .feedcontent{
       width: 680px;
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
		                  <a href="list.pr">내 프로젝트</a>
		               </li>
		               <li class="menu1">
		                  <a href="newpro.pr">프로젝트 만들기</a>
		               </li>
		               <li class="menu1">
		                  <a href="todo.pr">내 업무</a>
		               </li>
		               <li class="menu1">
		                  <a href="news.pr">뉴스피드</a>
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
                    <img class="logoimg" src="resources/images/projectlogo/bookmark.png"  />
                </div>
                <p class="projectname" style="font-size: 13px; text-align: center;">북마크</p>   
            </div>
            
            <!-- 진행중인 프로젝트 목록 -->
            <c:forEach var="p" items="${ list2 }">
            	
		            <div class="projectboxes">
		                <div class="projectlogo">
		                	 <input method="post" type="hidden" class="prno" name="prNo" value="${ p.prNo }">
		                     <img class="logoimg" src="${ p.prLogo }"  />
		                </div>
		                <p class="projectname" style="font-size: 13px; text-align: center;">${ p.prTitle }</p>   
		            </div>
		            

            </c:forEach>
            	
            	<!-- 프로젝트 클릭시 프로젝트 뉴스피드로 이동 -->
            	<script>
	             $(function(){
	                 $(".projectboxes").click(function(){
	                    location.href = 'feed.pr?prNo=' + $(this).find(".prno").val();
	                  })
	               })
	             </script>
         

              
	       <!--  
	       	      	  function prNewsfeed(prNo){
	        	  let f = document.createElement('form');
	        	    
	        	  let obj;
	        	  obj = document.createElement('input');
	        	  obj.setAttribute('type', 'hidden');
	        	  obj.setAttribute('name', 'prNo');
	        	  obj.setAttribute('value', prNo);
	        	    
	        	  f.appendChild(obj);
	        	  f.setAttribute('method', 'post');
	        	  f.setAttribute('action', 'feed.pr');
	        	  document.body.appendChild(f);
	        	  f.submit();
	        }
	       -->

	    
	      
        
                       
        </div>
        
     	<br clear="both">
    
        <br>
        <!--뉴스피드 리스트-->
        
        <c:forEach var="n" items="${ list1 }">
        <div id="newsfeed">
            <div class="feedlist">
                   <br>
                   <!-- 사용자 프로필 사진 조건 -->
                   <c:choose>
                      <c:when test="${ loginUser.profile eq 'NULL'}">
                         <img class="userProfile" src="resources/images/userprofile.png">
                      </c:when>
                      <c:otherwise>
                         <img class="userProfile" src="${ loginUser.profile }">
                      </c:otherwise>
                   </c:choose>
                   
				<!-- 게시물 작성 -->
                <div class="projectmem">
                    <b>${ n.prTitle } &emsp; > &emsp;${ n.empName } &emsp;&emsp;&emsp;</b>
                    <h style="font-size: 12px; color: dimgray;">${ n.nfDate } &emsp; 13:01</h>
                </div>
                <div class="feedcontent">
                    <p>${ n.nfContent }</p>
                </div>
                
            
                <!--댓글-->
                <div class="reply">
                    <input class="replycontent" type="text" name="reply" placeholder="&emsp;댓글을 입력해주세요">
                    <button class="replyok" style="font-size: 13px; color: white;"><b>등록</b></button>
                </div>
            </div>
        </div>
        </c:forEach>
    
    
        
        </div>
        </div>
        </div>
    </div>
    
    
      <script>


        
 

      </script>
</body>
</html>