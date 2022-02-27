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
	.wrap{
        width: 900px;
    }
    #mainOuter{
        width:1200px;
        height:550px;
    }
    #hi{
        font-size:45px;
        text-align: center;
        font-weight: bold;
        color: rgb(191, 177, 241);
    }
    .anton{
        font-family: 'Anton', sans-serif;
        font-size:35px;
        font-weight: bold;
        text-shadow: 1px 1px 1px black;
    }
    input {
        width: 100%;
        height: 50px;
        font-size: 20px;
        border: none;
        border-radius: 10px;
        padding-left: 15px;
        outline: none;
        background-color: rgb(233, 233, 233);
    }
    input:focus{
        outline: 2px solid rgba(26, 161, 120, 0.692);
        font-size: 20px;
        border-radius: 10px;
        padding-left: 15px;
        background-color: white;
    }
    #showPwd {
    	color : gray;
   	}
    #showPwd:hover {
    	cursor: pointer;
    	color : black;
    }
    #click {
        width:150px;
        /*margin: auto;*/
        margin-left:300px;
        display:block;
        padding: 0;
        box-sizing: border-box;
        border: none;
        padding: 15px 30px;
        border-radius: 15px;
        font-family: 'Anton', sans-serif;
        font-size: 30px;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        text-decoration: none;
        font-weight: 600;
        transition: 0.25s;
        background-color: #77af9c;
        color: #d7fff1;        
    }
    #click:hover {
        transform: scale(1.2);
    }
    #click:hover::after {
        content: "";
        width: 30px;
        height: 30px;
        border-radius: 100%;
        border: 6px solid #00ffcb;
        position: absolute;
        z-index: -1;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        animation: ring 1.5s infinite;
    }
    @import url('https://fonts.googleapis.com/css2?family=Anton&display=swap');
    @keyframes ring {
        0% {
	        width: 30px;
	        height: 30px;
	        opacity: 1;
	    }
        100% {
            width: 300px;
            height: 300px;
            opacity: 0;
        }
    }
</style>
</head>
<body>
	
	<div class="back">
	
		<div class="innerBack">
		
			<jsp:include page="../common/pageHeader.jsp" />
			
			<c:choose>
				<c:when test="${ loginUser.empNo eq '1' }">
					<jsp:include page="../common/adminMenu.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:include page="../common/userMenu.jsp" />
				</c:otherwise>
			</c:choose>
			
			<br clear="both">
 			<div style="position:relative">
				<jsp:include page="../common/sidebar.jsp" />
				<div class="cont">
		            <ul id="ac">
		            
		                <li class="division">
		                    <a href="#">마이페이지</a>
		                </li>
		                <div id="border">
			               <li class="menu1">
			                  <a href="myPage.me">내 정보</a>
			               </li>
			               <li class="menu1" style="background:rgb(147, 205, 207);">
			                  <a href="setPwdForm.me" style="color:white;">비밀번호 변경</a>
			               </li>
				        </div>
				        
				     </ul>
			     </div> <%-- cont --%>
			  </div> <%-- relative --%>
			  
			  <div class="mainOuter" id="mainOuter" style="font-family: 'Gowun Dodum', sans-serif;">
			  	<br><br>
        	    <p class="anton" style="font-style:italic;" id="hi">Change Password</p>
        	    <br><br>
        	    <div style="margin-left:250px;">
        	    
        	    	현재 비밀번호 : 
	        		<input type="password" class="input-form" id="nowPwd" style="width: 55%;">
	        		<button type="button" class="btn btn-info" onclick="checkPwd();">확인</button>
	        		<div id="checkPwd" style="font-size:0.8em; display:none"></div>
	        		<br><br>
	        		
	        		<form action="setPwd.me" name="pwdForm">
		        		새 비밀번호 : 
		        		<input type="password" class="input-form newPwd" id="empPwd" name="empPwd" style="width: 63%;" disabled><br><br>
		        		&nbsp;<i class="fas fa-check" id="showPwd" style="margin-left:550px;">새 비밀번호 확인</i>
		        		<br>
		        		<input type="hidden" name="empNo" value="${ loginUser.empNo }"><br>
		        		<button id="click" class="newPwd" type="button" onclick="pwdSubmit();" disabled>CHANGE!</button>
	        		</form>
	        		
	        	</div>
	        	<br><br>	
        	  </div> <%-- mainOuter --%>
			
		</div> <%-- innerBack --%>
	
	</div> <%-- back --%>
	
	<script>
		$(function(){
			
			// *** 비밀번호 확인 ***
			$('#showPwd').hover(function(){
				$('#empPwd').attr('type','text');
			}, function(){
				$('#empPwd').attr('type','password');
			});	
			
		}); // 달러펑션
		
		// *** 현재 비밀번호 확인 버튼 ***
		function checkPwd() {
			const $nowPwd = $("#nowPwd");
			
			$.ajax({
				url:"nowPwdCheck.me",
				data:{checkPwd:$nowPwd.val()},
				success:function(result){
					console.log(result);
					if(result == "PASS") {
						$("#checkPwd").show();
						$("#checkPwd").css("color", "green").text("이제 비밀번호 변경이 가능합니다!");
						$(".newPwd").removeAttr("disabled");
					}else {
						$("#checkPwd").show();
						$("#checkPwd").css("color", "red").text("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
					}
					
				},error:function(){
					console.log("현재 비밀번호 체크용 ajax통신 실패")
				}
			})
		};
	   	
		// *** 비밀번호 변경 버튼 => 비밀번호 변경 ***
		function pwdSubmit(){
			
			var pwdForm = document.pwdForm; // form
			const empPwd = pwdForm.empPwd.value; // 입력한 새 비밀번호 값
			const regPwd = /^[a-z\d!@#$%^&*]{4,16}$/i; // 유효성 검사
			
			if(!empPwd){
				$("[name=empPwd]").focus();
        		Swal.fire({
       			  icon: 'error',
       			  title: 'Oops...',
       			  text: '비밀번호를 입력해주세요!'
       			});
			}else if(!regPwd.test(empPwd)) {
				$("[name=empPwd]").focus();
        		Swal.fire({
       			  icon: 'error',
       			  title: 'Oops...',
       			  text: '유효한 형식의 비밀번호를 입력해주세요!'
       			});
			}else {
				pwdForm.submit();  
			}
			
		};
	</script>

</body>
</html>