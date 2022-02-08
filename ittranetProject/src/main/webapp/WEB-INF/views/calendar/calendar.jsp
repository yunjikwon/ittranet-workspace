<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      ㅇ
      #calendar-container{
        width:1000px;
        height:1000px;
      }
      html, body {
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
        font-size: 14px;
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
        margin-left: 200px;
      }

      #calendar {
        max-width: 1100px;
        margin: 20px auto;
      }
      /* body 스타일 */
      html, body {
      overflow: hidden;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
      }
      /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
      .fc-header-toolbar {
      padding-top: 1em;
      padding-left: 1em;
      padding-right: 1em;
      }
    </style>

    <script>
      document.addEventListener('DOMContentLoaded', function() {
      var Calendar = FullCalendar.Calendar;
      var Draggable = FullCalendar.Draggable;

      var containerEl = document.getElementById('external-events');
      var calendarEl = document.getElementById('calendar');
      var checkbox = document.getElementById('drop-remove');

      // initialize the external events
      // -----------------------------------------------------------------

      new Draggable(containerEl, {
        itemSelector: '.fc-event',
        eventData: function(eventEl) {
          return {
            title: eventEl.innerText
          };
        }
      });

        // initialize the calendar
        // -----------------------------------------------------------------

      var calendar = new Calendar(calendarEl, {
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        editable: true,
        droppable: true, // this allows things to be dropped onto the calendar
        drop: function(info) {
          // is the "remove after drop" checkbox checked?
          if (checkbox.checked) {
            // if so, remove the element from the "Draggable Events" list
            info.draggedEl.parentNode.removeChild(info.draggedEl);
          }
        }
      });

      calendar.render();
    });


      
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
          locale: 'ko', // 한국어 설정
          height: '700px', // calendar 높이 설정
          expandRows: true, // 화면에 맞게 높이 재설정
          headerToolbar: { // 헤더에 표시할 툴바
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
          },
          slotMinTime: '08:00', // Day 캘린더에서 시작 시간
          slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        });
        calendar.render();
      });
     
    </script>

    <!--
    <script>
      $(document).ready(function(){
        // calendar element 취득
        var calendarEl = $('#calendar')[0];
        // full-calendar 생성하기
        var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          var title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
        }
        calendar.render();
      })
        </script>
        -->
</head>
<body>
	
    <div id='external-events'>
      <p>
        <strong>Draggable Events</strong>
      </p>
  
      <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
        <div class='fc-event-main'>My Event 1</div>
      </div>
      <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
        <div class='fc-event-main'>My Event 2</div>
      </div>
      <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
        <div class='fc-event-main'>My Event 3</div>
      </div>
      <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
        <div class='fc-event-main'>My Event 4</div>
      </div>
      <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
        <div class='fc-event-main'>My Event 5</div>
      </div>
  
      <p>
        <input type='checkbox' id='drop-remove' />
        <label for='drop-remove'>remove after drop</label>
      </p>
    </div>

    <div id='calendar-container'>
        <div id='calendar'></div>
    </div>
</body>
</html>