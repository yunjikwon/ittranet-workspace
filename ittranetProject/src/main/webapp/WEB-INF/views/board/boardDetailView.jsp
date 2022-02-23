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
	.aTag, .rBtn {
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
	.btnStyle, .addRereplyBtn{
        border: none;
        margin: 5px;
		padding:0;
        font-size: 14px;
		font-weight: 900;
        border-radius: 1.05ex;
		background: rgba(162, 171, 255, 0.822);
        cursor: pointer;
    }
    .btnStyle:hover, .rBtn:hover{opacity: 50%;}
    .aTag:hover{color: grey; cursor: pointer; text-decoration: none;}
	#updateBtn, #replyInsertBtn, #backBtn, #deleteBtn, .rereply-area button, .addRereplyBtn, .updateBtn{
		width : 70px;
		height : 30px;
	}
	.rBtn{
		border:none;
		padding:0;
        font-size: 12px;
		font-weight: 900;
		background-color:transparent;
	}
	#replyTable tbody{
		font-size: 12px;		
	}
	.board_mn{
		color: #000000;
		
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
				                  <a href="list.no">공지사항</a>
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
							<input type="hidden" name="filePath" value="${ at.filePath }">
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
												<a href="${ at.filePath }" download="${ at.originName }" class="aTag">${ at.originName }</a><br>
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
										<td colspan="8" align="left">
											댓글(<span id="rcount" style="font-weight:700; margin:5px;"></span>)
										</td>
									</tr>
									<tr>
										<th colspan="6" height="100" align="center">
											<textarea name="replyContent" id="replyContent" cols="75" rows="5" style="resize:none; margin-top:5px;"></textarea>
										</th>
										<td colspan="2">
											<button id="replyInsertBtn" class="btnStyle" onclick="clickAddBtn(1)";>등록</button>
										</td>
									</tr>
									
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
						<br><br>
						<script>
							$(function(){
								selectReplyList();
							})

							function selectReplyList(){
								$.ajax({
									url:"rlist.bo",
									data:{
										bno:${b.boardNo},
									},
									success:function(list){
										//console.log(list);


										let value = "";
										// 원본 댓글의 경우 list[i].replyBranch = 1
										for(let i in list){
											if(list[i].replyBranch == 1){
												value += "<tr>"
													+	"<th colspan='2' width='100' height='50'>" + list[i].empName + "</th>"
													+ "<td><input type='hidden' class='replyNo' name='replyNo' value='"+list[i].replyNo+"'></td>";
											}else{
												value += "<tr>"
													+	"<th width='20' height='50'>" + "</th>"
													+ 	"<th width='80'>" + "ㄴ" + list[i].empName + "</th>"
													+ "<td><input type='hidden' class='replyNo' name='replyNo' value='"+list[i].replyNo+"'></td>";
											}
											value += 	"<td width='380' class='replyContent'>" + list[i].replyContent+ "</td>"
													+	"<td width='110'>" + list[i].createDate + "</td>"
													+	"<th width='40'>" ;
											if(list[i].empNo =='${loginUser.empNo}'){
												value += "<button type='button' class='showBtn show rBtn upBtn'>수정</button>" 
														+ "<button type='button' class='showBtn rBtn upBtn' style='display:none'>수정</button>"
														+ "</th>" ;
											}
											if(list[i].empNo =='${loginUser.empNo}' || '${loginUser.admin}' ==='Y'){
												value += "<th width='30'>" 
													+ "<button type='button' class='aTag rBtn delBtn'>삭제</button>" 
													+ "</th>";
											}else{
												value +=  "</th>" 
														+ "<th width='30'>"
														+ "</th>";
											}
											if(list[i].replyBranch == 1){
												value += "<th width='30'>" 
													+ "<button type='button' class='show showBtn addReplyBtn rBtn' >답글</button>" 
													+ "<button type='button' class='showBtn addReplyBtn rBtn' style='display:none'>답글</button>"
													+ "</th>"
													+ 	"</tr>";
													
													
											}else{
												value += "<th width='30'></th></tr>";
											}

											value += "<tr class='rereplyTr' style='display:none'>"
													+ "<td colspan='6' align='center'>"
									  				+ 	"<textarea name='rereplyContent' class='rereplyContent' cols='85' rows='3' style='resize:none; margin-top:5px;'></textarea>"	
									 			 	+"</td>"
													+ "<td colspan='2' class='btn-area'>"
													+	"<button class='btnStyle updateBtn'>수정</button>"
													+	"<button class='btnStyle addRereplyBtn'>등록</button>"
													+"</td>"
													+ "</tr>";
										}
										
										$("#reply-area tbody").html(value);
										$("#rcount").text(list.length);
										

									},error:function(){
										console.log("댓글 작성용 ajax 통신 실패");
									}
								})
							}
							var orgNo = 0;
							var branch = 0;

							function clickAddBtn(num){
								if($("#replyContent").val().trim().length != 0){
									if(num == 1){
										var orgNo = 0;
										var branch = 1;
										insertReply(orgNo, branch);
									}
								}
							}


							// 답글, 수정 버튼 누를때 입력폼 생기도록 하기
							$(document).on("click", ".showBtn", function(){
								
								let obj = $(this);
								if(obj.hasClass("upBtn")){
									let content = $(this).parent().siblings(".replyContent").html();
									//console.log(content);
									$(".rereplyContent").html(content);
									$(this).parent().parent().siblings().children(".btn-area").children(".updateBtn").show();
									$(this).parent().parent().siblings().children(".btn-area").children(".addRereplyBtn").hide();
								}else{
									$(".rereplyContent").html("");
									$(this).parent().parent().siblings().children(".btn-area").children(".updateBtn").hide();
									$(this).parent().parent().siblings().children(".btn-area").children(".addRereplyBtn").show();
								}
								
								//console.log(obj);
								if(obj.hasClass("show")){
									obj.hide();
									obj.next().show();
									obj.parent().parent().next(".rereplyTr").show();
								}else{
									obj.hide(); 
									obj.prev().show();
									obj.parent().parent().next(".rereplyTr").hide();
								}
							});

							// 대댓글 작성 서비스
							$(document).on("click", ".addRereplyBtn", function(){
								var $value = $(this).parent().parent().prev().children().children(".replyNo").val();
								var $content = $(this).parent().siblings().children(".rereplyContent").val();
								
								insertReply($value, 2, $content);
							});		
							

							function insertReply(orgNo, branch, content){
								
								let $replyContent = "";
								if(branch == 1){
									$replyContent = $("#replyContent").val();
								}else{
									$replyContent = content;
								}
								
								$.ajax({
									url:"rinsert.bo",
									data:{
										refNo:${b.boardNo},
										empNo:'${loginUser.empNo}',
										replyContent:$replyContent,
										replyOriginNo: orgNo,
										replyBranch: branch
									},success:function(status){
										if(status == "success"){
											selectReplyList();
											$("#replyContent").val("");
										}
									},error:function(){
										console.log("댓글 작성용 ajax 통신 실패");

									}
								})
										
							
							}

							// 댓글 삭제 버튼 클릭 시
							$(document).on("click", ".delBtn", function(){
								var $value = $(this).parent().siblings().children(".replyNo").val();
								delReply($value);
						
							});
							
							// 댓글 삭제 기능
							function delReply(replyNo){
								$.ajax({
									url:"rdelete.bo",
									data:{
										replyNo:replyNo
									},success:function(status){
										if(status == "success"){
											selectReplyList();
										}
									},error:function(){
										console.log("댓글 삭제용 ajax 통신 실패");

									}
								})
							}


							// 댓글 수정 버튼 클릭 시
							$(document).on("click", ".updateBtn", function(){
								var $value = $(this).parent().parent().prev().children().children(".replyNo").val();
								var $content = $(this).parent().siblings().children(".rereplyContent").val();
								updateReply($value, $content);
							});
							// 댓글 수정 기능
							function updateReply(replyNo, replyContent){
								$.ajax({
									url:"rupdate.bo",
									data:{
										replyNo:replyNo,
										replyContent: replyContent
									},success:function(status){
										if(status == "success"){
											selectReplyList();
										}
									},error:function(){
										console.log("댓글 수정용 ajax 통신 실패");

									}
								})
							}
	
						</script>
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