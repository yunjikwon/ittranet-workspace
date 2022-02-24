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
		            <div class="proing" style="text-align: center;">
		                <div class="logo">
		                    <img class="logoimg" src="${ p.prLogo }"/>
		                </div>
		              		${ p.prTitle }
		                <br>
		                <small>${ p.prSize }&emsp;&emsp;&emsp;${ p.prStartdate }</small>
		            </div>
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
	      	            <div class="logo">
		                    <img class="logoimg" src="${ e.prLogo }"/>
		                </div>
		              		${ e.prTitle }
		                <br>
		                <small>${ e.prSize }&emsp;&emsp;&emsp;${ e.prStartdate }</small>
	            </div>
            </c:forEach>
          </div>   
        
        </div>
        </div>
        </div>
        </div>  
        </div>
</body>
</html>