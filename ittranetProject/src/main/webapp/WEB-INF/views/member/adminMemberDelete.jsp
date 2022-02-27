<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!--FONT-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>   .emplManage {
    	color:black;
    }
    .buttonbar{
        float:right;
        margin-right:10px;
        height:100px;
    }
    table{
        text-align:center;
        width:800px;
    }
    #pagingArea{
    	margin-left:500px;
    }
    #hi{
		font-family: 'Anton', sans-serif;
		font-weight: bold;
		text-shadow: 1px 1px 1px black;
		font-size:60px;
		text-align: center;
		font-weight: bold;
		color: rgb(147, 205, 207);
    }

    #searchbar{
        width:300px;
    }
    .buttonbar{
        float:right;
    }
    table{
        text-align:center;
        width:800px;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<!-- 공용 -->
    <div class="back">
    
    	<!-- 상단: 페이지헤더, 메뉴바 -->
        <div class="innerBack">
			<jsp:include page="../common/pageHeader.jsp" />
 			<jsp:include page="../common/adminMenu.jsp" />

		<!-- 왼쪽 : 사이드바 -->
 		<br clear="both">
 		<div style="position:relative">
			<jsp:include page="../common/sidebar.jsp" />
			<div class="cont">
            <ul id="ac">
                <li class="division">
                    <a href="#">사원관리</a>
                </li>
                <div id="border">
		           <li class="menu1">
	                  <a href="addEmpForm.me">사원 초대</a>
	               </li>
	               <li class="menu1" style="background:rgb(147, 205, 207);">
	                  <a href="delEmpForm.me" style="color:white;">사원 계정 삭제</a>
	               </li>
	               <li class="menu1">
	                  <a href="appEmpForm.me">가입 승인/반려</a>
	               </li>
	               <li class="menu1">
	                  <a href="setEmpForm.me">직무/직위 관리</a>
	               </li>
            	</div>
            </ul>
         	</div>
         	
         	<div class="mainOuter" id="mainOuter" style="font-family: 'Gowun Dodum', sans-serif; background:whitesmoke;">
			  	<br><br>
        	    <p class="anton" style="font-style:italic;" id="hi">Delete Employee</p>
		        <br><br><br>
 
		        <div class="buttonbar">
		            <button type="button" class="btn btn-danger">삭제</button>
		        </div>

		        <br><br><br>
		        <div align="center">
		            <table class="table table-striped table-hover" id="table">
		            	<thead>
			            	<tr>
			                    <th width="50px"><input type="checkbox" id="allCheck"></th>
			                    <th width="100px">이름</th>
			                    <th width="100px">아이디</th>
			                    <th width="250px">번호</th>
			                    <th width="250px">이메일</th>
			                    <th width="150px">부서</th>
			                    <th width="150px">팀</th>
			                    <th width="150px">직급</th>
			                </tr>
		            	</thead>
		                <tbody>
		                	<c:forEach var="e" items="${ list }">
		                		<input type="hidden" value="${ e.empNo }">
				                <tr>
				                    <td><input type="checkbox"></td>
				                    <td>${ e.empName }</td>
				                    <td>${ e.empId }</td>
				                    <td>${ e.phone }</td>
				                    <td>${ e.email }</td>
				                    <td>${ e.deptName }</td>
				                    <td>${ e.teamName }</td>
				                    <td>${ e.jobName }</td>
				                </tr>
			                </c:forEach>
		                </tbody>
		            </table>
				</div>
				<br><br>
				
        	    <div id="pagingArea">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#" style="display:none">◀</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="delEmpForm.me?cpage=${ pi.currentPage-1 }" style="color:rgb(147, 205, 207);">◀</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    <c:choose>
	                    	<c:when test="${ p eq pi.currentPage }">
	                    		<li class="page-item"><a class="page-link" href="delEmpForm.me?cpage=${ p }" style="background:rgb(147, 205, 207); color:white;">${ p }</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="delEmpForm.me?cpage=${ p }" style="color:rgb(147, 205, 207);">${ p }</a></li>
	                    	</c:otherwise>
	                    </c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#" style="display:none">▶</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="delEmpForm.me?cpage=${ pi.currentPage+1 }" style="color:rgb(147, 205, 207);">▶</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                </ul>
            	</div>
			        
        	  </div> <%-- mainOuter --%>         

        </div><%-- innerback --%>

    </div><%-- back --%>
    
    <script>
		$("#allCheck").click(function(){
	        if($(this).is(":checked")){
	            $(":checkbox", $("#table")).prop("checked", true);
	        }else {
	            $(":checkbox", $("#table")).prop("checked", false);
	        }
	    });	
	</script>

</body>
</html>