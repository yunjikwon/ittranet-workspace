<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
    table{
        width: 850px;
        font-size: 15px;
        font-weight: 400;
        text-align: center;
    }
    #app-btn{
        width: 300px;
        float: right;
    }
    #app-btn button{
        width: 100px;
        height: 40px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 900;
        margin-left: 20px;
        float: right;
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
    /*메뉴바 픽스 스타일*/
    .attendance_mn{
    	color: #000000;
    }
</style>
<body>
    <div class="back">
        <div class="innerBack">
            <!-- 헤더, 메뉴바 -->
            <jsp:include page="../common/pageHeader.jsp" />
            <jsp:include page="../common/userMenu.jsp" />
            
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
                        미처리 휴가
                        <br><br>
                        <div class="vc-box">
                            <!--휴가종류에 따라 제목 달라지게-->
                            ${ vc.vcType } 휴가 신청
                            <c:choose>
	                            <c:when test="${ vc.vcStatus eq '대기' }">
	                            <div id="app-btn">
	                                <button onclick="vcFormSubmit(1);" style="background: #e6a4e0; color: red;">거절</button>
	                                <button onclick="vcFormSubmit(2);" style="background: rgb(119, 194, 135); color: white;">승인</button>
	                            </div>
	                            </c:when>
                            </c:choose>
                            <form id="vcForm" action="" method="post">
				            	<input type="hidden" name="vcno" value="${ vc.vcApplyNo }">
				            </form>
                            <script>
				            	function vcFormSubmit(num){
				            		if(num == 1){ // 거절
				            			$("#vcForm").attr("action", "vcrefuse.at").submit();
				            		}else{ // 승인
				            			$("#vcForm").attr("action", "vcapproval.at").submit();
				            		}
				            	}
				            </script>
                            <br><br><br>
                            <div>
                               	<table border="1">
                                    <tr>
                                        <th width="300">사원명</th>
                                        <td>${ vc.empName }</td>
                                    </tr>
                                    <tr>
                                        <th>신청일자</th>
                                        <td>${ vc.vcEnrollDate }</td>
                                    </tr>
                                    <tr>
                                        <th>휴가 시작일</th>
                                        <td>${ vc.vcStartDate }</td>
                                    </tr>
                                    <tr>
                                        <th>휴가 종료일</th>
                                        <td>${ vc.vcEndDate }</td>
                                    </tr>
                              		<c:choose>
	                                    <c:when test="${ vc.vcTime eq '오전' }">
	                                    <tr>
	                                        <th>휴가 시간</th>
	                                        <td>09:00~13:00</td>
	                                    </tr>
	                                    </c:when>
	                                    <c:when test="${ vc.vcTime eq '오전' }">
	                                    <tr>
	                                        <th>휴가 시간</th>
	                                        <td>14:00~18:00</td>
	                                    </tr>
	                                    </c:when>
	                                    <c:otherwise>
	                                    <tr>
	                                    	<th>휴가 시간</th>
	                                        <td>09:00~18:00</td>
	                                    </tr>
	                                    </c:otherwise>
                               		</c:choose>
                                    <tr>
                                        <th>비고</th>
                                        <td>
	                                         <c:choose>
						                    	<c:when test="${ empty vc.vcContent}">
						                    	내용이 없습니다.
						                    	</c:when>
						                    	<c:otherwise>
						                        	${ vc.vcContent }
						                        </c:otherwise>
					                        </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>증명서 제출</th>
                                        <td>
                                        <c:choose>
					                    	<c:when test="${ empty vc.originName}">
					                    	첨부파일이 없습니다.
					                    	</c:when>
					                    	<c:otherwise>
					                        	<a href="${ vc.changeName }" download="${ vc.originName }">${ vc.originName }</a>
					                        </c:otherwise>
				                        </c:choose>
                                        </td>
                                    </tr>
                               	</table>
                            </div>                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>