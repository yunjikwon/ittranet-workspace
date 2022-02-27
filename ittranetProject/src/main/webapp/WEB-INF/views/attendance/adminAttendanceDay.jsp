<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content-area{
        width: 1000px; 
        padding:0 10px; 
        margin-left: 45px; 
        font-size: 18px; 
        font-weight: 600;
    }
    .vc-box{
        background: white;
        width: 950px;
        border-radius: 25px;
        padding: 50px;
        margin-left: 15px;
        font-size: 17px;
        margin-bottom: 50px;
    }
    #att-search{
        float: right;
        height: 40px;
        width: 230px;
    }
    #att-search input, select{
        height: 36px;
        width: 180px;
        border: 1px solid lightgray;
        border-radius: 5px;
    }
    #att-search button{
        height: 36px;
        width: 36px;
        background: rgb(226, 225, 225);
        color: gray;
        border: 1px solid lightgray;
        border-radius: 5px;
    }
    table{
        font-size: 15px;
        font-weight: 400;
        text-align: center;
    }
    /*페이징바 스타일*/
    #paging-area{
        width:fit-content;
        margin:auto;
        text-align: center;
    }
    #paging-area a{
        text-decoration: none;
        color: gray;
    }
    #paging-area ul li{
        list-style-type: none; 
        float: left;
        margin-left: 10px;
    }
    .page1{
        border: none;
        background: rgba(211, 211, 211, 0.479);
        color: gray;
        font-size: 16px;
        font-weight: 600;
        height: 30px;
        width: 30px;
        border-radius: 9px;
    }
    .page1:hover{
        background: rgba(194, 193, 193, 0.87);
    }
        
    /*메뉴바 픽스 스타일*/
    .attendance_mn{
    	color: #000000;
    }
</style>
</head>
<body>
    <div class="back">
        <div class="innerBack">
            <!-- 헤더, 메뉴바 -->
            <jsp:include page="../common/pageHeader.jsp" />
            <jsp:include page="../common/adminMenu.jsp" />
            
            <br clear="both">
            <div style="position:relative">
                <jsp:include page="adminAttendanceSidebar.jsp" />
              
                <div class="mainOuter">
                    <!--제목영역-->
                    <div style="width:100%; height:200px; float:right; padding:40px; font-size: 22px; font-weight: 600;">
                        일일근태 관리
                        <br><br>
                        <hr>
                    </div>
                    <!--컨텐츠 영역-->
                    <div class="content-area">
                        &lt; YYYY년 MM년 DD일 &gt;
                        <br><br>
                        <div class="vc-box">
	                            <select name="" id="">
	                                <option value="">무슨팀</option>
	                                <option value="">무슨팀</option>
	                            </select>
	
	                            <div id="att-search">
	                                <input type="text" placeholder="이름, 소속 검색">
	                                <button><i class="fas fa-search"></i></button>
	                            </div>
	                            <br><br><br>
                       	 		<c:if test="${ not empty list }">
	                            <table border="1">
	                                <thead>
	                                    <tr>
	                                        <th width="150">근무일자</th>
	                                        <th width="150">이름</th>
	                                        <th width="150">소속</th>
	                                        <th width="150">근태구분</th>
	                                        <td width="150">출근시간</td>
	                                        <td width="150">퇴근시간</td>
	                                        <td width="150">외출시간</td>
	                                        <td width="150">외근시간</td>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach var="at" items="${ list }">
		                                    <tr>
			                                    <td>${ at.attDate }</td>
			                                    <td>${ at.empName }</td>
			                                    <td>${ at.teamName }</td>
			                                    <td>${ at.attStatus }</td>
			                                    <td>${ at.arriveTime }</td>
			                                    <td>${ at.leaveTime }</td>
			                                    <td>${ at.stepoutTime }</td>
			                                    <td>${ at.outworkTime }</td>
		                                    </tr>
	                                    </c:forEach>
	                                </tbody>                                
	                            </table>
	                            <br><br>
	                            <!--페이징바-->
	                            <div id="paging-area">
	                                <ul>
					                	<c:choose>
					                		<c:when test="${ pi.currentPage eq 1}">
					                    		<li class="page1"><a href="#">&lt;</a></li>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<li class="page1"><a href="dayat.ad?cpage=${ pi.currentPage - 1 }">&lt;</a></li>
					                    	</c:otherwise>
					                	</c:choose>
					                	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					                    	<li class="page1"><a href="dayat.ad?cpage=${ p }">${ p }</a></li>
					                    </c:forEach>
					                    
					                    <c:choose>
					                		<c:when test="${ pi.currentPage eq pi.maxPage}">
					                    		<li class="page1"><a href="#">&gt;</a></li>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<li class="page1"><a href="dayat.ad?cpage=${ pi.currentPage + 1 }">&gt;</a></li>
					                    	</c:otherwise>
					                	</c:choose>
				                	</ul>
	                            </div>
	                            <br>
	                     	</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>