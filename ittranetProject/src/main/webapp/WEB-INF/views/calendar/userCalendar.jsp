<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8' />
    <!--fullCalendar-->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/gcal.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js'></script>
    <style>
    .schedule {
    	color:black;
    }
     #external-events {
       position: fixed;
       z-index: 2;
       top: 20px;
       left: 20px;
       width: 150px;
       padding: 0 10px;
       border: 1px solid #ccc;
       background: #eee;
     }

     .demo-topbar + #external-events { /* will get stripped out */
       top: 60px;
     }

     #external-events .fc-event {
       cursor: move;
       margin: 3px 0;
     }

     #calendar-container {
       position: relative;
       z-index: 1;
       /*margin-left: 200px;*/
     }

     #calendar {
       margin: 20px auto;
     }
     /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
     .fc-header-toolbar {
	     padding-top: 1em;
	     padding-left: 1em;
	     padding-right: 1em;
     }
     .menu1 {
     	
     }
     /*토글*/
     .slideTogglebox {
     	width:100%;
     	font-weight:bold;
     	background-color:mistyrose;
     	display:none;
     }
     #insertBox, #updateBox {
     	height:350px;
     }
     #deleteBox {
     	height:100px;
     }
     .calInput {
     	width:100%;
     }
     #inbtn, #upbtn, #delbtn {
     	margin:auto;
     	display:block;
     }
          #calendar button{
     	background:lightblue;
     	border-color:lightskyblue;
     	color:white;
     	height:50px;
     }
     #calendar button:hover{
     	color:black;
     	font-weight:bold;
     }
   	</style>

    <script>
    	
    	// *** 캘린더 조회 ***
    	function selectCalendar() {
    		$.ajax({
  	   		  type:"get",
  	   		  data:{
  	   			  empNo:'${loginUser.empNo}'
  	   		  },
  	   		  url:"calList.ca",
  	   		  dataType:"json",
  	   		  success:function(calendarList){
  	   			  
  	   			  let eventArr = []; // 빈 배열 생성 후 Db에서 조회한 일정들을 이 배열에 차곡차곡 담기
  	   			  for(let i in calendarList) {
  	   				  // allDay 조건식
  	   				  if(calendarList[i].allDay == 'Y') {
  	   					  eventArr.push(
  	   						{
  	   						  groupId:calendarList[i].calNo,
	   						  title:calendarList[i].calContent,
	   	    			  	  start:calendarList[i].calStart,
	   	    			  	  end:calendarList[i].calEnd,
	   	    			  	  color:calendarList[i].calColor,
	   	    			  	  allDay:true
  	   						}	   
  	   					  )
  	   				  }else {
  	   						eventArr.push(
  	  	   						{
  	  	   						  groupId:calendarList[i].calNo,
  		   						  title:calendarList[i].calContent,
  		   	    			  	  start:calendarList[i].calStart,
  		   	    			  	  end:calendarList[i].calEnd,
  		   	    			  	  color:calendarList[i].calColor,
  		   	    			  	  allDay:false
  	  	   						}	   
  	  	   					  )
  	   				  }
  	   				  
  	   			  } // for in
  	   			  
  	   			  // console.log(eventArr);
  	   			  
  	   			var calendarEl = document.getElementById('calendar');
  	   	        var calendar = new FullCalendar.Calendar(calendarEl, {
  	   	          initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
  	   	          locale: 'ko', // 한국어 설정
  	   	     	  googleCalendarApiKey : "AIzaSyCLvJjierhxYSxsWIumWXGddinCb-QSiUk" 
	               , eventSources : [
	                   {
	                         googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
	                       , className : "koHolidays"
	                       , color : "lightpink"
	                       , textColor : "tomato"
	                   }
	               ],
  	   	          expandRows: true, // 화면에 맞게 높이 재설정
  	   	          headerToolbar: { // 헤더에 표시할 툴바
  	   	            left: 'prev,next today',
  	   	            center: 'title',
  	   	            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
  	   	          },
  	   	          slotMinTime: '08:00', // Day 캘린더에서 시작 시간
  	   	          slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
  	   	          editable: true,
  	   	          selectable: true,
  	   	          eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
  	   	              console.log('추가');
  	   	          param = {};
  	   	          //$ajax.post(localhost:8888/path, param, $ajax.callback, $ajax.errCallback);
  	   	          },
  	   	          select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
  	   	            var title = prompt('Event Title:');
  	   	            if (title) {
  	   	              calendar.addEvent({
  	   		              title: title,
  	   		              start: arg.start,
  	   		              end: arg.end,
  	   		              allDay: arg.allDay
  	   		            });
  	   	          	}
  	   	          	calendar.unselect()
  	   	          },events:eventArr
  	   	          // *** 일정 수정 ***
  	   	          , eventClick:function(info){ // 특정 일정을 클릭했을 때
  	   	        	  
  	   	        	  // console.log(info)
  	   	        	  // console.log(info.event._def.ui.backgroundColor);
  	   	          
  	   	          	  if(info.event._def.ui.backgroundColor == 'royalblue') { // 클릭 이벤트가 회사 일정일 때
  	   	          		  
		  	   	          	Swal.fire({
		  	      			  icon: 'warning',
		  	      			  title: '회사 일정입니다!',
		  	      			  text: '회사 일정은 수정할 수 없습니다'
		  		      		});
		  	   	          		  
  	   	          	  }else { // 클릭한 이벤트가 접속한 개인의 일정일 때
  	   	          		  
  	   	          		  /*
	  	   	          	  console.log("일정번호 : ", info.event._def.groupId);
		   	        	  console.log("일정제목 : ", info.event._def.title);
		   	        	  console.log("일정시작일 : ", info.event._instance.range.start);
		   	        	  console.log("일정끝일 : ", info.event._instance.range.end);
		   	        	  console.log(info.event._instance.range.start.toISOString().split("T")[0]) // 2022-02-05
		 	   	          console.log(info.event._instance.range.start.toISOString().split("T")[1].substring(0, 5)) // 10:00
		   	        	  */
		   	        	  
		   	        	  // 시작일
		   	        	  var clickStartYear = info.event._instance.range.start.toISOString().split("T")[0].substring(0,4);
		 	   	          // console.log(clickStartYear);
		 	   	          
		 	   	          var clickStartMonth = info.event._instance.range.start.toISOString().split("T")[0].substring(5,7);
		 	   	          // console.log(clickStartMonth);
		 	   	          
		 	   	          var clickStartDay = info.event._instance.range.start.toISOString().split("T")[0].substring(8,10);
		 	   	          // console.log(clickStartDay);
		 	   	          
		 	   	          var clickStartTime = info.event._instance.range.start.toISOString().split("T")[1].substring(0, 5);
		 	   	          // console.log(clickStartTime);
		 	   	          
		 	   	          // 시작일 최종
		 	   	          // let upStartDate = clickStartMonth + "/" + clickStartDay + "/" + clickStartYear + " " + clickStartTime;
		 	   	          let upStartDate = clickStartYear + "-" + clickStartMonth + "-" + clickStartDay + "T" + clickStartTime;
							
		 	   	          // 종료일
		   	        	  var clickEndYear = info.event._instance.range.end.toISOString().split("T")[0].substring(0,4);
		 	   	          var clickEndMonth = info.event._instance.range.end.toISOString().split("T")[0].substring(5,7);
		 	   	          var clickEndDay = info.event._instance.range.end.toISOString().split("T")[0].substring(8,10);
		 	   	          var clickEndTime = info.event._instance.range.end.toISOString().split("T")[1].substring(0, 5);
		 	   	          
		 	   	          // 종료일 최종
		 	   	          // let upEndDate = clickEndMonth + "/" + clickEndDay + "/" + clickEndYear + " " + clickEndTime;
		 	   	          let upEndDate = clickEndYear + "-" + clickEndMonth + "-" + clickEndDay + "T" + clickEndTime;
		 	   	          
		 	   	          // 일정 내용
		 	   	          let clickContent = info.event._def.title;
		   	        			  
		   	        	  $("#upStartDate").val(upStartDate); // 수정 시작일 input에 뿌리기
		   	        	  $("#upEndDate").val(upEndDate); // 수정 종료일 input에 뿌리기
		   	        	  $("#upContent").val(clickContent); // 수정 일정 내용 input에 뿌리기
		   	        	  $(".hiddenNo").val(info.event._def.groupId); // 수정|삭제 일정 넘버 뿌리기
		   	        	  if(clickStartTime == '00:00') {
		   	        		  $("#upAllDay").attr("checked", true);
		   	        	  }else {
		   	        		  $("#upAllDay").attr("checked", false);
		   	        	  }
		   	        	  
	  	   	          	  }
  	   	          }
  	   	          
  	   	        });
  	   	        calendar.render();
  	   			  	
  	   		  },error:function(){
  	   			  console.log("실패");
  	   		  }
  	   	  }); // ajax
    	} // selectCalendar
    	
    	document.addEventListener('DOMContentLoaded', function () {
		
    		selectCalendar();
	   	  
	      }); // fullCalendar
	      
	      // *** 일정 등록 메뉴 클릭 이벤트 ***
	      function insertCal(){
	    	  $('#insertBox').slideToggle();
	    	  $('#updateBox').hide();
	    	  $('#deleteBox').hide();
	      }
	      
	      // *** 일정 수정 메뉴 클릭 이벤트 ***
	      function updateCal(){
	    	  $('#updateBox').slideToggle();
	    	  $('#insertBox').hide();
	    	  $('#deleteBox').hide();
	      }
	      
	      // *** 일정 삭제 메뉴 클릭 이벤트 ***
	      function deleteCal(){
	    	  $('#deleteBox').slideToggle();
	    	  $('#updateBox').hide();
	    	  $('#insertBox').hide();
	      }
	      
	      // *** 일정 등록 버튼 클릭 이벤트 ***
	      function inCalSubmit() {
	    	  
	    	  var inStartDate = document.getElementById("inStartDate").value;
	    	  //console.log("시작일 : " + upStartDate);
	    	  
	    	  var startYear = inStartDate.substring(0,4);
	    	  //console.log("시작일 년도 : " + startYear);
	    	  
	    	  var startMonth = inStartDate.substring(5,7);
	    	  //console.log("시작일 월 : " + startMonth);
	    	  
	    	  var startDay = inStartDate.substring(8,10);
	    	  //console.log("시작일 일 : " + startDay);
	    	  
	    	  var startTime = inStartDate.substring(11, 16);
	    	  //console.log("시작일 시간 : " + startTime);
	    	  
	    	  var isAllDay = 'N';
	    	  
	    	  inStartDate = startMonth + "/" + startDay + "/" + startYear + " " + startTime;

	    	  // ~~ 종료일 ~~
	    	  var inEndDate = document.getElementById("inEndDate").value;
	    	  var endYear = inEndDate.substring(0,4);	    	  
	    	  var endMonth = inEndDate.substring(5,7);	    	  
	    	  var endDay = inEndDate.substring(8,10);	  
	    	  var endTime = inEndDate.substring(11, 16);	    	  
	    	  inEndDate = endMonth + "/" + endDay + "/" + endYear + " " + endTime;
	    	  
	    	  // ~~ 일정내용 ~~
	    	  var planContent = document.getElementById("inContent").value;
	    	  // console.log("일정 내용 : " + planContent);
	    	  
	    	  // AllDay체크박스 체크시
	    	  // * else if문에 있을 때 적용 안됨 위로 빼니까 적용 됨!
	    	  if($('#inAllDay').is(':checked')) {
	    		    isAllDay = 'Y';
	    	  }
	    	  
	    	  if(!inStartDate) {
	        		Swal.fire({
	      			  icon: 'warning',
	      			  title: '시작일을 선택하지 않았습니다',
	      			  text: '시작 일자를 선택하세요!'
	      			});
	        	} else if(!inEndDate) {
	        		Swal.fire({
	      			  icon: 'warning',
	      			  title: '종료일을 선택하지 않았습니다',
	      			  text: '종료 일자를 선택하세요!'
		      		});
	        	} else if(!planContent) {
	        		Swal.fire({
	      			  icon: 'warning',
	      			  title: '일정을 입력하지 않았습니다',
	      			  text: '일정 내용을 입력하세요!'
		      		});
	        	} else if(inStartDate > inEndDate) {
	        		Swal.fire({
	      			  icon: 'error',
	      			  title: '날짜를 잘못 입력하셨습니다',
	      			  text: '종료일이 시작일보다 빠릅니다! 다시 입력하세요'
		      		});
	        	} else {
	        		$.ajax({
	          			url:"insertUserCal.ca",
	          			data:{
	          				empNo:'${loginUser.empNo}',
	          				calStart:inStartDate,
	          				calEnd:inEndDate,
	          				calContent:planContent,
	          				allDay:isAllDay
	          			},success:function(status){
	          				if(status == "success") {
		          				// console.log("성공");
		          				selectCalendar();
		          				Swal.fire({
		      	      			  icon: 'success',
		      	      			  title: '새 일정이 등록되었습니다!'
		      		      		});
		          				$("#inStartDate").val("");
		          				$("#inEndDate").val("");
		          				$("#inContent").val("");
		          				$("#inAllDay").prop("checked",false);
	          				}
	          			},error:function(){
	          				console.log("일정 insert 통신 실패");
	          			}
	          		});
	        	}

	      }; // inCalSubmit()
	      
	      // *** 일정 삭제 버튼 클릭 이벤트 ***
	      function delCalSubmit() {
	    	  
	    	  const clickNum = $(".hiddenNo").val();
	    	  
	    	  if(!clickNum){
	    		  
	    		  Swal.fire({
	      			  icon: 'warning',
	      			  title: '일정을 선택하지 않았습니다',
	      			  text: '삭제할 일정을 선택하세요!'
		      		});
	    		  
	    	  }else {
	    		  
	    		  $.ajax({
		    		  url:"deleteUserCal.ca",
		    		  data:{
		    			  calNo:$(".hiddenNo").val()
		    		  },success:function(status){
		    			  if(status =="success") {
			    			  selectCalendar();
		        			  Swal.fire('해당 일정이 삭제되었습니다');	    				  
		    			  }
		    		  },error:function(){
		    			  console.log("일정 delete 통신 실패");
		    		  }
		    	  })
		    	  
	    	  } 
	    	  
	      }; // delCalSubmit()
	      
	      // *** 일정 수정 버튼 클릭 이벤트 ***
	      function upCalSubmit() {

	    	  var upStartDate = document.getElementById("upStartDate").value;
	    	  var startYear = upStartDate.substring(0,4);
	    	  var startMonth = upStartDate.substring(5,7);
	    	  var startDay = upStartDate.substring(8,10);
	    	  var startTime = upStartDate.substring(11, 16);
	    	  var isAllDay = 'N';
	    	  
	    	  upStartDate = startMonth + "/" + startDay + "/" + startYear + " " + startTime;
	    	  
	    	  var upEndDate = document.getElementById("upEndDate").value;
	    	  var endYear = upEndDate.substring(0,4);	    	  
	    	  var endMonth = upEndDate.substring(5,7);	    	  
	    	  var endDay = upEndDate.substring(8,10);	  
	    	  var endTime = upEndDate.substring(11, 16);	
	    	  
	    	  upEndDate = endMonth + "/" + endDay + "/" + endYear + " " + endTime;
	    	  
	    	  // ~~ 일정내용 ~~
	    	  var planContent = document.getElementById("upContent").value;
	    	  
	    	  if($('#upAllDay').is(':checked')) {
	    		    isAllDay = 'Y';
	    	  }
	    	  
	    	  if(!upStartDate) {
	        		Swal.fire({
	      			  icon: 'warning',
	      			  title: '시작일을 선택하지 않았습니다',
	      			  text: '시작 일자를 선택하세요!'
	      			});
	        	} else if(!upEndDate) {
	        		Swal.fire({
	      			  icon: 'warning',
	      			  title: '종료일을 선택하지 않았습니다',
	      			  text: '종료 일자를 선택하세요!'
		      		});
	        	} else if(!planContent) {
	        		Swal.fire({
	      			  icon: 'warning',
	      			  title: '일정을 입력하지 않았습니다',
	      			  text: '일정 내용을 입력하세요!'
		      		});
	        	} else if(upStartDate > upEndDate) {
	        		Swal.fire({
	      			  icon: 'error',
	      			  title: '날짜를 잘못 입력하셨습니다',
	      			  text: '종료일이 시작일보다 빠릅니다! 다시 입력하세요'
		      		});
	        	} else {
	        		$.ajax({
	          			url:"updateUserCal.ca",
	          			data:{
	          				calNo:$(".hiddenNo").val(),
	          				calStart:upStartDate,
	          				calEnd:upEndDate,
	          				calContent:planContent,
	          				allDay:isAllDay
	          			},success:function(status){
	          				if(status == "success") {
		          				// console.log("성공");
		          				selectCalendar();
		          				Swal.fire({
		      	      			  icon: 'success',
		      	      			  title: '일정이 수정되었습니다!'
		      		      		});
		          				$("#upStartDate").val("");
		          				$("#upEndDate").val("");
		          				$("#upContent").val("");
		          				$("#upAllDay").prop("checked",false);
	          				}
	          			},error:function(){
	          				console.log("일정 insert 통신 실패");
	          			}
	          		});
	        	}
	
	      }
      
    </script>
