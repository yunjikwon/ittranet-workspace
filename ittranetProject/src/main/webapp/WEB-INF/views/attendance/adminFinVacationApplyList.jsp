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
    table{
        font-size: 15px;
        font-weight: 400;
        text-align: center;
    }
    .vc-select{
        height: 30px;
        border: 1px solid lightgray;
        border-radius: 5px;
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
                        휴가 신청 내역
                        <br><br>
                        <hr>
                    </div>
                    <!--컨텐츠 영역-->
                    <div class="content-area">
                        처리완료 휴가
                        <br><br>
                        <div class="vc-box">
                            
                            <br><br><br>
                            <table id="finVcList" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th width="110">No</th>
                                        <th width="150">이름</th>
                                        <th width="150">소속</th>
                                        <th width="150">휴가구분</th>
                                        <th width="350">기간</td>
                                        <th width="150">상태</td>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="vc" items="${ list }">
	                                    <tr>
	                                    <td class="vcno">${ vc.vcApplyNo }</td>
	                                    <td>${ vc.empName }</td>
	                                    <td>${ vc.teamName }</td>
	                                    <td>${ vc.vcType }</td>
	                                    <td>${ vc.vcStartDate } ~ ${ vc.vcEndDate }</td>
	                                    <td>${ vc.vcStatus }</td>                        
	                                    </tr>
                                    </c:forEach>
                                </tbody>  
                            </table>
                            <script>
	                            $(function(){
	                        		$("#finVcList>tbody>tr").click(function(){
	                        			location.href='vcdetail.at?vcno=' + $(this).children(".vcno").text();
	                        		})
	                        	})
							</script>
                            <br>
                            <!--페이징바-->
                            <div id="paging-area">
                                <ul>
				                	<c:choose>
				                		<c:when test="${ pi.currentPage eq 1}">
				                    		<li class="page1"><a href="#">&lt;</a></li>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<li class="page1"><a href="fvclist.ad?cpage=${ pi.currentPage - 1 }">&lt;</a></li>
				                    	</c:otherwise>
				                	</c:choose>
				                	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				                    	<li class="page1"><a href="fvclist.ad?cpage=${ p }">${ p }</a></li>
				                    </c:forEach>
				                    
				                    <c:choose>
				                		<c:when test="${ pi.currentPage eq pi.maxPage}">
				                    		<li class="page1"><a href="#">&gt;</a></li>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<li class="page1"><a href="fvclist.ad?cpage=${ pi.currentPage + 1 }">&gt;</a></li>
				                    	</c:otherwise>
				                	</c:choose>
			                	</ul>
                            </div>
                            <br>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>