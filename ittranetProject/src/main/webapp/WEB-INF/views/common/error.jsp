<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	body {
		background-image: url('resources/images/backImg.jpg');
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        width: 90vw;
        height: 90vh;
	}
</style>
</head>
<body>
	
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert('Error! 에러입니다!', "${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
</body>
</html>