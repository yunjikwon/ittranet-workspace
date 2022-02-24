<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*근무통계 스타일*/
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
        height: 36px;
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
    .page{
        border: none;
        background: rgba(211, 211, 211, 0.521);
        color: gray;
        font-size: 16px;
        font-weight: 600;
        height: 30px;
        width: 30px;
        border-radius: 9px;
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
                        근무 통계
                        <br><br>
                        <hr>
                    </div>

                    <!--컨텐츠 영역-->
                    <div class="content-area">
                        &lt; YYYY년 &gt;
                        <br><br>
                        <c:if test="${ not empty list }">
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
	                            <table border="1">
	                                <thead>
	                                    <tr>
	                                        <th width="150">이름</th>
	                                        <th width="150">소속</th>
	                                        <th width="150">지각</th>
	                                        <th width="150">조퇴</th>
	                                        <th width="150">결근</th>
	                                        <th width="150">근무일수</th>
	                                        <th width="150">총근무시간</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
		                                <c:forEach var="at" items="${ list }">
		                                    <tr>
			                                    <td>${ at.empNo }</td>
			                                    <td>무슨팀</td>
			                                    <td>${ at.lateCount }</td>
			                                    <td>${ at.earlyCount }</td>
			                                    <td>${ at.absenceCount }</td>
			                                    <td>${ at.dayCount }일</td>
			                                    <td>${ at.workSum }시간</td> 
		                                    </tr>
		                                </c:forEach>
	                                </tbody>                               
	                            </table>
	                            <br><br>
	                            <!--페이징바-->
	                            <div align="center">
	                                <button class="page">&lt;</button>
	                                
	                                <button class="page">&gt;</button>
	                                
	                            </div>
	                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>