</head>
<body>

	<div class="back">
	
		<div class="innerBack">
			<jsp:include page="../common/pageHeader.jsp"/>
			<jsp:include page="../common/userMenu.jsp"/>
			
			<br clear="both">
			
			<div style="position:relative">		
				<jsp:include page="../common/sidebar.jsp"/>
				<div class="cont">
		            <ul id="ac">
		                <li class="division">
		                    <a href="#">일정</a>
		                </li>
		                <div id="border">
			               <li class="menu1">
			                  <a href="#" onclick="insertCal();">일정 등록</a>  
			                  <div class="slideTogglebox" id="insertBox">
			                  	시작일
			                  	<input type="datetime-local" id="inStartDate" class="calInput"><br><br>
			                  	종료일
			                  	<input type="datetime-local" id="inEndDate" class="calInput"><br><br>
			                  	<input type="checkbox" id="inAllDay">AllDay(하루종일)<br><br>
			                  	일정 내용
			                  	<input type="text" id="inContent" class="calInput inputDate"><br><br>
			                  	<button type="button" class="btn btn-light" id="inbtn" onclick="inCalSubmit();">등록</button>
			                  </div>
			               </li>
			               <li class="menu1">
			                  <a href="#" onclick="updateCal();">일정 수정</a>
			                  <input type="hidden" class="hiddenNo" name="calNo"/>
			                  <div class="slideTogglebox" id="updateBox">
			                  	시작일
			                  	<input type="datetime-local" id="upStartDate" name="planStart" class="calInput"><br><br>
			                  	종료일
			                  	<input type="datetime-local" id="upEndDate" name="planEnd" class="calInput"><br><br>
			                  	<input type="checkbox" id="upAllDay">AllDay(하루종일)<br><br>
			                  	일정 내용
			                  	<input type="text" class="calInput" id="upContent"><br><br>
			                  	<button class="btn btn-light" id="upbtn" onclick="upCalSubmit();">수정</button>
			                  </div>
			               </li>
			               <li class="menu1" onclick="deleteCal();">
			                  <a href="#">일정 삭제</a>
			                  <div class="slideTogglebox" id="deleteBox">
			                  	<input type="hidden" class="hiddenNo" name="calNo"/>
			                  	<br>
			                  	<button class="btn btn-light" id="delbtn" onclick="delCalSubmit();">삭제</button>
			                  </div>
			               </li>
		            	</div>
		            </ul>
	         	</div>
									
				<div class="mainOuter" style="background:white">
					<div id='calendar-container'>
        				<div id='calendar'></div>
    				</div>
				</div><%-- mainOuter --%>
					
			</div><%-- relative --%>
				
		</div><%-- innerBack --%>
		
	</div>
	
	<script>
		
	</script>
	
</body>
</html>