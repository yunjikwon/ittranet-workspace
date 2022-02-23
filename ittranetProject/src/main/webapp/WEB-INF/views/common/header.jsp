<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- alertify -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<style>
    /*헤더 스타일*/
    div{
        box-sizing: border-box;
    }
    .outer{
        margin:auto;
        background:rgb(238, 235, 235);
        width:100vw;
        height:100vh;
    }
    .headerOuter{
        width: 1200px;
        float:right;
        height: 50px;
        margin-bottom: 20px;
        margin-right: 30px;
    }
    .header-btn{
        border: none;
        background: rgb(168, 201, 185);
        height: 35px;
        border-radius: 5px;
        margin: 7px;
    }
    .header-btn:hover {
    	transform: scale(1.2);
    	background:lightseagreen;
    	color:white;
    }
    .menu>a{
        text-decoration: none; 
        color:gray;
    }
</style>
</head>
<body>
		<!-- alertMsg키값으로 alert메시지가 담겨있을 때에만 이부분 작동 -->
		<c:if test="${ not empty alertMsg }">
			<script>
				alertify.alert('IT!tranet 잇트라넷 메시지', "${alertMsg}");
			</script>
			<c:remove var="alertMsg" scope="session"/>
		</c:if>
		<!-- 한 번만 출력이 되고 더 이상 출력  x  -->

        <!--헤더 영역-->
        <div class="headerOuter" align="right">
            <span style="font-size: 16px;">${ loginUser.empName }</span> <span style="font-size: 16px;">님 환영합니다</span>
            <button class="header-btn" onclick="location.href='myPage.me'">마이페이지</button>
            <button class="header-btn" onclick="location.href='bye.me'">로그아웃</button>
            <!--관리자에게만 보여지도록-->
            <button class="header-btn" onclick="location.href=''">페이지이동</button>            
        </div>

</body>
</html>