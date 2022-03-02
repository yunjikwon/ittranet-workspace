<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- alert창 꾸미기 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
    .wrap{
       padding: 30px;
    }
    .menunamepro{
        width: 300px;
        margin-left: 20px;
        margin-top: 20px;
    }
    .menunamepro2{
        width: 300px;
        margin-left: 20px;
        margin-top: 20px;
    }
    .proing{
       border: 1px solid rgb(128, 127, 127);
       border-radius: 3mm;
       width: 200px;
       height: 240px; 
       background-color: rgb(220, 206, 228);
       margin-left: 50px;
       margin-top: 30px;
       float: left;
       
    }
    
    .logo{
      width: 170px;
      height: 145px;
      background-color: white;
      margin: 14px;
      margin-bottom: 10px;
      border-radius: 3mm;  
    }
    .proend{
       border: 1px solid rgb(128, 127, 127);
       border-radius: 3mm;
       width: 200px;
       height: 240px; 
       background-color: rgba(190, 190, 190, 0.86);
       margin-left: 50px;
       margin-top: 30px;
       float: left;
    }
	.logoimg{
		width: 100px;
		height:100px;
		margin: auto;
		margin-top: 20px;
	}
	
	.projectBox{
	}
	.projectBox2{
	}
	
	#checkProject{
        border: 1px solid rgb(202, 202, 202);
        border-radius: 2mm;
        width: 500px;
        height: 400px;
        background-color: rgb(231, 217, 238);
        padding: 15px;
    }
    .projectTable{
        background-color: white;
        border-radius: 2mm;
        width: 495px;
        height: 360px;
    }
    th,td,tr >.projectTable{
        border-bottom: 1px dotted rgb(202, 202, 202);
    }
    
</style>
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			Swal.fire({
				icon: 'success',
				title: 'Success!',
				text: '${ alertMsg }',
			})
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
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
        <h4 style="font-weight:bold;">내 프로젝트</h4>
          <div class="projectBox">
		        <div class="menunamepro">
		            <br>
		            <h6 style="font-weight: bold;">&emsp;진행중 프로젝트</h6>
		        </div>    
	            <!--진행중 프로젝트--> 

	            <c:forEach var="p" items="${ list1 }">
	            <a data-toggle="modal" data-target="#checkProject">
		            <div class="proing" style="text-align: center;">
		            <input method="post" type="hidden" class="prno" name="prNo" value="${ p.prNo }">
		                <div class="logo">
		                    <img class="logoimg" src="${ p.prLogo }"/>
		                </div>
		              		${ p.prTitle }
		                <br>
		                <small>${ p.prStartdate }</small>
		            </div>
		         </a>   
				</c:forEach>
		   </div>
		   
		   <br clear="both">
		   
        <div class="projectBox2">
        <!-- 종료된 프로젝트 -->
            <div class="menunamepro2">
                <br>
                <h6 style="font-weight: bold;">&emsp;종료된 프로젝트</h6>
            </div>
            
            <c:forEach var="e" items="${ list2 }">
	            <div class="proend" style="text-align: center;">
	            <input method="post" type="hidden" class="prno" name="prNo" value="${ e.prNo }">
	      	            <div class="logo">
		                    <img class="logoimg" src="${ e.prLogo }"/>
		                </div>
		              		${ e.prTitle }
		                <br>
		                <small>${ e.prStartdate }</small>
	            </div>
            </c:forEach>
            
            <br><br><br>
          </div>   
          	
          	<!-- 싱글클릭 이벤트 (페이지 이동) 
               <script>
	             $(function(){
	                 $(".proing").click(function(){
	                    location.href = 'feed.pr?prNo=' + $(this).find(".prno").val();
	                  })
	               })
	               
	              $(function(){
	                 $(".proend").click(function(){
	                    location.href = 'feed.pr?prNo=' + $(this).find(".prno").val();
	                  })
	               })
	             </script>       	
          	-->
          	
	          <!-- 더블클릭 이벤트 (프로젝트 상세 내용) -->   
	             <script>
	             $(function(){
	                 $(".proing").dblclick(function(){
	                    console.log("더블클릭하기1");
	                  })
	               })
	             
	              $(function(){
	                 $(".proend").dblclick(function(){
	                	 console.log("더블클릭하기2");
	                  })
	               })
	             </script>
        
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
        <!-- 프로젝트 상세 내용 -->
		<div id="checkProject" class="modal">
		    <div class="checkPr">
		        <table class="projectTable">
		            <tr>
		                <th style="width: 100px;">프로젝트명</th>
		                <td>잇트라넷</td>
		            </tr>
		            <tr>
		                <th>담당자</th>
		                <td></td>
		            </tr>
		            <tr>
		                <th>기간</th>
		                <td></td>
		            </tr>
		            <tr style="height: 200px;">
		                <th>내용</th>
		                <td></td>
		            </tr>
		        </table>
		        <button class="okButton">확인</button>
		    </div>   
		</div>
        </div>
        </div>
        </div>
        </div>  
        </div>
</body>
</html>