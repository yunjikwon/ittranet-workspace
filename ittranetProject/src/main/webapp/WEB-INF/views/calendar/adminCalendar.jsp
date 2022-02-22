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
   	</style>

    <script> 
    
    function selectCalendar() {
		$.ajax({
	   		  type:"get",
	   		  url:"adminCalList.ca",
	   		  dataType:"json",
	   		  success:function(calendarList){
	   			  
	   			  let eventArr = [];
	   			  for(let i in calendarList) {

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
	   			  
	   			var calendarEl = document.getElementById('calendar');
	   	        var calendar = new FullCalendar.Calendar(calendarEl, {
	   	          initialView: 'dayGridMonth',
	   	          locale: 'ko',
	   	          expandRows: true,
	   	          headerToolbar: {
	   	            left: 'prev,next today',
	   	            center: 'title',
	   	            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
	   	          },
	   	          slotMinTime: '08:00', 
	   	          slotMaxTime: '20:00',
	   	          editable: true,
	   	          selectable: true,
	   	          eventAdd: function(obj) {
	   	              console.log('추가');
	   	          param = {};
	   	          },
	   	          select: function(arg) {
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
	   	          , eventClick:function(info){ 

	   	        	  var clickStartYear = info.event._instance.range.start.toISOString().split("T")[0].substring(0,4); 	          
	 	   	          var clickStartMonth = info.event._instance.range.start.toISOString().split("T")[0].substring(5,7);         
	 	   	          var clickStartDay = info.event._instance.range.start.toISOString().split("T")[0].substring(8,10);	          
	 	   	          var clickStartTime = info.event._instance.range.start.toISOString().split("T")[1].substring(0, 5);
   	      
	 	   	          let upStartDate = clickStartYear + "-" + clickStartMonth + "-" + clickStartDay + "T" + clickStartTime;
						
	   	        	  var clickEndYear = info.event._instance.range.end.toISOString().split("T")[0].substring(0,4);
	 	   	          var clickEndMonth = info.event._instance.range.end.toISOString().split("T")[0].substring(5,7);
	 	   	          var clickEndDay = info.event._instance.range.end.toISOString().split("T")[0].substring(8,10);
	 	   	          var clickEndTime = info.event._instance.range.end.toISOString().split("T")[1].substring(0, 5);
	 	   	          
	 	   	          let upEndDate = clickEndYear + "-" + clickEndMonth + "-" + clickEndDay + "T" + clickEndTime;
	 	   	          
	 	   	         
	 	   	          let clickContent = info.event._def.title;
	   	        			  
	   	        	  $("#upStartDate").val(upStartDate); 
	   	        	  $("#upEndDate").val(upEndDate); 
	   	        	  $("#upContent").val(clickContent); 
	   	        	  $(".hiddenNo").val(info.event._def.groupId); 
	   	        	  if(clickStartTime == '00:00') {
	   	        		  $("#upAllDay").attr("checked", true);
	   	        	  }else {
	   	        		  $("#upAllDay").attr("checked", false);
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
   	  
      }); 
      
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
      function inCalAdmin() {
    	  
    	  var inStartDate = document.getElementById("inStartDate").value;
    	  var startYear = inStartDate.substring(0,4);
    	  var startMonth = inStartDate.substring(5,7);
    	  var startDay = inStartDate.substring(8,10);
    	  var startTime = inStartDate.substring(11, 16);
    	  var isAllDay = 'N';
    	  
    	  inStartDate = startMonth + "/" + startDay + "/" + startYear + " " + startTime;

    	  var inEndDate = document.getElementById("inEndDate").value;
    	  var endYear = inEndDate.substring(0,4);	    	  
    	  var endMonth = inEndDate.substring(5,7);	    	  
    	  var endDay = inEndDate.substring(8,10);	  
    	  var endTime = inEndDate.substring(11, 16);	    	  
    	  inEndDate = endMonth + "/" + endDay + "/" + endYear + " " + endTime;

    	  var planContent = document.getElementById("inContent").value;

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
          			url:"insertAdminCa.ca",
          			data:{
          				empNo:'${loginUser.empNo}',
          				calStart:inStartDate,
          				calEnd:inEndDate,
          				calContent:planContent,
          				allDay:isAllDay
          			},success:function(status){
          				console.log(status);
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
          				console.log(status);
          				console.log("일정 insert 통신 실패");
          			}
          		});
        	}

      }; // inCalSubmit()
      
      // *** 일정 삭제 버튼 클릭 이벤트 ***
      function delCalAdmin() {
    	  
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
      function upCalAdmin() {

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
			                  	<input type="datetime-local" id="inStartDate" name="planStart" class="calInput"><br><br>
			                  	종료일
			                  	<input type="datetime-local" id="inEndDate" name="planEnd" class="calInput"><br><br>
			                  	<input type="checkbox" id="inAllDay">AllDay(하루종일)<br><br>
			                  	일정 내용
			                  	<input type="text" id="inContent" class="calInput"><br><br>
			                  	<button class="btn btn-light" id="inbtn" onclick="inCalAdmin();">등록</button>
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
			                  	<input type="text" id="upContent" class="calInput"><br><br>
			                  	<button class="btn btn-light" id="upbtn" onclick="upCalAdmin();">수정</button>
			                  </div>
			               </li>
			               <li class="menu1" onclick="deleteCal();">
			                  <a href="#">일정 삭제</a>
			                  <div class="slideTogglebox" id="deleteBox">
			                  	<input type="hidden" class="hiddenNo" name="calNo"/>
			                  	<br>
			                  	<button class="btn btn-light" id="delbtn" onclick="delCalAdmin();">삭제</button>
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