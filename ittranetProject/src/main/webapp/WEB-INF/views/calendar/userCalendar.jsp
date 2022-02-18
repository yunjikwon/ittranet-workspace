<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	
</body>
</html>