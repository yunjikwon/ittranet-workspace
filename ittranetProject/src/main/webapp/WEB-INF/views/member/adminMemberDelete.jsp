<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!--FONT-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .emplManage {
    	color:black;
    }
    .buttonbar{
        float:right;
        margin-right:10px;
        height:100px;
    }
    table{
        text-align:center;
        width:800px;
    }
    #pagingArea{
    	margin-left:500px;
    }
    #hi{
		font-family: 'Anton', sans-serif;
		font-weight: bold;
		text-shadow: 1px 1px 1px black;
		font-size:60px;
		text-align: center;
		font-weight: bold;
		color: rgb(147, 205, 207);
    }

    #searchbar{
        width:300px;
    }
    table{
        text-align:center;
        width:800px;
    }
    #searchForm{
        margin:auto;
        height:100px;
        float:right;
    }
    #searchForm>*{
        float:left;
        margin:5px;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
	               <li class="menu1" style="background:rgb(147, 205, 207);">
	                  <a href="delEmpForm.me" style="color:white;" onclick="selectEmpList();">사원 계정 삭제</a>
	               </li>
	               <li class="menu1">
	                  <a href="appEmpForm.me">가입 승인/반려</a>
	               </li>
	               <li class="menu1">
	                  <a href="setEmpForm.me">직무/직위 관리</a>
	               </li>
            	</div>
            </ul>
         	</div>
         	
         	<div class="mainOuter" id="mainOuter" style="font-family: 'Gowun Dodum', sans-serif; background:whitesmoke;">
			  	<br><br><br><br>
        	    <p class="anton" style="font-style:italic;" id="hi">Delete Employee</p>
		        <br><br>
		        
		        <%-- 검색 & 삭제버튼 --%>
                <div id="searchForm">
                    <input type="text" class="form-control" id="keyword" name="empName" style="width:300px;" placeholder="삭제할 회원의 이름을 검색하세요">
                	<button type="button" class="btn btn-outline-danger" id="delMemBtn">삭제</button>
                </div>

				
				<%-- 테이블 --%>
		        <br><br><br>
		        <div align="center">
		        	
		        	<%-- table --%>
		            <table class="table table-hover" id="tableArea">
		            	<thead>
			            	<tr>
			                    <th width="50px">check</th>
			                    <th width="100px">이름</th>
			                    <th width="100px">아이디</th>
			                    <th width="150px">번호</th>
			                    <th width="250px">이메일</th>
			                    <th width="150px">부서</th>
			                    <th width="150px">팀</th>
			                    <th width="150px">직급</th>
			                </tr>
		            	</thead>
		                <tbody>
		                	<c:forEach var="e" items="${ list }">
		                		<input type="hidden" value="${ e.empNo }">
				                <tr>
									<td><input type="checkbox"></td>
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
				</div>
				<br><br><br><br>
        
        	  </div> <%-- mainOuter --%>         

        </div><%-- innerback --%>

    </div><%-- back --%>
    
    <script>
    	// *** 검색창 keyup ***
		$(document).ready(function() {
            $("#keyword").keyup(function() {
            	var k = $(this).val();
            	$("#tableArea > tbody > tr").hide();
            	var temp = $("#tableArea > tbody > tr > td:nth-child(5n+2):contains('" + k + "')");
                $(temp).parent().show();
            })
        });
    	
    	// *** 계정 삭제 버튼 클릭 ***
    	$("#delMemBtn").click(function(){
			var delArray = [] 
			var rows = document.getElementById('tableArea').getElementsByTagName('tr');
			
			for(var i=1; i<rows.length; i++){
				
				var row = rows[i];
				var tds = row.getElementsByTagName('td');

				if($(tds[0]).children()[0].checked){
					var obj = {
						empNo: $(row).prev()[0].value
					}
					delArray.push(obj);
				}
			}
			
			if(delArray.length == 0){
				Swal.fire({
	      			  icon: 'warning',
	      			  title: '삭제할 회원 계정을 선택해주세요!'
		      		});
				return;
			}else {
				for(var i = 0; i < delArray.length; i++){
					  (function(i) {
					            $.ajax({
					            url: "delEmps.me",
					            data:{
					            	empNo:delArray[i].empNo
					            },
					            success:function(result){
					            	
					            	console.log(result);
					            	
					            	if(result == "PASS") {
					            		
					            		
					            		Swal.fire({
					            			  title: '삭제 완료!',
					            			  confirmButtonText: 'Ok'
					            			}).then((result) => {
					            			  if (result.isConfirmed) {
					            				  document.location.reload();
					            			  } 
					            			});

			          				}
					             }, error:function(){
					    				console.log("ajax통신 실패");
					    			}
					        });
					    })(i);
					}
			}	

	    });	
    	
    	
	</script>
	
	

</body>
</html>