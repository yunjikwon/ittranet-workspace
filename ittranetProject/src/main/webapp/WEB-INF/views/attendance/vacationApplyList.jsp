<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
    .content-area{
        width: 1000px; 
        padding:0 10px; 
        margin-left: 45px; 
        font-size: 18px; 
        font-weight: 600;
    }
    .vc-box img{
        width: 50px;
        height: 50px;
    }
    table{
        font-size: 15px;
        font-weight: 400;
        text-align: center;
    }
    /*모달창 스타일*/
    #modal.modal-overlay {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background: rgba(0, 0, 0, 0.342);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(1.5px);
        -webkit-backdrop-filter: blur(1.5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
    }
    #modal .modal-window {
        background: white;
        box-shadow: 0 8px 32px 0 rgba(124, 6, 202, 0.199);
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 700px;
        position: relative;
        padding: 30px;
    }
    #modal .title {
        padding-left: 10px;
        display: inline;
        color: rgb(73, 73, 73);    
    }
    #modal .title h2 {
        display: inline;
    }
    #modal .mbtn-area {
        display: inline;
        float: right;
        cursor: pointer;
        color: rgb(73, 73, 73);
    }
    .close-btn{
        float: left;
        border: none;
        background: lightgray;
        font-weight: 800;
        border-radius: 5px;
        width: 100px;
        height: 35px;
        margin-left: 29px;
        margin-top:10px;
    }
    
    #modal .content {
        margin-top: 20px;
        padding: 0px 10px;
        color: rgb(73, 73, 73);
    }

    .input-area{
        float: left;
        width: 50%;
        height: 60px;
        font-size: 17px;
    }
    .output-area{
        float: left;
        width: 100%;
        background: lightgray;
        border-radius: 10px;
        margin-top: 50px;
    }
    #warning{
        float: left;
        width: 100%;
        height: 50px;
        color: red;
        margin-top: 20px;
        margin-left: 15px;
        display: none;
    }
    /*휴가신청폼*/
    #vc-tb{
        width: 630px;
        text-align: left;
        margin-left: 20px;
    }
    #vc-tb th{
        width: 90px;
        height: 60px;
    }
    #vc-content{
        background: lightgray;
        border-radius: 10px;
        border: none;
        width: 480px;
        padding: 10px;
    }
    .sub-btn{
        border:2px solid rgb(19, 187, 19);
        color: rgb(19, 187, 19);
        background: #ffffff;
        font-weight: 800;
        border-radius: 5px;
        width: 100px;
        height: 35px;
        margin-left: 29px;
        margin-top:10px;
    }
    .sub-btn:hover{
        color: #ffffff;
        background: rgb(19, 187, 19);;
    }
    .vc-sts{
        height: 30px;
        width: 50px;
        border: none;
        border-radius: 5px;
        background: lightgray;
        color: #000000;
        font-weight: 700;
    }

    /*휴가신청 버튼 스타일*/
    select::-ms-expand { 
	    display: none;
    }
    .att-btn{
        float:right;
        appearance: none;
        width: 90px;
        height: 40px;
        font-size: 15px;
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
            <jsp:include page="../common/userMenu.jsp" />
            
            <br clear="both">
            <div style="position:relative">
                <jsp:include page="attendanceSidebar.jsp" />
                                    
                <div class="mainOuter">

                    <!--제목영역-->
                    <div style="width:100%; height:200px; float:right; padding:40px; font-size: 22px; font-weight: 600;">
                        휴가 신청

                        <!--휴가신청버튼-->
                        <button id="modal_open_btn" class="att-btn" onclick="openPop();">휴가신청</button>
                      
                        <br><br>
                        <hr>
                    </div>                   
                    <!--컨텐츠 영역-->
                    <div class="content-area">
                        예정 휴가
                        <br><br>
                        <c:if test="${ not empty ulist }">
	                        <div class="vc-box">
	                            <table id="upVacationList" class="table table-hover">
	                                <thead>
	                                    <tr>
	                                        <td width="10"></td>
	                                        <th width="380" style="text-align:left;">기간</th>
	                                        <th width="200">휴가구분</th>
	                                        <th width="200">휴가 시간</th>
	                                        <th width="200">상태</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach var="vc" items="${ ulist }">
		                                    <tr>
		                                        <td class="vcno" style="color: white;">${ vc.vcApplyNo }</td>
	                                            <td style="text-align:left;">${ vc.vcStartDate } ~ ${ vc.vcEndDate }</td>
		                                        <td>${ vc.vcType }</td>
		                                        <c:choose>
				                                    <c:when test="${ vc.vcTime eq '오전' }">
				                                        <td>09:00~13:00</td>
				                                    </c:when>
				                                    <c:when test="${ vc.vcTime eq '오전' }">
				                                        <td>14:00~18:00</td>
				                                    </c:when>
				                                    <c:otherwise>
				                                        <td>09:00~18:00</td>
				                                    </c:otherwise>
			                               		</c:choose>
                                                <c:choose>
                                                    <c:when test="${ vc.vcStatus eq '대기' }">
		                                                <td><button class="vc-sts" disabled>대기</button></td>
                                                    </c:when>
                                                    <c:when test="${ vc.vcStatus eq '승인' }">
                                                        <td><button class="vc-sts" style="background: rgba(7, 194, 7, 0.363); color: rgb(4, 112, 4);" disabled>승인</button></td>
                                                    </c:when>
                                                    <c:when test="${ vc.vcStatus eq '반려' }">
                                                        <td><button class="vc-sts" style="background: rgba(255, 192, 203, 0.548); color: red;" disabled>반려</button></td>
                                                    </c:when>
                                                </c:choose>
		                                    </tr>
		                                </c:forEach>
	                                </tbody>
	                            </table>
	                        </div>
                        </c:if>
                        <script>
                        	$(function(){
                        		$("#upVacationList>tbody>tr").click(function(){
                        			location.href='vcdetail.at?vcno=' + $(this).children(".vcno").text();
                        		})
                        	})
                        </script>
                        
                        <br><br>
                        <!--신청내역 없을 경우--> 
                        <c:if test="${ empty ulist }">     
	                        <div class="vc-box" align="center">
	                            <!--휴가 이미지 넣기-->
	                            <img src="resources/images/attendance/vac_icon.png"><br><br>
	                            휴가 신청 내역이 없습니다.               
	                        </div>
                        </c:if>
                        <br><br>
        
                        지난 휴가
                        <br><br>
                        <c:if test="${ not empty llist }">  
	                        <div class="vc-box">
	                            <table id="lastVacationList" class="table table-hover">
	                                <thead>
	                                    <tr>
	                                        <td width="10"></td>
	                                        <th width="380" style="text-align:left;">기간</th>
	                                        <th width="200">휴가구분</th>
	                                        <th width="200">휴가 시간</th>
	                                        <th width="200">상태</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach var="vc" items="${ llist }">
		                                    <tr>
		                                        <td class="vcno" style="color: white;">${ vc.vcApplyNo }</td>
	                                            <td style="text-align:left;">${ vc.vcStartDate } ~ ${ vc.vcEndDate }</td>
		                                        <td>${ vc.vcType }</td>
		                                        <c:choose>
				                                    <c:when test="${ vc.vcTime eq '오전' }">
				                                        <td>09:00~13:00</td>
				                                    </c:when>
				                                    <c:when test="${ vc.vcTime eq '오전' }">
				                                        <td>14:00~18:00</td>
				                                    </c:when>
				                                    <c:otherwise>
				                                        <td>09:00~18:00</td>
				                                    </c:otherwise>
			                               		</c:choose>
		                                        <c:choose>
				                                    <c:when test="${ vc.vcStatus eq '승인' }">
				                                        <td><button class="vc-sts" style="background: rgba(7, 194, 7, 0.363); color: rgb(4, 112, 4);" disabled>승인</button></td>
				                                    </c:when>
				                                    <c:when test="${ vc.vcStatus eq '반려' }">
				                                        <td><button class="vc-sts" style="background: rgba(255, 192, 203, 0.548); color: red;" disabled>반려</button></td>
				                                    </c:when>
			                               		</c:choose>
		                                    </tr>
		                                </c:forEach>
	                                </tbody>
	                            </table>
	                        </div>
                        </c:if>
                        <script>
                        	$(function(){
                        		$("#lastVacationList>tbody>tr").click(function(){
                        			location.href='vcdetail.at?vcno=' + $(this).children(".vcno").text();
                        		})
                        	})
                        </script>
                        <br><br>
                        <!--신청내역 없을 경우-->
                        <c:if test="${ empty llist }">
	                        <div class="vc-box" align="center">
	                            <!--휴가 이미지 넣기-->
	                            <img src="resources/images/attendance/vac_icon.png"><br><br>
	                            휴가 신청 내역이 없습니다.                 
	                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
            
            <!--휴가신청 모달-->
            <div id="modal" class="modal-overlay">
                <div class="modal-window">
                    <div class="title">
                        <!--선택한 휴가 종류에 따라 달라지게-->
                        <h2><b>휴가 신청</b></h2>
                    </div>
                       <!--잔여휴가 0개일 시 보여질 문구-->
                       <div id="warning"><b>⊘ 사용가능한 휴가가 없습니다.</b></div>
                       <form action="vcinsert.at" method="post" enctype="multipart/form-data">
                           <div id="att-search">
                                <input type="hidden" value="${ loginUser.empNo }" name="empNo">
                                <br><br>
                                    <table id="vc-tb">
                                        <tr>
                                            <th><label for="vc-type">휴가종류</label></th>
                                            <td>
                                            <c:choose>
                                                <c:when test="${ not empty rest }">
                                                <select id="vc-type" name="vcType" class="select" required>    
                                                        <option value="연차" id="${ rest.restYear }">
                                                            연차 
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            ${ rest.restYear }
                                                        </option>
                                                        <option value="생리" id="${ rest.restMonth }">
                                                            생리 
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            ${ rest.restMonth }
                                                        </option>
                                                        <option value="병가" id="${ rest.restSick }">
                                                            병가 
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            ${ rest.restSick }
                                                        </option>
                                                </select>
                                                </c:when>
                                                <c:otherwise>
                                                <select id="vc-type" name="vcType" class="select" required>    
                                                        <option value="연차">
                                                            연차
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                             15</option>
                                                        <option value="생리">
                                                            생리 
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            1</option>
                                                        <option value="병가">
                                                            병가 
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            10</option>
                                                </select>
                                                </c:otherwise>
                                            </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="start-date">시작일</label></th>
                                            <td><input type="date" id="start-date" name="vcStartDate" required></td>
                                            <th><label for="end-date">종료일</label></th>
                                            <td><input type="date" id="end-date" name="vcEndDate" required></td>
                                        </tr>
                                        <tr>
                                            <th><label for="vc-time">시간</label></th>
                                            <td colspan="3">
                                                <select name="vcTime" id="vc-time" required>
                                                    <!--오전, 오후 옵션은 연차 신청 시에만 보여지게-->
                                                    <option value="종일">종일</option>
                                                    <option value="오전" class="half">오전</option>
                                                    <option value="오후" class="half">오후</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="upfile">증명서제출</label></th>
                                            <td colspan="3"><input type="file" name="upfile" id="upfile" style="width: 400px;"></td>
                                        </tr>
                                        <tr>
                                            <th><label for="vc-content">비고</label></th>
                                            <td colspan="3"><textarea name="vcContent" id="vc-content" rows="5" cols="60" style="resize:none; margin-top: 35px;"></textarea></td>
                                        </tr>
                                    </table>
                                    <br><br>
                                    <div class="mbtn-area">
                                        <button type="button" onclick="closePop();" class="close-btn">닫기</button>
                                        <button type="submit" id="vcsubmit" class="sub-btn">✓ 신청</button>
                                    </div>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
                <!--모달 스크립트-->

	            <script type="text/javascript">
                    closePop();

	                //팝업 show 기능
	                function openPop() {
	                     $('#modal').show();
	                };
	                //팝업 Close 기능
	                function closePop() {
	                     $('#modal').hide();
	                };
	                
	                $(document).ready(function() {
                	  $('#vc-type').change(function() {
                	    var result = $('#vc-type option:selected').attr('id');
                	    if (result == 0) {
                	      $('#warning').show();
                	      $('#vcsubmit').attr("disabled","disabled");
                	    } else {
                	      $('#warning').hide();
                	      $('#vcsubmit').removeAttr("disabled");
                	    }
                	  });
                	  $('#vc-type').change(function() {
                  	    var result = $('#vc-type option:selected').val();
                  	    if (result != '연차') {
                  	      $('.half').hide();
                  	    } else {
                  	      $('.half').show();
                  	    }
                  	  });
                	}); 
	            </script>
	            <!--모달 스크립트 끝-->
	            </div>
	            <!--모달 끝-->

        </div>
            
    </div>

</body>
</html>