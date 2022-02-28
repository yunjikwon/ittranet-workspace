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
   .loading {
	    position: fixed;
	    left:0;
	    right:0;
	    top:20%;
	    bottom:80%;
	    background: rgba(0,0,0,0.2);
	}
    .display-none{
        display:none;
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
	               <li class="menu1">
	                  <a href="delEmpForm.me">사원 계정 삭제</a>
	               </li>
	               <li class="menu1" style="background:rgb(147, 205, 207);">
	                  <a href="appEmpForm.me" style="color:white;">가입 승인/반려</a>
	               </li>
	               <li class="menu1">
	                  <a href="setEmpForm.me">직무/직위 관리</a>
	               </li>
            	</div>
            </ul>
         	</div>
         	
         	<%-- 로딩 이미지 --%>
		    <div class="loading display-none">
		    	<div style="text-align:center;"><img src="resources/images/loadImg.gif"/></div>
		    </div>
         	
         	<div class="mainOuter" id="mainOuter" style="height:800px; font-family: 'Gowun Dodum', sans-serif; background:whitesmoke;">
			  	<br><br>
        	    <p class="anton" style="font-style:italic;" id="hi">Approval Employee</p>
		        <br><br>

		        
		        <div class="buttonbar">
		        	<button type="button" class="btn btn-outline-info" id="approvalBtn">승인</button>
		            <button type="button" class="btn btn-outline-danger" id="disapprovalBtn">반려</button>
		        </div>

		        <br><br>
		        <div align="center">
		 
		            <table class="table table-striped table-hover" id="tableArea"> 
		            	<thead>
			            	<tr>
			                    <th width="50px"><input type="checkbox" id="allCheck"></th>
			                    <th width="100px">이름</th>
			                    <th width="250px">아이디</th>
			                    <th width="250px">이메일</th>
			                    <th width="150px">부서-팀</th>
			                    <th width="150px">직급</th>
			                </tr>
		            	</thead>
		                <tbody>
	                		<c:choose>
	                			<c:when test="${ empty wlist }">
	                				<td colspan="6">승인 대기중인 회원이 없습니다.</td>
	                			</c:when>
	                			<c:otherwise>
	                			<c:forEach var="w" items="${ wlist }">
		                			<input type="hidden" value="${ w.empNo }">
					                <tr>
					                    <td><input type="checkbox" class="checkEmp"></td>
					                    <td>${ w.empName }</td>
					                    <td>${ w.empId }</td>
					                    <td>${ w.email }</td>
					                    <td>
						                    <select name="dept_code">
						                    	<option selected value="D0-T00">미정</option>
						                    	<option value="D2-T00">경영지원부-미정</option>
									            <option value="D2-T02">경영지원부-총무팀</option>
									            <option value="D2-T03">경영지원부-인사팀</option>
									            <option value="D3-T00">영업부-미정</option>
									            <option value="D3-T04">영업부-영업팀</option>
									            <option value="D3-T05">영업부-영업관리팀</option>
									            <option value="D4-T00">재무부-미정</option>
									            <option value="D4-T06">재무부-구매팀</option>
									            <option value="D4-T07">재무부-회계팀</option>
									            <option value="D5-T00">광고홍보부-미정</option>
									            <option value="D5-T08">광고홍보부-홍보마케팅팀</option>
									            <option value="D5-T09">광고홍보부-기획팀</option>
									            <option value="D5-T10">광고홍보부-디자인팀</option>
									            <option value="D6-T00">IT전략부-미정</option>
									            <option value="D6-T11">IT전략부-개발팀</option>
									            <option value="D6-T12">IT전략부-솔루션제작팀</option>
									            <option value="D6-T13">IT전략부-서버운영팀</option>
									            <option value="D6-T14">IT전략부-보안팀</option>
									            <option value="D7-T00">CS-미정</option>
									            <option value="D7-T15">CS-지원팀</option>
									            <option selected value="D0-T00">미정</option>
									        </select>
					              		</td>
					                    <td>
						                    <select name="job_code">
									            <option value="J2">부장</option>
									            <option value="J3">팀장</option>
									            <option value="J4">과장</option>
									            <option value="J5">대리</option>
									            <option value="J6">주임</option>
									            <option value="J7">사원</option>
									            <option value="J8">인턴</option>
									            <option selected value="J0">미정</option>
									        </select>
					              		</td>
					                </tr>
					                </c:forEach>
	                			</c:otherwise>
	                		</c:choose>     
		                </tbody>
		            </table>

				</div>
				<br><br>
				
        	    <div id="pagingArea">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#" style="display:none">◀</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="appEmpForm.me?cpage=${ pi.currentPage-1 }" style="color:rgb(147, 205, 207);">◀</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    <c:choose>
	                    	<c:when test="${ p eq pi.currentPage }">
	                    		<li class="page-item"><a class="page-link" href="appEmpForm.me?cpage=${ p }" style="background:rgb(147, 205, 207); color:white;">${ p }</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="appEmpForm.me?cpage=${ p }" style="color:rgb(147, 205, 207);">${ p }</a></li>
	                    	</c:otherwise>
	                    </c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#" style="display:none">▶</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="appEmpForm.me?cpage=${ pi.currentPage+1 }" style="color:rgb(147, 205, 207);">▶</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                </ul>
            	</div>
			        
        	  </div> <%-- mainOuter --%>         

        </div><%-- innerback --%>

    </div><%-- back --%>
    
    <script>   
    
    	// *** 전체 선택 ***
		$("#allCheck").click(function(){
	        if($(this).is(":checked")){
	            $(":checkbox", $("#tableArea")).prop("checked", true);
	        }else {
	            $(":checkbox", $("#tableArea")).prop("checked", false);
	        }
	    });	
		
		// *** 선택된 회원 정보 (승인 버튼 눌렀을 시) ***
		$("#approvalBtn").click(function(){
			var empArray = [] // 다중선택된 회원을 담을 배열
			var rows = document.getElementById('tableArea').getElementsByTagName('tr');
			
			for(var i=1; i<rows.length; i++){
				var row = rows[i];
				// var empNo = $(row).prev()[0].value;
				
				var tds = row.getElementsByTagName('td');

				if($(tds[0]).children()[0].checked){
					var obj = {
						empNo: $(row).prev()[0].value,
						empName: $(tds[1]).text(),
						empId: $(tds[2]).text(),
						email: $(tds[3]).text(),
						deptCode: $(tds[4]).children()[0].value.substring(0,2),
						teamCode: $(tds[4]).children()[0].value.substring(3,6),
						jobCode: $(tds[5]).children()[0].value
					}
					empArray.push(obj);
				} // if
				
			} // for
			
			// console.log('선택한 회원 : ', empArray);
			
			if(empArray.length == 0){
				Swal.fire({
	      			  icon: 'warning',
	      			  title: '승인할 회원을 선택해주세요!'
		      		});
				return;
			}else {
				for(var i = 0; i < empArray.length; i++){
					  (function(i) {
					            $.ajax({
					            url: "appEmp.me",
					            data:{
					            	empNo:empArray[i].empNo,
					            	empName:empArray[i].empName,
					            	empId:empArray[i].empId,
					            	email:empArray[i].email,
					            	deptCode:empArray[i].deptCode,
					            	teamCode:empArray[i].teamCode,
					            	jobCode:empArray[i].jobCode
					            },
					            success:function(result){
					            	
					            	console.log(result);
					            	
					            	if(result == "PASS") {
					            		
					            		document.location.reload();
					            		
					            		// document.location.reload();
				          				
			          				}
					             }, beforeSend:function(){
					    				$('.loading').removeClass('display-none');
					    			}, complete:function(){
					    				$('.loading').addClass('display-none');
					    			}, error:function(){
					    				console.log("ajax통신 실패");
					    			}
					        });
					    })(i);
					  
						Swal.fire({
							  icon: 'success',
			      			  title: '가입 승인 메일을 발송합니다',
			      			  confirmButtonText: 'Ok'
			      			});
					  
					} // for
				
			} // else	

	    });	// 클릭이벤트
		
		// *** 반려 버튼 눌렀을 시 ***
		$("#disapprovalBtn").click(function(){
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
	      			  title: '반려할 회원을 선택해주세요!'
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
					            			  title: '반려 완료!',
					            			  confirmButtonText: 'Ok'
					            			}).then((result) => {
					            			  if (result.isConfirmed) {
					            				  document.location.reload();
					            			  } 
					            			});

			          				}
					             }, beforeSend:function(){
					    				$('.loading').removeClass('display-none');
					    			}, complete:function(){
					    				$('.loading').addClass('display-none');
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