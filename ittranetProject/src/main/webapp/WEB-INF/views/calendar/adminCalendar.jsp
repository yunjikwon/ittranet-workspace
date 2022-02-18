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
     	height:300px;
     	background-color:beige;
     	display:none;
     }
     .dateInput {
     	width:100%;
     }
     #inbtn, #upbtn, #delbtn {
     	margin:auto;
     	display:block;
     }
   	</style>

    <script>
    
    
      document.addEventListener('DOMContentLoaded', function() {
    	  
    	  
      	  $.ajax({
      		  type:"get",
      		  data:{
      			calSelector:'${loginUser.empNo}'
    		  },
      		  url:"calList.ca",
      		  dataType:"json",
      		  success:function(calendarList){
      			  /*
      			  console.log(result);
      			  console.log(result[1]);
      			  console.log(result[1].calContent);
      			  */
      			  
      			  let eventArr = []; // 빈 배열 생성 후 Db에서 조회한 일정들을 이 배열에 차곡차곡 담기
      			  for(let i in calendarList) {
      				  eventArr.push( // 위의 빈 배열에 push메소드로 각 행들 삽입
      					  {
      						  title:calendarList[i].calContent,
      	    			  	  start:calendarList[i].calStart,
      	    			  	  end:calendarList[i].calEnd,
      	    			  	  color:calendarList[i].calColor
      					  }
      				  )
      			  }
      			  
      			  console.log(eventArr);
      			  
      			var calendarEl = document.getElementById('calendar');
      	        var calendar = new FullCalendar.Calendar(calendarEl, {
      	          initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
      	          locale: 'ko', // 한국어 설정
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
      	          
      	        });
      	        calendar.render();
      			  	
      		  },error:function(){
      			  console.log("실패");
      		  }
      	  });
        	  
        
        
      }); // fullCalendar
      
      // 일정 등록 메뉴 클릭 이벤트
      function insertCal(){
    	  $('#insertBox').slideToggle();
    	  $('#updateBox').hide();
    	  $('#deleteBox').hide();
      }
      
      // 일정 수정 메뉴 클릭 이벤트
      function updateCal(){
    	  $('#updateBox').slideToggle();
    	  $('#insertBox').hide();
    	  $('#deleteBox').hide();
      }
      
      // 일정 삭제 메뉴 클릭 이벤트
      function deleteCal(){
    	  $('#deleteBox').slideToggle();
    	  $('#updateBox').hide();
    	  $('#insertBox').hide();
      }
      
     
    </script>
</head>
<body>

	<div class="back">
	
		<div class="innerBack">
			<jsp:include page="../common/pageHeader.jsp"/>
			<jsp:include page="../common/adminMenu.jsp"/>
			
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
				                  	<input type="datetime-local" name="planStart" class="dateInput"><br><br>
				                  	종료일
				                  	<input type="datetime-local" name="planEnd" class="dateInput"><br><br>
				                  	일정 내용
				                  	<input type="text">
				                  	<button class="btn btn-info" id="inbtn" disabled>등록</button>
				                  </div>
				               </li>
				               <li class="menu1">
				                  <a href="#" onclick="updateCal();">일정 수정</a>
				                  <div class="slideTogglebox" id="updateBox">
				                  	시작일
				                  	<input type="datetime-local" name="planStart" class="dateInput"><br><br>
				                  	종료일
				                  	<input type="datetime-local" name="planEnd" class="dateInput"><br><br>
				                  	<button class="btn btn-info calbtn" id="upbtn" disabled>수정</button>
				                  </div>
				               </li>
				               <li class="menu1" onclick="deleteCal();">
				                  <a href="#">일정 삭제</a>
				                  <div class="slideTogglebox" id="deleteBox">
				                  	<button class="btn btn-info" id="delbtn" disabled>삭제</button>
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
	
</body>
</html>