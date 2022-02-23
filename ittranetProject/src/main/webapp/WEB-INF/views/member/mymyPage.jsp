<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 다음주소API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
           height:auto;
          }
    /*여기부터*/
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
    .disabl{
    	color:rgb(240, 195, 237);
    }
    .abl{
    	color:rgb(181, 211, 236);
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
    .modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 600px;
        height: 500px;
        padding: 40px;
        text-align: center;
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
        transform: translateX(-50%) translateY(-50%);
        background-image: url('resources/images/backImg.jpg');
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
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
			               <li class="menu1" style="background:rgb(147, 205, 207);">
			                  <a href="myPage.me" style="color:white;">내 정보</a>
			               </li>
			               <li class="menu1">
			                  <a href="setPwdForm.me">비밀번호 변경</a>
			               </li>
				        </div>
				        
				     </ul>
			     </div> <%-- cont --%>
			  </div> <%-- relative --%>
			  
			  <div class="mainOuter" id="mainOuter" style="font-family: 'Gowun Dodum', sans-serif;">
			  	<br><br>
        	    <p class="anton" style="font-style:italic;" id="hi">My! Page</p>
        	    
		        <form name="updateForm" id="updateForm" action="update.me" method="post">
		        	<p class="anton abl">&nbsp;Profile</p>
		        	<div id="profileZone" style="border:1px solid black;">
		        		프로필 자리
		        	</div>
		        	<br>
			        <p class="anton disabl">&nbsp;ID</p>
			        <input type="text" class="input-form" id="empId" name="empId" value="${ loginUser.empId }" readonly>
			        <br>
			        <p class="anton abl">&nbsp;Name</p>
			        <input type="text" class="input-form" id="empName" name="empName" value="${ loginUser.empName }">
			        <br>
			        <p class="anton abl">&nbsp;Email</p>
			        <input type="text" class="input-form" id="email" name="email" value="${ loginUser.email }">
			        <br>
			        <p class="anton abl">&nbsp;Phone</p>
			        <input type="text" class="input-form" id="phone" name="phone" value="${ loginUser.phone }">
			        <br>
			        <p class="anton disabl">&nbsp;Department (부서)</p>
			        <input type="text" class="input-form" id="deptName" name="deptName" value="${ loginUser.deptName }" readonly>
			        <br>
			        <p class="anton disabl">&nbsp;Team (팀)</p>
			        <input type="text" class="input-form" id="teamName" name="teamName" value="${ loginUser.teamName }" readonly>
			        <br>
			        <p class="anton disabl">&nbsp;Job (직급)</p>
			        <input type="text" class="input-form" id="jobName" name="jobName" value="${ loginUser.jobName }" readonly>
			        <br>
			        <p class="anton abl">&nbsp;Address</p>
			        <input type="text" class="input-form" id="address" name="address" value="${ loginUser.address }" style="width: 80%; display: inline;" readonly>
			        &nbsp;<button type="button" class="btn btn-info btn-open-popup">주소 변경</button><br>
			        <br>
			        <div class="btns" style="margin-left:500px;">
			        	<div style="float:left; margin-right:30px;">
				        	<button class="clickHere" style="width:100px;" id="updClick" type="submit" onclick="updateMe();">수정</button>			        	
			        	</div>
			        	<div style="float:left; margin:auto;">
				        	<button class="clickHere" style="width:100px; " id="delClick" type="button" onclick="deleteMe();">탈퇴</button> 
			        	</div>
       				</div>
       				<br><br><br><br><br>
		        </form>
		        
		        <%-- 주소변경 모달창 --%>
		        <div class="modal"> 
		        	<div class="modal_body">
		        		<p class="anton" style="font-size:50px; color:whitesmoke;">Change of Address</p><br>
		        		<input class="input-form" style="width:60%; float:left; display:inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly">
				        <button type="button" class="btn btn-info" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button><br><br>
				        <input class="input-form" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly"/><br>
				        <input class="input-form" placeholder="상세주소" name="addr3" id="addr3" type="text"/><br><br>
				        <button class="clickHere" type="button" style="font-size: 30px;" onclick="updateAddress();">CLICK!</button>
		        	</div> 
		        </div>

		        
		        
        	  </div> <%-- mainOuter --%>
			
		</div> <%-- innerBack --%>
	
	</div> <%-- back --%>
	
	<script>
	    const body = document.querySelector('body');
	    const modal = document.querySelector('.modal');
	    const btnOpenPopup = document.querySelector('.btn-open-popup');
	
	    btnOpenPopup.addEventListener('click', () => {
	      modal.classList.toggle('show');
	
	      if (modal.classList.contains('show')) {
	        body.style.overflow = 'hidden';
	      }
	    });
	
	    modal.addEventListener('click', (event) => {
	      if (event.target === modal) {
	        modal.classList.toggle('show');
	
	        if (!modal.classList.contains('show')) {
	          body.style.overflow = 'auto';
	        }
	      }
	    });

		// *** 우편번호 ***
		function execPostCode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	               var fullRoadAddr = data.roadAddress;
	               var extraRoadAddr = '';
	               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                   extraRoadAddr += data.bname;
	               }               
	               if(data.buildingName !== '' && data.apartment === 'Y'){
	                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	               }              
	               if(extraRoadAddr !== ''){
	                   extraRoadAddr = ' (' + extraRoadAddr + ')';
	               }
	               if(fullRoadAddr !== ''){
	                   fullRoadAddr += extraRoadAddr;
	               }
	               $("[name=addr1]").val(data.zonecode);
	               $("[name=addr2]").val(fullRoadAddr);
	               $("[name=addr3]").focus(); 
	           	}
	        	}).open();
	   		};
	   	
	   	// *** 주소 변경 ***
	   	function updateAddress() {
	   		const addr1 = $("#addr1").val();
	   		console.log(addr1);
	   		const addr2 = $("#addr2").val();
	   		console.log(addr2);
	   		const addr3 = $("#addr3").val();
	   		console.log(addr3);
	   		const address = "[" + addr1 +"] " + addr2 + " " + addr3;
	   			
	   		$("#address").val(address);
	   		
	   		Swal.fire({
   			  icon: 'success',
   			  title: '주소 변경 완료!',
   			  text: '페이지의 수정 버튼을 눌러주세요!'
   			});
	   		
	   		modal.style.display="none";
	   		body.style.overflow = 'auto';
	   		
	   	};
	   	
	   	
	</script>

</body>
</html>