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
        height:500px;
    }
   .emplManage {
    	color:black;
    }
   #hi{
	   font-size:45px;
	   text-align: center;
	   font-weight: bold;
	   color: rgb(147, 205, 207);
    }
    .anton{
        font-family: 'Anton', sans-serif;
        font-size:35px;
        font-weight: bold;
        text-shadow: 1px 1px 1px black;
    }
    input {
    	display:flex;
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
        .clickHere {
        width:150px;
        margin: auto;
        display:block;
        padding: 0;
        box-sizing: border-box;
        border: none;
        padding: 15px 30px;
        border-radius: 15px;
        font-family: 'Anton', sans-serif;
        font-size: 20px;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        text-decoration: none;
        font-weight: 600;
        transition: 0.25s;
        background-color: #77af9c;
        color: #d7fff1;        
    }
    .clickHere:hover {
        transform: scale(1.2);
    }
    #clearBtn{
    	background:plum;
    	color:rgb(240, 195, 237);
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
		               <li class="menu1" style="background:rgb(147, 205, 207);">
		                  <a href="addEmpForm.me" style="color:white;">사원 추가</a>
		               </li>
		               <li class="menu1">
		                  <a href="appEmpForm.me">가입 승인</a>
		               </li>
		               <li class="menu1">
		                  <a href="setEmpForm.me">직위/직무 관리</a>
		               </li>
		               <li class="menu1">
		                  <a href="delEmpForm.me">사원 계정 삭제</a>
		               </li>
            	</div>
            </ul>
         	</div>
		</div>
		
		<%-- 로딩 이미지 --%>
	    <div class="loading display-none">
	    	<div style="text-align:center;"><img src="resources/images/loadImg.gif"/></div>
	    </div>
		
		<div class="mainOuter" id="mainOuter" style="font-family: 'Gowun Dodum', sans-serif;">
			  	<br><br><br>
        	    <p class="anton" style="font-style:italic;" id="hi">Envite Employee</p>
		        <br><br>
        	    <div style="margin-left:150px;">

	        		<input type="text" id="inviteMail" placeholder="잇트라넷에 초대할 사원의 이메일을 형식에 맞게 입력하세요 (예:admin@ittr.com)" onfocus="this.placeholder = ''" onblur="this.placeholder='잇트라넷에 초대할 사원의 이메일을 형식에 맞게 입력하세요 (예:admin@ittr.com)'" style="width:85%;"><br><br>
	        		<br>
	        		
	        		<div class="btns" style="margin-left:350px;">
			        	<div style="float:left; margin-right:30px;">
				        	<button class="clickHere" style="width:100px;" id="invteBtn" type="button" onclick="inviteSubmit();">초대</button>			        	
			        	</div>
			        	<div style="float:left; margin:auto;">
				        	<button class="clickHere" style="width:100px;" id="clearBtn" type="reset">취소</button> 
			        	</div>
       				</div>

	        	</div>
			        
        	  </div> <%-- mainOuter --%>         

        </div><%-- innerback --%>

    </div><%-- back --%>
    
    <script>
    	function inviteSubmit(){
    		const inviteMail = $("#inviteMail").val();
    		const regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
    		
    		if(!inviteMail) {
    			Swal.fire({
	       			  icon: 'error',
	       			  title: 'Oops...',
	       			  text: '이메일 주소를 입력해주세요!'
	       			});
    		}else if(!regEmail.test(inviteMail)){
    			Swal.fire({
         			  icon: 'error',
         			  title: 'Oops...',
         			  text: '유효한 형식의 메일을 입력해주세요!'
         			});
    		}else { 
    			$.ajax({
	    			url:"addEmp.me",
	    			data:{inviteMail:inviteMail},
	    			success:function(result){
	    				
	    				console.log(result);
	    				
	    				if(result == "success") {
	    					Swal.fire({
	  						  icon: 'success',
	  						  title: '가입 초대 메일 발송 성공!'
	  						});
	    					$("#inviteMail").val("");
	    				}else {
	    					Swal.fire({
	  						  icon: 'question',
	  						  title: '메일 발송에 실패하였습니다',
	  						  text: '메일을 다시 확인해주세요!'
	  						});
	    				}
	    			}, beforeSend:function(){
	    				$('.loading').removeClass('display-none');
	    			}, complete:function(){
	    				$('.loading').addClass('display-none');
	    			}, error:function(){
	    				console.log("ajax통신 실패");
	    			}
	    		})
    		}
    	}
    </script>
</body>
</html>