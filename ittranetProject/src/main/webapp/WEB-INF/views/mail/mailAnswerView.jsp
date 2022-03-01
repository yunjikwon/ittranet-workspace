<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.back{
        width: 900px;
    }
    .mainOuter{
           width:1200px;
           height:800px;
          }

    .sidebar{
         width:300px;
         height:600px;
        }
    .middle{
            width:880px;
            height:580px;
            font-family: 'Gowun Dodum', sans-serif;

    }

    #buttonbar{
    	float:right;
    	padding-left:5px;     
               
    }
    table{
          text-align:center;
    }
    
    
    
    
    

    .maildetail{
                width:800px;
                height:550px;
                font-size:17px;
                background-color:white;
                margin:5px;

    }
	.maildetail th{
		width:100px;
		height:50px;
	}
    .maildetail td{
    	width:700px;
    	height:50px;
    	padding-top:10px;

    }
    .maildetail input{
    	width:700px;
    	height:50px;
    }
    .maildetail textarea{
                    width:800px;
                    height:400px;
    }
    #enrollForm{
    	height:800px;
    }
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>
<body>
	<!-- 공용 -->
    <div class="back">
    
    	<!-- 상단 : 페이지헤더, 메뉴바 -->
        <div class="innerBack">
			<jsp:include page="../common/pageHeader.jsp" />
 			<jsp:include page="../common/userMenu.jsp" />

		<!-- 왼쪽 : 사이드바 -->
 		<br clear="both">
 		<div style="position:relative">
			<jsp:include page="../mail/mailSideBar.jsp" />
			
		<!-- 내용 -->
        <div class="mainOuter" align="center">
        
        	<form id="enrollForm" method="post" action="asinsert.ml" enctype="multipart/form-data">
        
        	<input type="hidden" name="empNameSd" value="${ loginUser.empNo }">
        
        	<br><br>
        	
        	<!-- 버튼바 (내게쓰기, 보내기, 취소) -->
			<div id="buttonbar">
            	<button type="submit" class="btn btn-success">보내기</button>
            	<button type="submit" class="btn btn-light">취소</button>
        	</div>
        	
        	<br><br>
        
        	<!-- 입력폼 -->
            <div class="maildetail">

				<input type="hidden" name="mno" value="${m.receiveMailNo }">
				<input type="hidden" name="receiverAccount" value="${m.receiverAccount}">
				<table id="mailinsert" align="center" style="font-family: 'Gowun Dodum', sans-serif;">
					<tr>
						<th>받는사람</th>
						<td><input type="text" name="senderAccount" value="${m.senderAccount}" required readonly></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" id="title" name="mailTitle" value="[RE]:${m.mailTitle}"></td>
    	            </tr>
        	        <tr>
						<th>첨부</th>
						<td><input type="file" multiple="multiple" name="upfile"></td>
                	</tr>
            	    <tr>
        	        	<td colspan="2"><textarea id="content" name="mailContent" placeholder="내용을 입력해주세요." required></textarea></td>
					</tr>
            	</table>
            </div>
            
			</form>
		</div>
	
	<!-- 푸터바 -->
	<jsp:include page="../common/footer.jsp" />
	
	</div>
    </div>
    </div>
    
    <script>
    	$(".btn-light").on("click", function(){
    		location.href="alllist.ml";
    	})
    </script>
       

</body>
</html>