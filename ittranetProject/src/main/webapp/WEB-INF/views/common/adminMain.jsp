<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--fullCalendar-->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/gcal.js'></script>
<!--FONT-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
   .hi{
		font-family: 'Anton', sans-serif;
		font-weight: bold;
		text-shadow: 1px 1px 1px black;
		font-size:45px;
		text-align: center;
		font-weight: bold;
		color: rgb(147, 205, 207);
   }
	body{
		margin:0;
		padding:0;
	}
	div{box-sizing: border-box;}
    .mainouter{
         width:100vw;
         /*height:100vh;*/
         height:1150px;
     }
     .innerOuter{
	     width:100%;
	     height:100%;
	     margin:auto;
     }
     
     .one{
         width:20%;
         height: 100%;
         float:left;
         background: rgb(142,207,246);
         background: linear-gradient(157deg, rgba(142,207,246,1) 0%, rgba(134,189,251,1) 15%, rgba(169,160,255,1) 52%, rgba(237,198,241,1) 87%, rgba(252,225,255,1) 100%);
         text-align: center;
     }
     .two{
         width:79%;
         height: 100%;
         float:left;
         background-color: #efefef;
     }

     #person{
         border:none;
         background-color: rgb(224, 224, 224);
         width:80%;
         height:300px;
         border-radius: 20px;
         margin:auto;
     }
     #profile{
         margin:auto;
     }
     #picture{
         border: 1px solid black;
         width:150px;
         height:150px;
         border-radius: 80px;
         margin:auto;
         margin-bottom: 10px;
     }
     .profilebtn{
         margin:auto;
         height:30px;
         margin-top:25px;
         border:none;
         background-color: rgba(100, 175, 157, 0.45);
         color:rgb(64, 64, 64);
         font-weight: 600;
     }
     #personCount{
         background-color: white;
         width:80%;
         height:300px;
         border-radius: 20px;
         margin:auto;
         padding-top:15px;
     }
     #pcTitle{
         font-weight: 800;
         font-size:18px;
         color:rgb(64, 64, 64);
     }

     #box{
         text-align: center;
         margin-top:30px;
     }
     /*조직현황표*/
     #box1{
         background-color: rgb(224, 224, 224);
         margin:0 auto;
         width:800px;
         height:850px;
         display: inline-block;
         border-radius: 20px;
         overflow: hidden;
     }
     /*일정관리*/
     #box2{
         background-color: rgb(224, 224, 224);
         margin:0 auto;
         width:550px;
         height:850px;
         display: inline-block;
         margin-left:50px;            
         border-radius: 20px;
         overflow: hidden;
     }
     .boxTitle{
         width:100%;
         height:40px;
         background-color: rgba(196, 158, 212, 0.8);
         margin:0px;
         
     }
     .btitle{
         display: inline-block;
         font-weight: 600;
         font-size: 18px;
         float:left;
         margin-left:15px;
         margin-top: 8px;
     }
     .plus{
         display: inline-block;
         font-weight: 600;
         font-size: 20px;
         float:right;
         margin-right:5%;
         margin-top: 3px;
     }
     .plus:hover{
     	cursor:pointer;
     }
     #logo>img{
         width:80%;
         height:100px;
         margin:auto;
         margin-top: 20px;
         display: inline-block;
     }
	.profileZone {
	 	width:150px;
	 	height:150px;
	 	border-radius:50%;	
	}
	/*캘린더*/
	#calendar-container {
       position: relative;
       z-index: 1;
       /*margin-left: 200px;*/
     }

     #calendar {
       margin: 20px auto;
     }
     #todays {
     	
     }
