<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .messageOuter{
		width: 900px;
		box-sizing: border-box;
		margin:auto;
        font-size: 14px;
        height: 650px;
    }
    #rMsgTable tbody tr:hover{ opacity: 50%;}
    .mContent:hover{cursor: pointer;} 
	.aTag, .aTag:hover{
		text-decoration: none;
		color: black;
		cursor: pointer;
	}
    .btnStyle{
        border: none;
        margin: 5px;
        padding:0;
        font-size: 14px;
		font-weight: 900;
        border-radius: 1.05ex;
		background: rgb(188, 214, 235);
        cursor: pointer;
        width : 70px;
		height : 30px;	
    }
    .btnStyle:hover{opacity: 50%;}
    #paging-area{
        text-align: center;
    }
    .pageBtn{
        width : 25px;
        height : 30px;
        font-size: 14px;
        font-weight: 900;
        border: none;
        border-radius: 1.05ex;
        background: rgb(203, 221, 236);
    }
    .pageBtn:hover{
        opacity: 50%;
    }
	.starBtn{
        border:none;
		background-color:transparent;
    }
    .formInput{
        width: 90%;
        height: 25px;
    }
    
	.message_mn{
		color: #000000;
	}
	
</style>
</head>
<body>
    <div class="back">
        <div class="innerBack">
            <!--헤더-->
            <jsp:include page="../common/pageHeader.jsp" />
            <!-- alert창 위한 구문 -->
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
            <!--메뉴바-->
            <jsp:include page="../common/userMenu.jsp" />

            <br clear="both">
            <div style="position:relative">
                
                <!--사이드바-->
                <jsp:include page="msgSidebar.jsp" />
               
                <!--구현시작!-->
                <div class="mainOuter">
                    <br>
                    <span style="margin: 10px;">
                        <h2 style="margin-left:50px; font-weight: 900;"><a class="aTag" href="list.ms">받은 쪽지함</a></h2>
                    </span>
                    
                    <div class="messageOuter" align="center">
                        <button id="addBtn" class="btnStyle" style="float:right; margin-right:5px;"><a class="aTag" href="">쪽지작성</a></button>
                        <button id="addBtn" class="btnStyle" style="float:right"><a class="aTag" href="">삭제</a></button>
                        <br clear="both"><br>
                        <table id="rMsgTable" align="center">
                            <thead>
                                <tr align="center"  style=" background-color: rgb(181, 211, 236);">
                                    <th width="50">
                                        <input type="checkbox" id="checkAll">
                                    </th>
                                    <th width="50" height="70">
                                        <button class="starBtn show">
                                            <i class="far fa-regular fa-star"></i>
                                        </button>
                                        <button class="starBtn" style='display:none'>
                                            <i class="fas fa-regular fa-star"></i>
                                        </button>
                                    </th>
                                    <th width="100">발신인</th>
                                    <th width="150">수신날짜</th>
                                    <th width="400">내용</th>
                                    <th width="150">읽은날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="m" items="${ list }">
                                    <tr align="center">
                                        <td>
                                            <input type="checkbox" class="checkOne">
                                        </td>
                                        <td height="50">
                                            <button class="starBtn show">
                                                <i class="far fa-regular fa-star"></i>
                                            </button>
                                            <button class="starBtn" style='display:none'>
                                                <i class="fas fa-regular fa-star"></i>
                                            </button>
                                        </td>
                                        <td>${m.empName}</td>
                                        <td>${m.sendDate}</td>
                                        <td  class="mContent" max-width="350px">
                                        	${m.msgContent}
                                        	<input type="hidden" class="sNo" value="${m.sendMsgNo }">
                                        	<input type="hidden" class="rNo" value="${m.receiveMsgNo }">
                                        </td>
                                        <td>${m.readDate}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <script>
                            // 별 버튼 변경기능
                            $(document).on("click", ".starBtn", function(){
								
								let obj = $(this);
								
								//console.log(obj);
								if(obj.hasClass("show")){
									obj.hide();
									obj.next().show();
								}else{
									obj.hide(); 
									obj.prev().show();
								}
							});
                            
                           
                            
                            $(function(){
                                 // 전체 체크버튼 클릭시 전체 체크박스 선택
                                // 전체선택 클릭시 전부 선택
                                $("#checkAll").on('click', function(){
                                    
                                    if($("#checkAll").is(':checked')) {
                                        $("input[type=checkbox]").prop("checked", true);
                                    }else {
                                        $("input[type=checkbox]").prop("checked", false);
                                    }
                                    
                                })
                                
                                // 전부 선택시 전체선택 checked
                                $("input[type=checkbox]").on('click', function(){
                                    var total = $(".checkOne").length;
                                    var checked = $(".checkOne:checked").length;
                                    
                                    if(total != checked) {
                                        $("#checkAll").prop("checked", false);
                                    }else {
                                        $("#checkAll").prop("checked", true);
                                    }
                                })
                                
                            })
                            
                           	$(document).on("click", ".mContent", function(){
                               	let $sNo = $(this).children(".sNo").val();
                               	let $rNo = $(this).children(".rNo").val();
                               	
                               	console.log($sNo);
                               	console.log($rNo);
                               	
                               	if($(this).hasClass("noResult")){
                               		return false;
                               	}else{
                                   	selectMsg($rNo, $sNo);
                               	}
                              
                           	});
							
                            function selectMsg(rMsgNo, sMsgNo){
                            	let receiverNo = '${loginUser.empNo}'
                            	$.ajax({
                            		url:"selectRMsg.ms",
                            		data:{
                            			receiverNo:receiverNo,
                            			sendMsgNo:sMsgNo,
                            			receiveMsgNo:rMsgNo
                            		},success:function(msg){
                            			console.log(msg);
                            		},error:function(){
                            			console.log("메세지 1개 클릭용 ajax 통신 실패");
                            		}
                            	})
                            }
                        </script>
                        <br clear="both"><br>

                        <!-- 페이징 바 영역-->
                        <div id="paging-area">
                            <c:choose>
                                <c:when test="${ pi.currentPage eq 1 }">
                                    <button class="pageBtn" disabled>&lt;</button>
                                </c:when>
                                <c:otherwise>
                                    <button class="pageBtn"><a class="aTag" href="list.ms?cpage=${ pi.currentPage-1 }">&lt;</a></button>
                                </c:otherwise>
                            </c:choose>
                            
                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                <button class="pageBtn"><a class="aTag" href="list.ms?cpage=${ p }">${ p }</a></button>
                            </c:forEach>
                        
                            <c:choose>
                                <c:when test="${ pi.currentPage eq pi.maxPage }">
                                    <button class="pageBtn" disabled>&gt;</button>
                                </c:when>
                                <c:otherwise>
                                    <button class="pageBtn"><a class="aTag" href="list.ms?cpage=${ pi.currentPage+1 }">&gt;</a></button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    
                </div>
                
            </div>   
            <!--푸터-->
            <br clear="both">
            <jsp:include page="../common/footer.jsp" />         
        </div>
    </div>
  
</body>
</html>