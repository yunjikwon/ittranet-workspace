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
        width: 900px;
    }
    .menuname{
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
       margin: 30px;
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
       margin: 30px;
       float: left;
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
 	
    <div class="mainOuter">  
        <h4 style="font-weight:bold;">내 프로젝트</h4>
        <div class="menuname">
            <br>
            <h6 style="font-weight: bold;">&emsp;진행중 프로젝트</h6>
        </div>    
            <!--진행중 프로젝트--> 
            <div class="proing" style="text-align: center;">
                <div class="logo">
                    로고
                </div>
                IT!tranet
                <br>
                <small>6&emsp;&emsp;&emsp;22-01-10</small>
            </div>
    
            <div class="proing" style="text-align: center;">
                <div class="logo">
                    로고
                </div>
                IT!tranet
                <br>
                <small>6&emsp;&emsp;&emsp;22-01-10</small>
            </div>
            
            <div class="proing" style="text-align: center;">
                <div class="logo">
                    로고
                </div>
                IT!tranet
                <br>
                <small>6&emsp;&emsp;&emsp;22-01-10</small>
            </div>
        
            <div class="menuname">
                <br>
                <h6 style="font-weight: bold;">&emsp;종료된 프로젝트</h6>
            </div>  
        <!-- 종료된 프로젝트 -->
            <div class="proend" style="text-align: center;">
                <div class="logo">
                    로고
                </div>
                IT!tranet
                <br>
                <small>6&emsp;&emsp;&emsp;22-01-10</small>
            </div>
            <div class="proend" style="text-align: center;">
                <div class="logo">
                    로고
                </div>
                IT!tranet
                <br>
                <small>6&emsp;&emsp;&emsp;22-01-10</small>
            </div>
            <div class="proend" style="text-align: center;">
                <div class="logo">
                    로고
                </div>
                IT!tranet
                <br>
                <small>6&emsp;&emsp;&emsp;22-01-10</small>
            </div>
    
        </div>
        </div>
        </div>
</body>
</html>