</style>
</head>
<body>
   
    <div class="mainouter">
		<div class="innerOuter">
		
        <div class="one">
            <!--로고-->
            <div id="logo"><img src="resources/images/logo.png"  alt="logo	" /></div>
            <br><br>
            <div id="person">
				<br>
                <div id="profile">
                   	<c:choose>
                		<c:when test="${ loginUser.profile eq 'NULL'}">
		                	<img class="profileZone" src="resources/images/userprofile.png">
                		</c:when>
                		<c:otherwise>
		                	<img class="profileZone" src="${ loginUser.profile }">
                		</c:otherwise>
                	</c:choose>
                    <div align="center" style="font-weight: 600;">관리자</div>
                </div>

                <div>
                    <button class="profilebtn" onclick="location.href='myPage.me'">마이페이지</button>
                    <button class="profilebtn" onclick="location.href='bye.me'">로그아웃</button>
                </div>
            </div>
            <br><br><br>


            <div id="personCount">
                <div id="pcTitle" style=""><p class="hi">Head Count</p></div> 
                <hr style="width:80%; ">
                <i class="fas fa-users fa-3x hi"></i><p class="hi" style="font-weight:normal; font-size:55px;">${ dlist.allEmp }</p>
            </div>


        </div>
        <div class="two">
        <!-- 헤더 -->
        <jsp:include page="header.jsp"/>
        <!-- 메뉴바 -->
    	<jsp:include page="adminMenu.jsp"/>
    	
   		<div style="display:none;">
   			<input type="hidden" id="allEmp" value="${ dlist.allEmp }">
   			<input type="hidden" id="dzero" value="${ dlist.dzero }">
   			<input type="hidden" id="done" value="${ dlist.done }">
   			<input type="hidden" id="dtwo" value="${ dlist.dtwo }">
   			<input type="hidden" id="dthr" value="${ dlist.dthr }">
   			<input type="hidden" id="dfour" value="${ dlist.dfour }">
   			<input type="hidden" id="dfive" value="${ dlist.dfive }">
   			<input type="hidden" id="dsix" value="${ dlist.dsix }">
   			<input type="hidden" id="dsev" value="${ dlist.dsev }">
   		</div>
    	
    	
            <div id="box">
	            <!--조직인원현황표-->
            	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
                <div id="box1">
                    <div class="boxTitle">
                        <div class="btitle">조직 인원 현황 표</div>
                        <div class="plus" onclick="location.href='setEmpForm.me'">+</div>
                    </div>
                    
                    <div style="width:800px; height: 800px;">
						<!--차트가 그려질 부분-->
						<canvas id="myChart"></canvas>
					</div>
                </div>
                
                <!--일정관리-->

                <div id="box2">
                    <div class="boxTitle">
                        <div class="btitle">일정</div>
                        <div class="plus" onclick="location.href='viewAdminCal.ca'">+</div>
                    </div>
                    <div id='calendar-container' style="margin:10px;">
        				<div id='calendar'></div>
    				</div>
    				
    				<hr style="width:90%; height:10px; color:darkgray;">

    				<table>
	                    <tr>
	                        <th><i class="far fa-calendar-check fa-2x" style="float:left; margin-left:10px;"></i> <h4 style="display: inline-block; float:left; margin-left:5px;">Today's Schedule</h4></th>
	                    </tr>        
	                    <c:choose>
	    					<c:when test="${ empty slist }">
	    						<th>일정이 없습니다</th>
	    					</c:when>
	    					<c:otherwise>
	    						<c:forEach var="s" items="${ slist }">
	    							<tr>
	    								<td><h5 style="float:left; margin-left:50px;"><i class="fas fa-paw"></i> ${ s.calContent }</h5></td>
	    							</tr>
	    						</c:forEach>
	    					</c:otherwise>
	    				</c:choose>
                	</table>
    				
    				</div>
                </div>

            </div>


        </div>
		

    </div>
    </div>
    
    <!-- 푸터바
    <jsp:include page="footer.jsp" />
     -->
	<script>
		// 캘린더 조회
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
		   	          height: '550px',
		   	          initialView: 'dayGridMonth',
		   	          googleCalendarApiKey : "AIzaSyCLvJjierhxYSxsWIumWXGddinCb-QSiUk"      // Google API KEY
		               , eventSources : [
		                   // 대한민국의 공휴일
		                   {
		                         googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
		                       , className : "koHolidays"
		                       , color : "lightpink"
		                       , textColor : "tomato"
		                   }
		               ],
		   	          expandRows: true,
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
      

		// 조직 인원
		var dzero = ${ dlist.dzero };
		var done = ${ dlist.done };
		var dtwo = ${ dlist.dtwo };
		var dthr = ${ dlist.dthr };
		var dfour = ${ dlist.dfour };
		var dfive = ${ dlist.dfive };
		var dsix = ${ dlist.dsix };
		var dsev = ${ dlist.dsev };
		
	
	    var context = document
	        .getElementById('myChart')
	        .getContext('2d');
	    var myChart = new Chart(context, {
	        type: 'pie', // 차트의 형태
	        data: { // 차트에 들어갈 데이터
	            labels: [
	                //x 축
	                '경영지원부','영업부','재무부','광고홍보부','IT전략부','CS','미정'
	            ],
	            datasets: [
	                { //데이터
	                    label: 'test1', //차트 제목
	                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                    data: [
	                        dtwo,dthr,dfour,dfive,dsix,dsev,done+dzero //x축 label에 대응되는 데이터 값
	                    ],
	                    backgroundColor: [
	                        //색상
	                        'rgba(255, 99, 132, 0.2)',
	                        'rgba(54, 162, 235, 0.2)',
	                        'rgba(255, 206, 86, 0.2)',
	                        'rgba(75, 192, 192, 0.2)',
	                        'rgba(153, 102, 255, 0.2)',
	                        'rgba(255, 159, 64, 0.2)'
	                    ],
	                    borderColor: [
	                        //경계선 색상
	                        'rgba(255, 99, 132, 1)',
	                        'rgba(54, 162, 235, 1)',
	                        'rgba(255, 206, 86, 1)',
	                        'rgba(75, 192, 192, 1)',
	                        'rgba(153, 102, 255, 1)',
	                        'rgba(255, 159, 64, 1)',
	                        'darkgray'
	                    ],
	                    borderWidth: 1 //경계선 굵기
	                
	                }
	            ] // datasets
	        }, // data
	        options: {
	            scales: {
	                yAxes: [
	                    {
	                        ticks: {
	                            beginAtZero: true
	                        }
	                    }
	                ]
	            }
	        }
	    });
	</script>
    
    
    
</body>
</html>