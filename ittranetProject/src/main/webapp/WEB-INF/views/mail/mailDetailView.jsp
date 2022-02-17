<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
           width:1200px;
           height:800px;
           margin:10px;
          }
    .outer div{float:left;}
    .top{
         width:1200px;
         height:200px;
    }
    .sidebar{
         width:300px;
         height:600px;
        }
    .mainOuter>div{float:left; width:100%}
    #buttonbar>button{
    	float:right;
    	padding-left:5px;
		width:50px;
        height:40px;
    }      
	#mailalllist {
		text-decoration:none;
		color:white;
	}

    
    
   .mainOuter{
           /*margin:auto;*/
           margin:10px;
           width:800px;
           height:800px;
          }
    .btn{
         float:right;
         margin:5px; 
         font-family: 'Gowun Dodum', sans-serif;      
    }
    .mailcontent{
    	margin-top:30px;
    	margin:20px;
        font-family: 'Gowun Dodum', sans-serif;
    }
    .mailcontent>div{
    	width:100%;
    }
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<!-- 공용 -->
	<div class="back">
    
    	<!--  상단 : 페이지헤더, 메뉴바 -->
        <div class="innerBack">
			<jsp:include page="../common/pageHeader.jsp" />
 			<jsp:include page="../common/userMenu.jsp" />

		<!-- 왼쪽 : 사이드바 -->
 		<br clear="both">
 		<div style="position:relative">
			<jsp:include page="../mail/mailSideBar.jsp" />
			
		<!-- 내용 -->
        <div class="mainOuter" style="font-family: 'Gowun Dodum', sans-serif;">
		
			<br>

			<!-- 버튼바 (목록, 삭제, 스팸, 답장) -->
	        <div id="buttonbar">
	            <button type="button" class="btn btn-secondary"><a id="mailalllist" href="alllist.ml">목록</a></button>
	            <button type="button" id="delete" class="btn btn-danger" onclick="deleteMail">삭제</button>
	            <button type="button" id="spam" class="btn btn-warning" onclick="spamMail">스팸</button>
	            <button type="button" id="answer" class="btn btn-secondary" onclick="answerMail">답장</button>
	        </div>
	        
			<!-- 메일 상세내용 -->
	        <div class="mailcontent">
	        
	        	<input type="hidden" value="${ m.sendMailNo }">
	        	
	            <div>${ m.mailTitle }</div>
	            <div>${ m.sendDate }</div>
	            <br>
	            
	            <div> 보낸사람 : ${ m.empNameSd } &lt; ${ m.senderAccount } &gt;</div>
	            <div> 받는사람 : ${ m.empNameRv } &lt; ${ m.receiverAccount } &gt;</div>
	            <br>
	            
	            <hr>
	            <br>
	            <div>${ m.mailContent }</div>
	            <br>
	            
	            <hr>
	            
	            <div>
				<c:forEach var="at" items="${ at }">
	            	<c:choose>
	            		<c:when test="${ empty at.originName }">
	            			첨부파일이 없습니다.
	            		</c:when>
	            		<c:otherwise>
	            			<a href="${ at.changeName }" download="${at.originName}">${ at.originName }</a>	
	            		</c:otherwise>
	            	</c:choose>
	            </c:forEach>
	            </div>
	        </div>
	        
	        <!-- 
	        <script>
	        function fileDownload(fileNameKey, fileName, filePath){
	            
	            location.href = "/board/fileDownload?fileNameKey="+fileNameKey+"&fileName="+fileName+"&filePath="+filePath;
	        }
	        </script>
	         -->
	        
	        <br><br><br>
	        
		</div>
		
		<!-- 푸터바 -->
		<jsp:include page="../common/footer.jsp" />
		
    </div>

</body>
</html>