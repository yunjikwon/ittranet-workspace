<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	
	
	<script>
		Swal.fire({
			  icon: 'error',
			  title:'Error!',
			  text: 'Something went wrong!',
			  footer: '<a href="#" onClick="history.back()">Back Step</a>'
			})
	</script>
	
</body>
</html>