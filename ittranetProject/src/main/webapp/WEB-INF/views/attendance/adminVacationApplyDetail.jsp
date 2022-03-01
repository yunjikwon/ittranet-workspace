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
    #app-btn{
        width: 300px;
        float: right;
    }
    #app-btn button{
        float: right;
    }
    .ref{
        border: 2px solid red;
        background: none;
        color: red;
        font-weight: 800;
        border-radius: 5px;
        width: 100px;
        height: 35px;
        margin-left: 29px;
        margin-top:10px;
    }
    .ref:hover{
        background: red;
        color: #ffffff;
    }
    .acc{
        border: 2px solid green;
        background: none;
        color: green;
        font-weight: 800;
        border-radius: 5px;
        width: 100px;
        height: 35px;
        margin-left: 29px;
        margin-top:10px;
    }
    .acc:hover{
        background: green;
        color: #ffffff;
    }
    #vc-tb tr{
        height: 50px;
        text-align: left;
    }
    #vc-tb{
        font-size: 16px;
        color: #000000af;
        width: 750px;
        font-size: 15px;
        font-weight: 400;
        text-align: center;
    }
    #vc-title{
        font-size: 25px;
        font-weight: 800;
        color: #000000cb;
    }
    .sub-title{
        font-size: 21px;
        font-weight: 800;
        color: #000000cb;
        background: linear-gradient(to top, #FFE400 20%, transparent 10%);
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
                <c:choose>
                    <c:when test="${loginUser.empNo eq 1}">
                        <jsp:include page="adminAttendanceSidebar.jsp" />               
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="attendanceSidebar.jsp" />  
                    </c:otherwise>
                </c:choose>
                <div class="mainOuter">
                    <!--제목영역-->
                    <div style="width:100%; height:200px; float:right; padding:40px; font-size: 22px; font-weight: 600;">
                        휴가 신청 내역
                        <br><br>
                        <hr>
                    </div>
                    <!--컨텐츠 영역-->
                    <div class="content-area">
                        
                        <br><br><br><br><br><br>
                        <div class="vc-box" style="padding: 100px;">
                            <!--휴가종류에 따라 제목 달라지게-->
                            <span id="vc-title">${ vc.vcType } 휴가 신청</span>
                            <c:choose>
	                            <c:when test="${ vc.vcStatus eq '대기' and loginUser.empNo eq 1 }">
	                            <div id="app-btn">
	                                <button onclick="vcFormSubmit(1);" class="ref">거절</button>
	                                <button onclick="vcFormSubmit(2);" class="acc">승인</button>
	                            </div>
	                            </c:when>
	                            <c:when test="${ vc.vcStatus eq '대기' and loginUser.empNo eq vc.empNo }">
	                            <div id="app-btn">
	                                <button onclick="vcFormSubmit(3);" class="ref">취소</button>
	                            </div>
	                            </c:when>
                            </c:choose>
                            <form id="vcForm" action="" method="post">
				            	<input type="hidden" name="vcno" value="${ vc.vcApplyNo }">
				            </form>
                            <script>
				            	function vcFormSubmit(num){
				            		if(num == 1){ // 반려
				            			$("#vcForm").attr("action", "vcrefuse.at").submit();
				            		}else if(num == 2){ // 승인
				            			$("#vcForm").attr("action", "vcapproval.at").submit();
				            		}else{
				            			$("#vcForm").attr("action", "vcdelete.at").submit();
				            		}
				            	}
				            </script>
                            <br><br><br>
                            <div>
                                <span class="sub-title">사원 정보</span>
                                <br><br>
                               	<table id="vc-tb" class="table-hover">
                                    <tr>
                                        <th width="300">사원명</th>
                                        <td>${ vc.empName }</td>
                                    </tr>
                                    <tr>
                                        <th>신청일자</th>
                                        <td>${ vc.vcEnrollDate }</td>
                                    </tr>
                                </table>
                                <br><br>
                                <span class="sub-title">휴가 정보</span>
                                <br><br>
                                <table id="vc-tb" class="table-hover">
                                    <tr>
                                        <th width="300">휴가 시작일</th>
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