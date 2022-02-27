<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
	
	<c:if test="${ not empty errorMsg }">
		<script>
			Swal.fire({
				icon: 'error',
				title: 'Oops!',
				text: '${ errorMsg }',
				footer: '<a href="javascript:window.history.back();">뒤로가기</a>'
			})
		</script>
		<c:remove var="errorMsg" />
	</c:if>
	
</body>
</html>