<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--BOOTSTRAP-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
	        height: 100vh;
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
            cursor:pointer;
        }
        .input-form {
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
        #submitBtn {
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
        #submitBtn:hover {
            transform: scale(1.2);
        }
        #submitBtn:hover::after {
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
        #modalDiv {
            text-align: right;
            display: inline;
            margin-left: 240px;
        }
        span {
            text-decoration: none;
            color:rgba(0, 0, 0, 0.562);
            font-weight: bold;
        }
        span:hover {
            text-decoration: underline;
            color:#3c5a50;
            cursor: pointer;
        }
    </style>
</head>
<body>	
	<div class="content">
        <br><br><br><br><br>
        <div class="anton" style="font-style:italic;" id="hi">IT!tranet</div>
        <br>
        <form action="login.me" method="post">
            <p class="anton">ID</p>
            <input type="text" class="input-form" id="empId" name="empId" placeholder="아이디를 입력하세요" onfocus="this.placeholder = ''" onblur="this.placeholder='아이디를 입력하세요'" required><br>
            <br>
            <p class="anton">PASSWORD</p>
            <input type="text" class="input-form" id="empPwd" name="empPwd" placeholder="비밀번호를 입력하세요" onfocus="this.placeholder = ''" onblur="this.placeholder='비밀번호를 입력하세요'" required>
            <br><br>
            <div class="form-check-inline">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input" value=""><span>로그인 상태 유지</span>
                </label>
            </div>
            <div id="modalDiv"><span data-toggle="modal" data-target="#myModal">ID/PWD 찾기</span></div>
            <br><br><br>
            <button id="submitBtn">CLICK!</button>
        </form>
        <br><br><br><br><br><br>
    </div>

    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title">ID/PWD 찾기</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
            * @포함 이메일 형태로 입력하세요
            <input type="text" class="form-control form-control">
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
            </div>
    
        </div>
        </div>
    </div>
	
</body>
</html>