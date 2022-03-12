<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중요메일함</title>
<style>
	/*공통*/
	.back{
        width: 900px;
    }
    /*메뉴바 픽스 스타일*/
    .mail_mn{
    	color: #000000;
    }
    
    
    /*내용*/
    #mainOuter{
        width:1200px;
        height:800px;
    }
	/*버튼 (메일쓰기,삭제)*/
    #buttonbar{
    	float:right;
    	padding-left:5px;            
    }
    /*조회 테이블*/
    table{
    	text-align:center;
    }
    /*버튼 그라데이션 css(참고)*/
    .w-btn {
    	position: relative;
    	border: none;
    	display: inline-block;
    	padding: 15px 30px;
    	border-radius: 15px;
    	font-family: "paybooc-Light", sans-serif;
    	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    	text-decoration: none;
    	font-weight: 800;
    	transition: 0.25s;
	}
    .w-btn-gra1 {
    	background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    	color: white;
	}
	.w-btn-gra2{
		background: linear-gradient(to top right, #33ccff 0%, #ff0000 100%);
		color: white;
	}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>
<body>
	<!-- 공용 -->
    <div class="back">
    
    	<!-- 상단: 페이지헤더, 메뉴바 -->
        <div class="innerBack">
			<jsp:include page="../common/pageHeader.jsp" />
 			<jsp:include page="../common/userMenu.jsp" />

			<!-- 왼쪽 : 사이드바 -->
 			<br clear="both">
 			<div style="position:relative">
				<jsp:include page="../mail/mailSideBar.jsp" />
			
				<!-- 내용 -->
        		<div class="mainOuter" id="mainOuter" style="font-family: 'Gowun Dodum', sans-serif;">
				<br><br>

					<!-- 버튼바 (메일쓰기, 삭제) -->
            		<div id="buttonbar">
            			<button class="w-btn w-btn-gra1" type="button"><a href="enrollForm.ml" style="text-decoration:none; color:white;">메일쓰기</a></button>
                		<button class="w-btn w-btn-gra2" type="submit">삭제</button>
					</div>
			
					<!-- 폼 -->
            		<form id="postForm" action="impolist.ml" method="post">
					<br><br><br>

						<!-- 중요메일 조회 리스트 -->
            			<div class="table table-hover" align="center">
                			<table id="impolist" style="background-color:white">
                				<thead>
                    				<tr>
                        				<th style="width:50px;"><input type="checkbox" name="checkedAll" id="allCheck" onclick="checkAll(this);"></th>
                        				<th style="width:50px;"><i class="fa-solid fa-star"></i></th>
                        				<th style="width:150px;">보낸사람</th>
                        				<th style="width:500px;">제목</th>
                        				<th style="width:200px;">날짜</th>
                    				</tr>
                    			</thead>
                    			<tbody>
                    				<c:forEach var="m" items="${ impolist }">
	                    				<tr>
	                    					<input class="sdNo" type="hidden" name="mno" value=${ m.sendMailNo }>
                        					<td onclick="event.cancelBubble=true;"><input type="checkbox" name="rvno" id="Check" value="${ m.receiveMailNo }"></td>
                        					<td>
                        						<button id="on" class="btn btn-sm" onclick="importantStar(this);">
                        							<c:choose>
                        								<c:when test="${m.important eq 'N'}">
                        									<img src="resources/images/whitestar.png" style="widt:15px; height:15px;">
                        								</c:when>
                        								<c:otherwise>
                        									<img src="resources/images/blackstar.png" style="width:15px; height:15px;">
                        								</c:otherwise>
                        							</c:choose>
                        						</button>
                        					</td>
                        					<td>${ m.empNameSd }</td>
                        					<td>${ m.mailTitle }</td>
                        					<td>${ m.sendDate }</td>
                        		
                        					<input type="hidden" name="receiveAccount" value="${ m.receiverAccount }">
                        					<input type="hidden" name="statusRv" value="${ m.statusRv }">
                        					<input type="hidden" name="important" value="${ m.important }">
                    					</tr>
                    				</c:forEach>
                    			</tbody>
                			</table>
                		</div>
	               	</form>
			
					<!-- 상세페이지 조회 -->
                	<script>
            			$(function(){
            				$("#impolist>tbody>tr").click(function(){
            					location.href = 'detail.ml?mno=' + $(this).children().siblings(".sdNo").val() + "&statusCheck=1";
            				});
            			})
            		</script>
            	
            		<!-- 체크박스 전체체크/전체체크해제 -->
            		<script>	
            			function checkAll(check){
            				if($("#allCheck").prop("checked")) { 
            					$("input[name=rvno]").prop("checked", true);
            				}else {
            					$("input[name=rvno]").prop("checked", false);
            				}
            			}
					</script>
				
					<!-- 체크박스 : 중요 -->
					<script>
						function importantStar(btn){
							let rvno = $(btn).parent().prev().children("input[name='rvno']").val();
							console.log(rvno);
							let important = $(btn).parent().siblings("input[name='important']").val();
							console.log(important);
					
							$.ajax({
								url:"impo.ml",
								data:{
									rvno:rvno,
									important:important
								},
								success:function(result){
									if(result == 'success'){
										console.log("중요 메일 성공");
										location.onload();
									}else {
										console.log("중요 메일 실패");
									}
								}, error:function() {
									console.log("ajax 중요 메일 통신 실패");
								}
							})
						}
					</script>
				
					<!-- 체크박스 : 삭제 -->			
					<script>	
			            function deletemail() {
			            	var rcArr = [];
			            	$("input[name='rvno']:checked").each(function(){
			            		rcArr.push($(this).val());
			            	})
			            	console.log(rcArr);
			            		 
			            	$.ajax({
			            		url:"delete.ml",
			            		type:"post",
			            		data:{receiveMailNo:rcArr},
			            		success:function(result){
			            			if(result == 'success'){
			            				console.log("게시글 삭제 성공!");
			            				location.reload();
			            			}else{
			            				console.log("게시글 삭제실패");
			            			}
			            		},error:function(){
			            			console.log("ajax게시글 삭제 통신 실패!");
			            		}
			            	})
			        	}            	
			        </script>

					<!-- 페이징바 -->
			        <div id="pagingArea">
			    		<ul class="pagination justify-content-center">
				        	<c:choose>
			            		<c:when test="${ pi.currentPage eq 1 }">
			                   		<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
			                    </c:when>
			                    <c:otherwise>
			                    	<li class="page-item"><a class="page-link" href="impolist.ml?cpage=${ pi.currentPage-1 }">&lt;</a></li>
			                    </c:otherwise>
			                 </c:choose>
			                    
			                 <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                    <li class="page-item"><a class="page-link" href="impolist.ml?cpage=${ p }">${ p }</a></li>
			                 </c:forEach>
			                    
			                 <c:choose>
			                    <c:when test="${ pi.currentPage eq pi.maxPage }">
			                    	<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
			                    </c:when>
			                    <c:otherwise>
			                    	<li class="page-item"><a class="page-link" href="impolist.ml?cpage=${ pi.currentPage+1 }">&gt;</a></li>
			                    </c:otherwise>
			                  </c:choose>
			              </ul>
			         </div>
			         
					<!-- 내용닫는곳 -->
            		</div>
				</div>
				
        		<!-- 푸터바 -->
        		<jsp:include page="../common/footer.jsp" />
		</div>
	</div>
</body>
</html>