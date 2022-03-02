<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!--FONT-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Gamja+Flower&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .emplManage {
    	color:black;
    }
    .middle{
        width:800px;
        height:800px;
    }
    #searchbar{
        width:300px;
    }
    table{
        text-align:center;
        width:800px;
    }
    .slideTogglebox {
     	width:100%;
     	height:300px;
     	font-weight:bold;
     	background-color:mistyrose;
    }
    .gj{
       font-family:'Gamja Flower', cursive;
       font-size:20px;
    }
    #hi{
	   font-size:60px;
	   text-align: center;
	   font-weight: bold;
	   color: rgb(147, 205, 207);
	   font-family: 'Anton', sans-serif;
       font-weight: bold;
       text-shadow: 1px 1px 1px black;
    }
    .selectBox{
    	margin-left:10px;
    	margin-bottom:50px;
    	float:left;
    }
    .serchForm{
    	float:left;
    }
    #keyword{
    	width:300px;
    	height:50px;
    	float:right;
    	border: 2px solid lightblue;
    	margin-right:10px;
    }
    /* IE 10, 11의 네이티브 화살표 숨기기 */ 
    select::-ms-expand { display: none; }  
    select { 
       width: 220px; /* 원하는 너비설정 */ 
       padding: .4em .5em; /* 여백으로 높이 설정 */ 
       font-family: inherit; /* 폰트 상속 */ 
       background: url(resources/images/profile/earth.png) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
       background-size:50px;
       border: 2px solid lightblue; 
       border-radius: 0px; /* iOS 둥근모서리 제거 */ 
       -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
       -moz-appearance: none; 
       appearance: none; 
    }
    tbody:hover {
    	cursor:pointer;
    }
</style>
</head>
<body>
	<!-- 공용 -->
    <div class="back">
    
    	<!-- 상단: 페이지헤더, 메뉴바 -->
        <div class="innerBack">
			<jsp:include page="../common/pageHeader.jsp" />
 			<jsp:include page="../common/adminMenu.jsp" />

		<!-- 왼쪽 : 사이드바 -->
	 		<br clear="both">
	 		<div style="position:relative">
				<jsp:include page="../common/sidebar.jsp" />
				<div class="cont">
		            <ul id="ac">
		                <li class="division">
		                    <a href="#">사원관리</a>
		                </li>
		                <div id="border">
		               	   <li class="menu1">
			                  <a href="addEmpForm.me">사원 초대</a>
			               </li>
			               <li class="menu1">
			                  <a href="delEmpForm.me">사원 계정 삭제</a>
			               </li>
			               <li class="menu1">
			                  <a href="appEmpForm.me">가입 승인/반려</a>
			               </li>
			               <li class="menu1">
			                  <a href="setEmpForm.me">직무/직위 관리</a>
			               </li>
			               <li class="menu1"  style="background:rgb(147, 205, 207);">
			                  <a href="depEmpForm.me" style="color:white;">부서별 사원 조회</a>
			               </li>
		            	</div>
		            </ul>
	         	</div>
			</div>
			
	    	<div class="mainOuter" id="mainOuter" style="font-family: 'Gowun Dodum', sans-serif; background:whitesmoke;">
			    
			    <br><br>
			    <p class="anton" style="font-style:italic;" id="hi">Employee Department</p> 	
			    <br><br><br>
			    
			    <div class="selectBox gj" style="font-size:23px;">
				<select name="dept_code" id="deptCode">
	               	<option selected value="All">전체 사원</option>
	               	<option value="D1">대표이사</option>
	               	<option value="D2">경영지원부</option>
		            <option value="D3">영업부</option>
		            <option value="D4">재무부</option>
		            <option value="D5">광고홍보부</option>
		            <option value="D6">IT전략부</option>
		            <option value="D7">CS</option>
		            <option value="D0">미정</option>
		        </select> 
		        </div>
		        
		        <div id="searchForm">
                    <input type="text" id="keyword" name="empName" placeholder="회원의 이름을 검색하세요">
                </div>      
	
		       <!-- 테이블 -->
		       <table class="table table-hover gj" id="tableArea">
	            	<thead>
		            	<tr>
		                    <th width="100px"><img src="resources/images/profile/starr.png" width=40 height=30></th>
		                    <th width="100px">이름</th>
		                    <th width="100px">아이디</th>
		                    <th width="150px">번호</th>
		                    <th width="150px">이메일</th>
		                    <th width="100px">부서</th>
		                    <th width="150px">팀</th>
		                    <th width="100px">직급</th>
		                </tr>
	            	</thead>
	                <tbody>
	                	<c:forEach var="e" items="${ list }">
					            <tr>
			                		<input type="hidden" value="${ e.empNo }">
						        	<td><img src="resources/images/profile/star.png" width=20 height=20></td>
									<td>${ e.empName }</td>
									<td>${ e.empId }</td>
									<td>${ e.phone }</td>
									<td>${ e.email }</td>
									<td>${ e.deptName }</td>
									<td>${ e.teamName }</td>
									<td>${ e.jobName }</td>
				                </tr>		
		                </c:forEach>
	                </tbody>
	            </table>
	            
	            
	        </div> <%-- mainOuter --%>         

        </div><%-- innerback --%>

    </div><%-- back --%>
    
    <script>

	    $(document).on('click', '#tableArea tbody tr', function(){

	        var empNo = $(this).children().eq(0).val(); // 현재 클릭된 셀
	        //console.log('ㅎㅇ');
	        //console.log(empNo);
	        location.href=''
	    
	    });
	    


    	// 검색
	    $("#keyword").keyup(function() {
            	var k = $(this).val();
            	$("#tableArea > tbody > tr").hide();
            	var temp = $("#tableArea > tbody > tr > td:nth-child(5n+3):contains('" + k + "')");
                $(temp).parent().show();
        });
    	

    	// 부서별 select
	    $("#deptCode").change(function(){
	    	var deptCode = $("#deptCode")[0].value;
	       
	    	$.ajax({
	            url: "getEmpListByDept",
	            data:{
	            	deptCode: deptCode
	            },
	            success:function(result){
	            	$('#tableArea>tbody')[0].innerHTML = '';
	      			if(result.length != 0){
	      				for(var i=0; i<result.length; i++){
	      					var employee = result[i];
							var empNo = employee.empNo;
							var empName = employee.empName;
							var empId = employee.empId;
							var phone = employee.phone;
							var email = employee.email;
							var deptName = employee.deptName;
							var teamName = employee.teamName;	
							var jobName = employee.jobName;
							
							var input ='<input type="hidden" value="' + empNo + '">'
							
							$('#tableArea>tbody')[0].innerHTML += input;
							
							var tr = '<tr>';
							    tr += '<input type="hidden" value="' +  empNo + '">';
								tr += '<td><img src="resources/images/profile/star.png" width=20 height=20></td>';
								tr += '<td>' + empName+'</td>';
								tr += '<td>' + empId+'</td>';
								tr += '<td>' + phone+'</td>';
								tr += '<td>' + email+'</td>';
								tr += '<td>' + deptName+'</td>';
								tr += '<td>' + teamName+'</td>';
								tr += '<td>' + jobName+'</td>';
								tr += '</tr>';
							
							$('#tableArea>tbody')[0].innerHTML += tr;
	      					
	      				}
	      			}
	            	
	             },
	             error:function(result){
	            	console.error("ajax 통신 실패");
		         }
	    	});
	    
	       
	        
	    });
    
    
    
    </script>
    

</body>
</html>