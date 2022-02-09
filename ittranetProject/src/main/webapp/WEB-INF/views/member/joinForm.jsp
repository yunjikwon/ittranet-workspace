<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 다음주소API -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- jQuery 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 부트스트랩에서 제공하고 있는 스타일 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<!-- alert창 꾸미기 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<!-- 아이콘 -->
	<script src="https://kit.fontawesome.com/07e0557a32.js" crossorigin="anonymous"></script>
    <!--FONT-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
<style>
    body { 
        background-image: url('resources/images/backImg.jpg');
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        width: 100vw;
        height: 100%;
    }
    .content{
        border:none;
        width:500px;
        margin:auto;
    }
    #hi{
        font-size:60px;
        text-align: center;
        font-weight: bold;
    }
    .anton{
        font-family: 'Anton', sans-serif;
        font-size:45px;
        font-weight: bold;
        color: whitesmoke;
        text-shadow: 1px 1px 1px gray;
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
    #click {
        width:150px;
        margin: auto;
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
    #checkPwd {
    	color : gray;
   	}
    #checkPwd:hover {
    	cursor: pointer;
    	color : black;
    }
</style>
</head>
<body>
    
    <div class="content">
        <br><br><br>
        <p class="anton" style="font-style:italic;" id="hi">JOIN IT!tranet</p>
        <br>
        <form name="joinForm" action="join.me" method="post">
	        <p class="anton">NAME</p>
	        <input type="text" class="input-form" id="empName" name="empName" placeholder="한글 성명 2자 이상 15자 이하" onfocus="this.placeholder = ''" onblur="this.placeholder='한글 성명 2자 이상 15자 이하'" required><br>
	        <br>
	        <p class="anton">E-MAIL</p>
	        <input type="text" class="input-form" id="email" name="email" placeholder="가입 링크를 받은 메일 주소 입력(@포함)" onfocus="this.placeholder = ''" onblur="this.placeholder='가입 링크를 받은 메일 주소 입력(@포함)'" required><br>
	        <br>
	        <p class="anton">ID</p>
	        <input type="text" class="input-form" id="empId" name="empId" placeholder="영소문자, 숫자 조합 4~12글자" onfocus="this.placeholder = ''" onblur="this.placeholder='영소문자, 숫자 조합 4~12글자'" required><br>
	        <br>
	        <p class="anton">PASSWORD</p>
	        &nbsp;<i id="checkPwd" class="fas fa-check">비밀번호확인</i>
	        <input type="password" class="input-form" id="empPwd" name="empPwd" placeholder="영문,숫자,특문(!@#$%^&*)조합 8~16글자" onfocus="this.placeholder = ''" onblur="this.placeholder='영문,숫자,특문(!@#$%^&*)조합 8~16글자'" required><br>
	        <br>
	        <p class="anton">PHONE</p>
	        <input type="text" class="input-form" id="phone" name="phone" placeholder="-포함 13자리 핸드폰 번호 입력(000-0000-0000)" onfocus="this.placeholder = ''" onblur="this.placeholder='-포함 13자리 핸드폰 번호 입력(000-0000-0000)'" required><br>
	        <br>
	        <p class="anton">ADDRESS</p>                  
	        <input class="input-form" style="width: 60%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly">&nbsp;
	        <button type="button" class="btn btn-info" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button><br><br>
	        <input class="input-form" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly"/><br><br>
	        <input class="input-form" placeholder="상세주소" name="addr3" id="addr3" type="text"/><br>
	        <input type="hidden" name="address"/>
	        <br>
	        <button id="click" type="button" onclick="joinSubmit();">CLICK!</button>         
        </form>
        <br><br><br><br><br><br><br>
    </div>
    
    <script>
    	// 비밀번호 확인
		$(document).ready(function(){
			$('.content i').hover(function(){
				$('#empPwd').attr('type','text');
			}, function(){
				$('#empPwd').attr('type','password');
			})
		});
    
    	// 주소 api
        function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                // console.log(data.zonecode);
                // console.log(fullRoadAddr);
                
                $("[name=addr1]").val(data.zonecode);
                $("[name=addr2]").val(fullRoadAddr);
                $("[name=addr3]").focus(); // 상세주소로 focus
            	}
         	}).open();
    	};
        
        // 회원가입 submit
        function joinSubmit(){
        	var joinForm = document.joinForm;
        	var empName = joinForm.empName.value;
        	var email = joinForm.email.value;
        	var empId = joinForm.empId.value;
        	var empPwd = joinForm.empPwd.value;
        	var phone = joinForm.phone.value;
        	var addr1 = joinForm.addr1.value;
        	var addr2 = joinForm.addr2.value;
        	var addr3 = joinForm.addr3.value;
        	$("[name=address]").val("[" + addr1 +"] " + addr2 + " " + addr3);
        	
        	if(!empName||!email||!empId||!empPwd||!phone||!addr1||!addr3) {
        		Swal.fire({
        			  icon: 'error',
        			  title: 'Oops...',
        			  text: '모든 입력 사항을 작성해 주세요!'
        			})
        	} else{
        		joinForm.submit();        		
        	}
        	
        };

    </script>




</body>
</html>