<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 다음주소API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!--FONT-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap{
        width: 900px;
    }
    #mainOuter{
        width:1200px;
        height:500px;
    
    }
    .checkPwdForm {
    	
    }
</style>
</head>
<body>

	<div class="back">
	
		<div class="innerBack">
		
			<jsp:include page="../common/pageHeader.jsp" />
			
			<c:choose>
				<c:when test="${ loginUser.empNo eq '1' }">
					<jsp:include page="../common/adminMenu.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:include page="../common/userMenu.jsp" />
				</c:otherwise>
			</c:choose>
			
			<br clear="both">
 			<div style="position:relative">
				<jsp:include page="../common/sidebar.jsp" />
				<div class="cont">
		            <ul id="ac">
		            
		                <li class="division">
		                    <a href="#">마이페이지</a>
		                </li>
		                <div id="border">
			               <li class="menu1">
			                  <a href="myPage.me">내 정보</a>
			               </li>
			               <li class="menu1" style="background:rgb(147, 205, 207);">
			                  <a href="setPwdForm.me" style="color:white;">비밀번호 변경</a>
			               </li>
				        </div>
				        
				     </ul>
			     </div> <%-- cont --%>
			  </div> <%-- relative --%>
			  
			  <div class="mainOuter" id="mainOuter" style="font-family: 'Gowun Dodum', sans-serif;">
			  	<div class="checkPwdForm">
			  		이제 여기다가 무언가를 써야 하는뎁쇼...    
			  	</div>
			
        	  </div> <%-- mainOuter --%>
			
		</div> <%-- innerBack --%>
	
	</div> <%-- back --%>
	
	<script>


	   	
	</script>

</body>
</html>