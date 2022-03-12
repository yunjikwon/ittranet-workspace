<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내게쓰기</title>
<style>
	/*메뉴바 픽스 스타일*/
    .mail_mn{
    	color: #000000;
    }
    
    
	/*내용*/
    .mainOuter{
    	width:1200px;
        height:800px;
    }
    /*폼 (내용전체 감싸는 회색배경)*/
    #toMeEnrollForm{
    	height:800px;
    }
	/*버튼(보내기,취소)*/
	#buttonbar{
    	float:right;
    	padding-left:5px;
    }
    /*조회 테이블*/
    table{
    	text-align:center;
    }
	/*내게쓰기 상세내역*/
    .maildetail{
    	width:800px;
        height:550px;
        font-size:17px;
        background-color:white;
        margin:5px;
	}
	/*고정 제목*/
	.maildetail th{
		width:150px;
		height:50px;
	}
	/*변동값 들어가는 칸*/
    .maildetail td{
    	width:700px;
    	height:50px;
    	padding-top:10px;
    }
    /*찐 변동값 들어가는 자리*/
    .maildetail input{
    	width:700px;
    	height:50px;
    }
    /*찐 메일내용 들어가는 자리*/
    .maildetail textarea{
    	width:800px;
        height:400px;
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
        			<!-- [내게쓰기] 폼 (tomeinsert.ml) -->
        			<form id="toMeEnrollForm" method="post" action="tomeinsert.ml" enctype="multipart/form-data">
        				<input type="hidden" name="empNameSd" value="${ loginUser.empNo }">
        				<br><br>
        	
			        	<!-- 버튼바 (보내기,취소) -->
						<div id="buttonbar">
			            	<button type="submit" class="btn btn-success">보내기</button>
			            	<button type="submit" class="btn btn-light">취소</button>
			        	</div>
        				<br><br>

						<!-- 상세내역 -->
			            <div class="maildetail">

							<input type="hidden" id="sdaccount" name="senderAccount" value="${ loginUser.email }">
			
							<table id="mailtomeinsert" align="center" style="font-family: 'Gowun Dodum', sans-serif;">
								<tr>
									<th>받는사람</th>
									<td colspan="2"><input type="text" class="form-control" id="rvaccount" name="receiverAccount" value="${ loginUser.email }" disabled></td>
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
    
    <!-- 취소 버튼 클릭시 안읽은메일함으로 이동됨 -->  
    <script>
    	$(".btn-light").on("click", function(){
    		location.href="unreadlist.ml";
    	})
    </script>

</body>
</html>