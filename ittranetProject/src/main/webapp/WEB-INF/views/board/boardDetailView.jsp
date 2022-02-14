<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.boardDetailOuter{
		width: 900px;
		box-sizing: border-box;
		margin:auto;
		background-color: rgba(211, 211, 211, 0.466);
		font-size: 14px;
    }
    #boardDetailTable, #replyTable{
		width: 700px;
		border-collapse: collapse;
    }
	.aTag, .aTag:hover{
		text-decoration: none;
		color: black;
		cursor: pointer;
	}
	#content-area{
		margin:30px; 
		border-radius: 1.05ex;
		padding:10px;
		height:380px;
		background-color: white;
	}
	#boardDetailTable td, #boardDetailTable th, #replyTable td, #replyTable th{
		border-bottom: 1px solid rgb(184, 184, 184);
	}
	.btnStyle{
        border: none;
        margin: 5px;
		padding:0;
        font-size: 14px;
		font-weight: 900;
        border-radius: 1.05ex;
		background: rgba(162, 171, 255, 0.822);
        cursor: pointer;
    }
    .btnStyle:hover{opacity: 50%;}
    .aTag:hover{color: grey;}
	#updateBtn, #replyInsertBtn, #backBtn, #deleteBtn{
		width : 70px;
		height : 30px;
	}
	#replyTable tbody{
		font-size: 12px;
	}
</style>
</head>
<body>
	
	<div class="back">
		<div class="innerBack">
			<!--헤더자리-->
			<jsp:include page="../common/pageHeader.jsp" />
			<!-- 글 수정시 나타나는 alert창 위한 구문 -->
			<c:if test="${ not empty alertMsg }">
				<script>
					Swal.fire({
					  position: 'middle',
					  icon: 'success',
					  text: '${ alertMsg }',
					  showConfirmButton: false,
					  timer: 1500
					})
				</script>
				<c:remove var="alertMsg"  />
				
			</c:if>
			<!-- 메뉴바-->
			<jsp:include page="../common/userMenu.jsp" />

			<br clear="both">

			<div style="position:relative">
				<!-- 사이드바-->
				<jsp:include page="../common/sidebar.jsp" />
				<!-- 각 메뉴에 맞게 수정 -->    	
		        <div class="cont">
		            <ul id="ac">
		                <li class="division">
		                    <a href="#">게시판</a>
		                </li>
		                <div id="border">
				               <li class="menu1">
				                  <a href="#">공지사항</a>
				               </li>
				               <li class="menu1">
				                  <a href="list.bo">자유게시판</a>
				               </li>
				              
		            	</div>
		            </ul>
		         </div>
				<!-- 구현시작! -->			
				<div class="mainOuter">
					<br>
					<span style="margin: 10px;">
						<h2 style="margin-left:50px; font-weight: 900;"><a class="aTag" href="list.bo">자유게시판</a></h2>
					</span>
					<br clear="both">
					<div class="boardDetailOuter" align="center">
						
						<br><br>
						<button id="backBtn" class="btnStyle" style="float:right; margin-right:50px;" onclick="goBack();"><a class="aTag">목록으로</a></button>
						<c:if test="${ b.empNo eq loginUser.empNo }">
							<button id="updateBtn" class="btnStyle" style="float:right; margin-right:5px;" onclick="postFormSubmit(1);">수정하기</button>
							<button id="deleteBtn" class="btnStyle" style="float:right; margin-right:5px;" onclick="delBoard();">삭제하기</button>
						</c:if>
						<form id="postForm" action="" method="post">
							<input type="hidden" name="bno" value="${ b.boardNo }">
							<input type="hidden" name="filePath" value="${ at.changeName }">
						</form>
						<br><br>
						<script>
						
							function delBoard(){
								
								Swal.fire({
								  title: '삭제하시겠습니까?',
								  icon: 'warning',
								  showCancelButton: true,
								  confirmButtonColor: '#3085d6',
								  cancelButtonColor: '#d33',
								  confirmButtonText: '삭제하기',
								  cancelButtonText : '취소'
								}).then((result) => {
								  if (result.isConfirmed) {
									$("#postForm").attr("action", "delete.bo").submit();  
								   
								  }
								})
							}
							
							function postFormSubmit(num){
								if(num == 1){
									$("#postForm").attr("action", "updateForm.bo").submit();
								
								}
							}
						</script>
						<!-- 게시글 상세내역-->
						<table id="boardDetailTable" align="center">
							<tr>
								<th height="50">글제목</th>
								<td colspan="3" align="center">${ b.boardTitle }</td>
							</tr>
							<tr>
								<th width="100" height="50">작성자</th>
								<td width="250">${ b.empName }</td>
								<th width="100">작성일</th>
								<td width="250">${ b.createDate }</td>
							</tr>
							<tr>
								<th height="120">첨부파일</th>
								<td colspan="3">
									
									<c:choose>
										<c:when test="${ empty atList }">
												첨부파일이 없습니다.
										</c:when>
										<c:otherwise>
											<c:forEach var="at" items="${ atList }">
												<a href="${ at.changeName }" download="${ at.originName }" class="aTag">${ at.originName }</a><br>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								
								</td>
							</tr>
							<tr>
								<th style="border:none;" height="30">
									내용
								</th>
							</tr>
							<tr>
								<td colspan="4" height="400px" >
									<p id="content-area">
										${ b.boardContent }
									</p>
								</td>
							</tr>
						</table>
						<script>
							 function goBack(){
								location.href="list.bo";
							 }

						</script>
						
						<!-- 댓글 영역 -->
						<div id="reply-area" align="center">
							<br>
							<table id="replyTable" width="700" >
								<thead>
									<tr>
										<th colspan="5" height="100">
											<textarea name="" id="" cols="75" rows="5" style="resize:none"></textarea>
										</th>
										<td colspan="2">
											<button id="replyInsertBtn" class="btnStyle">등록</button>
										</td>
									</tr>
									
								</thead>
								<tbody>
									<tr>
										<th colspan="2" width="100" height="50">이트라</th>
										<td width="380">안녕하세요?</td>
										<td width="110">2020-01-01 10:33</td>
										<th width="40">수정</th>
										<th width="30">삭제</th>
										<th width="30">답글</th>
									</tr>
									<tr>
										<th width="20" height="50"></th>
										<th width="80">ㄴ관리자</th>
										<td width="380">안녕하세요?</td>
										<td width="110">2020-01-01 10:33</td>
										<th width="40">수정</th>
										<th width="30">삭제</th>
										<th width="30">답글</th>
									</tr>
								</tbody>
							</table>
						</div>
						<br><br>
					</div>
				
					
				</div>
			</div>
			
			<br clear="both">
			<!-- 푸터바 영역 -->
			<jsp:include page="../common/footer.jsp" />
		</div>
	
	</div>
    
</body>
</html>