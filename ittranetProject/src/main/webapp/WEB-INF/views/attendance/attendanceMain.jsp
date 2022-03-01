<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*컨텐츠 영역 스타일*/
    .contentbox{
        background: white;
        border-radius: 20px;
        float: left;
        margin-top: 30px;
        margin-left: 55px;
		margin-bottom: 50px;
		width: 290px;
		box-shadow: 0 8px 20px 0 rgba(124, 6, 202, 0.096);
    }
    .category-title{
        height: 40px;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
        background-color: #ffffff;
        font-size: 17px;
        font-weight: 600;
        line-height: 40px;
        color: rgb(61, 58, 58);
		padding: 10px;
    }
    .plus-btn{
        color: rgb(53, 50, 50);
        text-decoration: none;
        float: right;
        font-size: 22px;
        margin-right: 15px;
		font-size: 1px;
    }
	.plus{
		border: none;
		border-radius: 75px;
		width: 4px;
		height: 4px;
		background: rgba(128, 128, 128, 0.623);
		float: left;
		margin-right: 4px;
		margin-top: 17px;
	}
    
	/*출퇴근체크*/
	.commute-btn{
		border: none;
		background: none;
        float: left;
        margin-top: 30px;
        height: 120px;
        width: 145px;
        font-size: 14px;
    }
	.commute-btn i{
		font-size: 40px;
	}
	.out-btn{
		border: 2px solid lightgray;
		background: #ffffff;
		border-radius: 5px;
		width: 100px;
		height: 35px;
		margin-left: 29px;
		margin-top: 35px;
		color: lightgray;
		font-weight: 800;
	}
	/*근무현황*/
	.att-circle{
		background: rgb(224, 224, 224); 
		border-radius: 75px; 
		width: 10px; 
		height: 10px;
		margin: auto;
		margin-top: 10px;
	}
	.td1{
		width: 70px;
	}
	.td2{
		width:300px;
	}
	#att-status td{
		height: 50px;
	}
	.c2{
		background: rgba(19, 33, 142, 0.274);
	}
	.c3{
		background: rgba(19, 33, 142, 0.521);
	}
	.c4{
		background: rgba(19, 33, 142, 0.753);
	}
	
	#att-status{
		margin-left: 20px;
	}
	.att-result{
		color: gray;
		font-weight: 500;
	}

	/*시계 스타일*/
	#today{
		text-align: center;
	}
	#nowMonth{
		font-size: 30px;
		margin-top: 25px;
		color: gray;
	}
	#nowDay{
		font-size: 70px;
		margin-top: -135px;
		color: #000000b6;
	}
	#nowYear{
		font-size: 30px;
		margin-top: -70px;
		color: gray;
	}
	#clock{
		font-size: 30px; 
		text-align: center;
		margin-top: 20px;
		color: #000000cb
	}
	.status-box div{
		width: 88px;
		border-left: solid 1px lightgray;
		float: left;
		height: 100px;
		text-align: center;
		padding-top: 20px;
		margin-top: 20px;
	}
	.status-box{
		padding-left: 15px;
		padding-top: 30px;
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
					내 근무
					<br><br>
					<hr>
				</div>

				<!--컨텐츠 영역-->
				<div class="content-area" style="width: 100%; float:right;">
					<div class="contentbox" style="height: 300px;">
						<div class="category-title">
							&nbsp;&nbsp; 
							<i class="far fa-clock fa-1x"></i>&nbsp;
							TODAY
							<a href="" class="plus-btn">
								<div class="plus"></div>
								<div class="plus"></div>
								<div class="plus"></div>
							</a>
						</div>
						
						<div id="today">
							<div id="nowMonth"></div>
							<div id="nowDay"></div>
							<div id="nowYear"></div>
						</div>

						<div id="clock">
							<!--현재시간-->
							<i class="far fa-clock fa-1x"></i>
							<span id="nowTimes"></span>
						</div>
					</div>

					<div class="contentbox" style="height: 300px;">
						<div class="category-title">
							&nbsp;&nbsp; 
							<i class="far fa-clock fa-1x"></i>&nbsp;
							출/퇴근 체크
							<a href="" class="plus-btn">
								<div class="plus"></div>
								<div class="plus"></div>
								<div class="plus"></div>
							</a>
						</div>

							<!-- 이미 출/퇴근 버튼 클릭했을 시 다시 클릭되지 않도록 -->
							<button id="arr-btn" class="commute-btn" onclick="insertArrive();" style="border-right: 2px solid lightgray;"align="center">
								<i class="far fa-arrow-alt-circle-right fa-rotate-90" style="color: rgb(131, 26, 163);"></i>
								<br><br>
								<p>
									출근하기 <br>
								</p>   
							</button>
						
							<button id="lev-btn" class="commute-btn" onclick="updateLeave();" align="center" disabled>
								<i class="far fa-arrow-alt-circle-right" style="color: lightgray;"></i>
								<br><br>
								<p>
									퇴근하기 <br>
								</p>   
							</button>

							<button class="out-btn" onclick="updateStepout();" disabled>외출</button> 
							<button class="out-btn" onclick="updateOutwork();" disabled>외근</button>
					</div>
					
					
					
					<div class="contentbox" style="height: 300px;">
						<div class="category-title">
							&nbsp;&nbsp; 
							<i class="far fa-clock fa-1x"></i>&nbsp;
							출퇴근 기록
							<a href="" class="plus-btn">
								<div class="plus"></div>
								<div class="plus"></div>
								<div class="plus"></div>
							</a>
						</div>
						<br>
						<table id="att-status">
							<tbody>

							</tbody>
						</table>
						
					</div>
					

					<script>
						$(function(){
							selectAttStatus();
							setInterval(selectAttStatus, 1000);
							
					        clock();
					        setInterval(clock, 500);
						})
						
						function insertArrive(){ // 출근기록용
							$.ajax({
								url: "arrive.at",
								data:{
									empNo: '${loginUser.empNo}'
								}, success:function(arstatus){
									if(arstatus == "success"){
										console.log("출근 통신 성공")
									}
								}, error:function(){
									console.log("출근 통신 실패")
								}
							})
						}
						
						function updateLeave(){ // 퇴근기록용
							$.ajax({
								url: "leave.at",
								data:{
									empNo: '${loginUser.empNo}'
								}, success:function(arstatus){
									if(arstatus == "success"){
										console.log("퇴근 통신 성공")
									}
								}, error:function(){
									console.log("퇴근 통신 실패")
								}
							})
						}
						
						function updateStepout(){ // 외출기록용
							$.ajax({
								url: "stepout.at",
								data:{
									empNo: '${loginUser.empNo}'
								}, success:function(arstatus){
									if(arstatus == "success"){
										console.log("외출 통신 성공")
									}
								}, error:function(){
									console.log("외출 통신 실패")
								}
							})
						}
						
						function updateOutwork(){ // 외근기록용
							$.ajax({
								url: "outwork.at",
								data:{
									empNo: '${loginUser.empNo}'
								}, success:function(arstatus){
									if(arstatus == "success"){
										console.log("외근 통신 성공")
									}
								}, error:function(){
									console.log("외근 통신 실패")
								}
							})
						}
						
						function selectAttStatus(){ // 출퇴근기록 조회용
							$.ajax({
								url:"list.at",
								type: "post",
								data:{
									empNo: '${loginUser.empNo}'
								}, success: function(at){
									let value = "";
									console.log(at);
									if(at.arriveTime != null){
										value	+= "<tr>"
											  		+ "<td class='td1'> <div class='att-circle'></div> </td>"
											  		+ "<td class='td2'>" + at.arriveTime + "&nbsp;&nbsp;출근 </td>" 		
											  	+ "</tr>"
									}if(at.stepoutTime != null){
										value += "<tr>"
											  		+ "<td> <div class='att-circle c2'></div> </td>"
											  		+ "<td>" + at.stepoutTime + "&nbsp;&nbsp;외출 </td>"
											  	+ "</tr>"
									}if(at.outworkTime != null){
										value += "<tr>"
											  		+ "<td> <div class='att-circle c3'></div> </td>"
											  		+ "<td>" + at.outworkTime + "&nbsp;&nbsp;외근 </td>"
											  	+ "</tr>"
									}if(at.leaveTime != null){
										value += "<tr>"
											  		+ "<td> <div class='att-circle c4'></div> </td>"
											  		+ "<td>" + at.leaveTime + "&nbsp;&nbsp;퇴근 </td>"
											  + "</tr>"
									}		  
									$("#att-status tbody").html(value);
								}, error:function(){
									console.log("출퇴근리스트 통신실패");
								}
							})
						}
						
					    function clock() { // 날짜 및 시간 조회
							const nowTime = new Date();
							const hour = nowTime.getHours();
							const min = nowTime.getMinutes();
							const sec = nowTime.getSeconds();
							
							const months = ["Jan", "Feb", "Mar","Apr", "May", "JUN", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
							
							let month = months[nowTime.getMonth()];
							let day = "<br>" + nowTime.getDate();
							let year = "<br>" + nowTime.getFullYear();
							let value = hour + ":" + addzero(min) + ":" + addzero(sec);
							
							$("#nowMonth").html(month);
							$("#nowDay").html(day);
							$("#nowYear").html(year);
							$("#nowTimes").html(value);
						}
					        // 1자리수의 숫자인 경우 앞에 0을 붙이도록
						function addzero(num) {
							if(num < 10) { num = "0" + num; }
					 		return num;
						}

						// 버튼 클릭이벤트    
						$('#arr-btn').click(function() {
	                	    $('#arr-btn').attr("disabled","disabled");
	                	    $('#arr-btn i').css("color","lightgray"); 
	                	    $('#lev-btn').removeAttr("disabled");
	                	    $('#lev-btn i').css("color","rgb(131, 26, 163)");
	                	    $('.out-btn').removeAttr("disabled");
							$('.out-btn').css("color", "rgb(131, 26, 163)");
							$('.out-btn').css("border", "2px solid rgb(131, 26, 163)");
							
                	    })
                	    $('#lev-btn').click(function() {
	                	    $('#lev-btn').attr("disabled","disabled");
	                	    $('#lev-btn i').css("color","lightgray");
                	    	$('.out-btn').attr("disabled","disabled");
	                	    $('#arr-btn').removeAttr("disabled");
	                	    $('#arr-btn i').css("color","rgb(131, 26, 163)");
							$('.out-btn').css("color", "lightgray")
							$('.out-btn').css("border", "2px solid lightgray")
                	    })
					</script>

					<div class="contentbox" style="height: 230px;">
						<div class="category-title">
							&nbsp;&nbsp; 
							<i class="far fa-clock fa-1x"></i>&nbsp;
							근태 현황
							<a href="" class="plus-btn">
								<div class="plus"></div>
								<div class="plus"></div>
								<div class="plus"></div>
							</a>
						</div>
						<div class="status-box">
							<c:choose>
                               	<c:when test="${ not empty result }">
									<div style="border-left:none;">
										<p><b>지각</b></p>
										<span class="att-result">${ result.lateCount }회</span>
									</div>
									<div>
										<p><b>조퇴</b></p>
										<span class="att-result">${ result.earlyCount }회</span>
									</div>
									<div>
										<p><b>결근</b></p>
										<span class="att-result">${ result.absenceCount }회</span>
									</div>
								</c:when>
							</c:choose>
						</div>
					</div>               
					<div class="contentbox" style="height: 230px;">
						<div class="category-title">
							&nbsp;&nbsp; 
							<i class="far fa-clock fa-1x"></i>&nbsp;
							근무 통계
							<a href="" class="plus-btn">
								<div class="plus"></div>
								<div class="plus"></div>
								<div class="plus"></div>
							</a>
						</div>
						<div class="status-box">
							<c:choose>
                               	<c:when test="${ not empty result }">
									<div style="border-left:none;">
										<p><b>근무일수</b></p>
										<span class="att-result">${ result.dayCount }일</span>
									</div>
									<div>
										<p><b>총 근무</b></p>
										<span class="att-result"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${ result.workSum }" />
										시간</span>
									</div>
									<div>
										<p><b>평균근무</b></p>
										<span class="att-result"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${ result.workSum / result.dayCount }" />
										시간</span>
									</div>
								</c:when>
							</c:choose>
						</div>
					</div>
					<div class="contentbox" style="height: 230px;">
						<div class="category-title">
							&nbsp;&nbsp; 
							<i class="far fa-clock fa-1x"></i>&nbsp;
							휴가 현황
							<a href="" class="plus-btn">
								<div class="plus"></div>
								<div class="plus"></div>
								<div class="plus"></div>
							</a>
						</div>
						<div class="status-box">
							<div style="border-left:none; width:105px;">
								<c:choose>
		                            <c:when test="${ not empty vc }">
											<p><b>잔여 연차</b></p>
											<span id="att-result">${ vc.restYear }일</span>
									</c:when>
								</c:choose>
							</div>
							<div>
								<button onclick="location.href='vclist.at'" class="att-btn">휴가 신청</button>
							</div>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</div>
</div>


</body>
</html>