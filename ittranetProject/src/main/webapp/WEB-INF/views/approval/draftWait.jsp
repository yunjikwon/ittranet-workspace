<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        #draftTitle{
            font-size: 20px;
            font-weight: 700;
            margin-left: 50px;
            display: inline-block;

        }
        .search{
            display: inline-block;
            font-size:14px;
            vertical-align: middle;
            width: 180px;
            position: relative;
            left:430px;
            top:-10px;
        }
        .divisionSelect{
           width: 100px;
            height: 30px;
            background-color: rgba(19, 33, 142, 0.2);
            border-radius: 4px;
            border: 2px solid lightgray;
            border: 0 none;
            outline: 0 none;
            padding: 0 5px;
            z-index: -3; 
        }
        #innerouter{
            width:90%;
            height:90%;
            background-color: white;
            margin:auto;
            margin-top: 10px;
        }
        #boardList{
            text-align: center;
            margin: auto;
        }
        #boardList>tbody>tr:hover{cursor:pointer;}

        #pagingArea{width:fit-content;margin:auto;}

    </style>
</head>
<body>
<div class="back">
	<div class="innerBack">
		<!-- 헤더 -->
	    <jsp:include page="../common/pageHeader.jsp"/>
	    <!-- 메뉴바 -->
	   	<jsp:include page="../common/userMenu.jsp"/>
	   	
	   	
	   	<br clear="both">
	   	
	   	<div style="position:relative">
		   	<!-- 사이드바 -->
		   	<jsp:include page="approvalSidebar.jsp" />
		   	
		    <div class="mainOuter">
		        <br>
		        <div id="draftTitle">
		           	 기안함 > 대기 결재
		        </div>
		        
		        <form action="" method="post" onsubmit="">
		            <div id="innerouter" style="padding:5% 10%;">
			            <div class="search" id="search1">
				           	 결재분류
				            <select class="divisionSelect" name="" id="">
				                <option value="">(결재분류)</option>
				                <option value="">사업계획서</option>
				                <option value="">시말서</option>
				                <option value="">연장근무신청</option>
				                <option value="">지출결의서</option>
				                <option value="">추가예산신청</option>
				                <option value="">회의록</option>
				            </select>
				        </div>
				        <div class="search" id="search2">
				           	 기안일
				            <select class="divisionSelect" name="" id="">
				                <option value="">(기안일)</option>
				                <option value="">1주일</option>
				                <option value="">1개월</option>
				                <option value="">3개월</option>
				
				            </select>
				        </div>
		            <table id="boardList" class="table table-hover" align="center">		
		            	<c:forEach var="d" items="${ list }">
		                    <tr>
		                    	<td><input type="hidden" name="empNo" value="${ d.empNo }"></td>
		                    	
		                        <th>${ d.drDivision }</th>
		                        <td>${ d.drTitle }</td>
		                        <td>${ d.drDate }</td>
		                        <td>
		                            <img src="" alt=""> <!--프로필 이미지-->
		                           	 ${ d.teamName  }${ d.empName }
		                        </td>
		                        <td>${ d.drStatus }</td>
		                    </tr>
		                </c:forEach>    
		                   
		
		            </table>
		            <br>
		
		            
		            
		        </div>
		        <br><br>
		        		        
		        <div id="pagingArea">
	                <ul class="pagination">
	                	
	                	<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="draftWait.dr?cpage=${ pi.currentPage-1 }">Previous</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                    
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<li class="page-item"><a class="page-link" href="draftWait.dr?cpage=${ p }">${ p }</a></li>
	                    </c:forEach>
	                    
	                    
	                    <c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="draftWait.dr?cpage=${ pi.currentPage+1 }">Next</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                </ul>
            </div>
		       
		        <br clear="both"><br>
		        </form>
		    </div>
	    <!-- 푸터 -->
	    <jsp:include page="../common/footer.jsp"/>
	    
	</div>    
</div>    
</body>
</html>