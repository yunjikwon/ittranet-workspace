<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        margin-left: 40px;
		margin-bottom: 50px;
		width: 310px;
    }
    .category-title{
        height: 40px;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
        background-color: rgba(196, 158, 212, 0.8);
        font-size: 17px;
        font-weight: 600;
        line-height: 40px;
        color: rgb(61, 58, 58);
    }
    .plus-btn{
        color: rgb(53, 50, 50);
        text-decoration: none;
        float: right;
        font-size: 22px;
        margin-right: 15px;
    }
	/*출퇴근체크*/
	.commute-btn{
		border: none;
		background: none;
        float: left;
        margin-top: 30px;
        height: 120px;
        width: 154px;
        font-size: 14px;
    }
	.commute-btn i{
		font-size: 40px;
	}
	.out-btn{
		border: none;
		background: rgba(203, 173, 214, 0.63);
		border-radius: 5px;
		width: 100px;
		height: 35px;
		margin-left: 35px;
		margin-top: 35px;
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
	/*
	#att-status{
		
	}
	#att-status li::marker{
		color:rgba(196, 158, 212, 0.8);
	}
	*/

	/*시계 스타일*/
	#today{
		text-align: center;
	}
	#nowMonth{
		font-size: 30px;
		margin-top: 20px;
		color: gray;
	}
	#nowDay{
		font-size: 70px;
		margin-top: -140px;
		color: #000000b6;
	}
	#nowYear{
		font-size: 30px;
		margin-top: -75px;
		color: gray;
	}
	#clock{
		font-size: 30px; 
		text-align: center;
		margin-top: 15px;
		color: #000000cb
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
			<jsp:include page="../common/sidebar.jsp" />
                    <div class="cont">
		            <ul id="ac">
		                <li class="division">
		                    <a href="#">근태관리</a>
		                </li>
		                <div id="border">
				               <li class="menu1">
				                  <a href="#">내 근무</a>
				               </li>
				               <li class="menu1">
				                  <a href="#">근무현황</a>
				               </li>
				               <li class="menu1">
				                  <a href="#">휴가 신청</a>
				               </li>
		            	</div>
		            </ul>
		         </div> 			
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
							<a href="" class="plus-btn">+</a>
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
							<a href="" class="plus-btn">+</a>
						</div>

							<!-- 이미 출/퇴근 버튼 클릭했을 시 다시 클릭되지 않도록 -->
							<button class="commute-btn" onclick="insertArrive();" style="border-right: 2px solid lightgray;"align="center">
								<i class="far fa-arrow-alt-circle-right fa-rotate-90" style="color: rgb(163, 100, 223);"></i>
								<br><br>
								<p>
									출근하기 <br>
								</p>   
							</button>
						
							<button class="commute-btn" onclick="updateLeave();" align="center">
								<i class="far fa-arrow-alt-circle-right" style="color: rgb(163, 100, 223);"></i>
								<br><br>
								<p>
									퇴근하기 <br>
								</p>   
							</button>

							<button class="out-btn" onclick="updateStepout();">외출</button> 
							<button class="out-btn" onclick="updateOutwork();">외근</button>
					</div>
					
					
					
					<div class="contentbox" style="height: 300px;">
						<div class="category-title">
							&nbsp;&nbsp; 
							<i class="far fa-clock fa-1x"></i>&nbsp;
							근무 현황
							<a href="" class="plus-btn">+</a>
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
										value	+= "<tr>"
											  		+ "<td class='td1'> <div class='att-circle'></div> </td>"
											  		+ "<td class='td2'>" + at.arriveTime + "&nbsp;&nbsp;출근 </td>" 		
											  	+ "</tr><tr>"
											  		+ "<td> <div class='att-circle c2'></div> </td>"
											  		+ "<td>" + at.stepoutTime + "&nbsp;&nbsp;외출 </td>"
											  	+ "</tr><tr>"
											  		+ "<td> <div class='att-circle c3'></div> </td>"
											  		+ "<td>" + at.outworkTime + "&nbsp;&nbsp;외근 </td>"
											  	+ "</tr><tr>"
											  		+ "<td> <div class='att-circle c4'></div> </td>"
											  		+ "<td>" + at.leaveTime + "&nbsp;&nbsp;퇴근 </td>"
											  + "</tr>";		  
									
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
					</script>

					<div class="contentbox" style="height: 200px;">
						<div class="category-title">
							&nbsp;&nbsp; 
							<i class="far fa-clock fa-1x"></i>&nbsp;
							근태 현황
							<a href="" class="plus-btn">+</a>
						</div>
					</div>               
					<div class="contentbox" style="height: 200px;">
						<div class="category-title">
							&nbsp;&nbsp; 
							<i class="far fa-clock fa-1x"></i>&nbsp;
							근무 시간
							<a href="" class="plus-btn">+</a>
						</div>
					</div>
					<div class="contentbox" style="height: 200px;">
						<div class="category-title">
							&nbsp;&nbsp; 
							<i class="far fa-clock fa-1x"></i>&nbsp;
							휴가 현황
							<a href="" class="plus-btn">+</a>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</div>
</div>


</body>
</html>