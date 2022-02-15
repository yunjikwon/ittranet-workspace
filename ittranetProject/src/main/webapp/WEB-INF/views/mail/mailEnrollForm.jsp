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
		width:150px;
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
<script src="https://kit.fontawesome.com/6aa80e3f77.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 공용  -->
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
        
        	<form id="enrollForm" method="post" action="insert.ml" enctype="multipart/form-data">
        
        	<input type="hidden" name="empNameSd" value="${ loginUser.empNo }">
        
        
        	<br><br>
        	
        	<!-- 버튼바 (내게쓰기, 보내기, 취소) -->
			<div id="buttonbar">
            	<button type="button" class="btn btn-secondary"><a href="enrollForm.mlme"></a>내게쓰기</button>
            	<button type="submit" class="btn btn-success">보내기</button>
            	<button type="reset" class="btn btn-light">취소</button>
        	</div>
        	
        	<br><br>

			<!-- 입력폼 -->
            <div class="maildetail">

				<input type="hidden" id="sdaccount" name="senderAccount" value="${ loginUser.email }">
			
				<table id="mailinsert" align="center" style="font-family: 'Gowun Dodum', sans-serif;">
					<tr>
						<th>받는사람</th>
						<td colspan="2"><input type="text" class="form-control" id="rvaccount" name="receiverAccount" required></td>

					</tr>
					<tr>
						<th>제목</th>
						<td colspan="2"><input type="text" class="form-control" id="title" name="mailTitle"></td>
            	    </tr>
               		<tr>
						<th>첨부</th>
						<td><input type="file" multiple="multiple" name="upfile"></td>
                	</tr>
                	<tr>
                		<td colspan="3"><textarea class="form-control" id="content" name="mailContent" placeholder="내용을 입력해주세요." rows="15" required></textarea></td>
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
       

</body>
</html>