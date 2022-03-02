<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.project_mn{
     		color:#000000;
     	}
    .wrap{
       padding: 30px;
    }
    
    .todostatus{
        border: 1px solid rgb(190, 190, 190);;
        border-radius: 5mm;
        padding: 15px;
        background-color: rgb(209, 189, 219);
        width: 830px;
        height: 150px;
        margin: 20px;
    }
    .todoTable{
        margin: auto;
        margin-bottom: 15px;
    }
    .statusitems{
        width: 500px;
        height: 70px;
        float: right;
        margin-right: 25px;
        padding-top: 3%;
    }

    tr{
        height: 45px;
        background-color: rgba(255, 255, 255, 0.57);
        border-bottom: 1px solid silver;
        font-size: 13.5px;
    }

    .statuslist{
        margin-left: 45px;
        margin-top: 50px;
    }
    .todolist{
        margin-left: 45px;
        margin-top: 50px;
    }

    .todoTabletr{
        font-size: 15px;
        border: none;
    }
        button{
        width: 80px;
        height: 35px;
        border: none;
        border-radius: 1mm;
        font-size: 13px;
        font-weight: bold;
        color: white;
    }
    .button2{
        background-color: rgb(202, 183, 211);       
        float: right;
        margin: 10px;
        border-radius: 1mm;
    }
    .button3{
        background-color: rgb(160, 156, 163);       
        float: right;
        margin: 10px;
        margin-right: 40px;
        border-radius: 1mm;
    }
</style>
</head>
<body>
<div class="back">
 <div class="innerBack">
 	<jsp:include page="../common/pageHeader.jsp" />
 	<jsp:include page="../common/userMenu.jsp" />
 	
 	<br clear="both">
 	<div style="position:relative">
 	<jsp:include page="../common/sidebar.jsp"  />
 		<div class="cont">
          <ul id="ac">
             <li class="division">
               <a href="#">프로젝트</a>
             </li>
                <div id="border">
		               <li class="menu1">
		                  <a href="list.pr">내 프로젝트</a>
		               </li>
		               <li class="menu1">
		                  <a href="#">프로젝트 만들기</a>
		               </li>
		               <li class="menu1">
		                  <a href="todo.pr">내 업무</a>
		               </li>
		               <li class="menu1">
		                  <a href="news.pr">뉴스피드</a>
		               </li>
            	</div>
            </ul>
         </div>
 

    <div class="mainOuter"> 
    <div class="wrap">    
        <h4 style="font-weight:bold;">내 업무</h4>
        
        <!--업무 현황-->
        <div class="todostatus">
            <h6 class="statusmenu" style="font-weight: bold;">업무 현황</h6>
            
            <table class="todoTable" style="text-align: center;">
            	<tr class="todoTabletr" style="background-color: transparent;">
            		<th rowspan="2" style="width: 250px; height: 70px; font-size: 60px;" > <fmt:formatNumber value="${(todoO/todoAll)*100}" pattern="#,#0.0" /></h>%</h1> </th>
					
            		<th style="width: 100px;">대기</th>
            		<th style="width: 100px;">진행중</th>
            		<th style="width: 100px;">완료</th>
            		<th style="width: 100px;">지연</th>
            	</tr>
            	<tr class="todoTabletr" style="background-color: transparent;">
            		<td>${ todoW }</td>
            		<td>${ todoY }</td>
            		<td>${ todoO }</td>
            		<td> ${ todoL }</td>
            	</tr>
            </table>
        </div>
   
        <!-- 프로젝트별 현황 -->
       
        <div  class="statuslist">
            <h6 style="font-weight: bold;">프로젝트별 현황</h6>

            <table style="text-align: center; margin-top: 20px;" width="770px">
                <thead style="background-color:rgba(209, 189, 220, 0.7); border: none; font-size: 14px;" >
                    <tr>
                        <th width="220px">프로젝트명</th>
                        <th width="110px" style="color: rgb(248, 180, 32);">대기</th>
                        <th width="110px" style="color: rgb(91, 201, 139);">진행중</th>
                        <th width="110px" style="color: rgb(102, 172, 219);">완료</th>
                        <th width="110px" style="color: rgb(243, 130, 55);">지연</th>
                        <th width="110px">진행률</th>
                    </tr>
                </thead>
                <tbody>
                <!-- 업무 말고 프로젝트로 리스트를 가져와야될듯..? 셀렉문 다시 만들기 ! -->
              		<c:forEach var="c" items="${ count }">
                       <tr>
                        <th>${ c.prTitle }</th>
                        <td>${ c.wait } </td>
                        <td>${ c.yes }</td>
                        <td>${ c.ok }</td>
                        <td>${ c.late }</td>
                        <td>
                        <c:if test="${(c.yes+c.ok+c.late+c.wait) == 0}">
                        	0
                        </c:if>
                        <c:if test="${(c.yes+c.ok+c.late+c.wait) != 0}">
                        	<fmt:formatNumber value="${(c.ok/(c.yes+c.ok+c.late+c.wait))*100}" pattern="#,#0.0" /> %
                        </c:if>
                        </td>
                   	   </tr>
              		</c:forEach>
                </tbody>
            </table>
        </div>

        <!-- 업무 현황 -->
        <!-- 후 순위 페이징처리 -->
        <div class="todolist">
            <table>
                <h6 style="font-weight: bold;">업무</h6>

            <button id="deleteTd" class="button3" onclick="deleteTodo();">삭제</button>
            <button id="updateTodo" class="button2" onclick="updateTodo();">상태 변경</button>
                <table style="text-align: center; margin-top: 20px;" width="770px">
                    <thead style="background-color:rgba(209, 189, 220, 0.7); border: none; font-size: 14px;" >
                        <tr>
                            <th width="190px">프로젝트명</th>
                            <th width="280px">업무</th>
                            <th width="155px">상태</th>
                            <th width="155px">만기일</th>

                        </tr>
                    </thead>
                    <tbody>
          				<c:forEach var="t" items="${ list }">
	                        <tr>
	                            <td>${ t.prTitle }</td>
	                            <td>${ t.todoTitle }</td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${ t.status eq 'W'}">
	                            			대기
	                            		</c:when>
	                            		<c:when test="${ t.status eq 'Y'}">
	                            			진행중
	                            		</c:when>	                            		
	                            		<c:when test="${ t.status eq 'O'}">
	                            			완료
	                            		</c:when>
	                            		<c:when test="${ t.status eq 'L'}">
	                            			지연
	                            		</c:when>	                            		
	                            		<c:when test="${ t.status eq 'N'}">
	                            			삭제
	                            		</c:when>
	                            	</c:choose>
	                            	
	                            </td>
	                            <td>${ t.todoEnddate }</td>
	                        </tr>
	                    </c:forEach>
                    </tbody>
                </table>
            </table>

        </div>
   
    </div>
    </div>
    </div>
    </div>

</body>
</html>