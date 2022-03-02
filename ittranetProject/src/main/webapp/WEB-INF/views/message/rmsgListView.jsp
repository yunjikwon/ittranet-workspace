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
    /*모달창 스타일*/
    #tableArea{ 
        margin:auto;
        margin-top:10px;
        margin-bottom:10px;
        border-radius: 1.05ex; 
        background-color: rgb(206, 224, 240);
        width:750px;
    }
    #empInfo, #sendDate{
        border-radius: 1.05ex;
        background-color: white;
        padding:5px;
    }
    .content-area, .content{
        border-radius: 1.05ex;
        background-color: white;
        padding:10px;
        width: 550px;
        height:250px;
        text-align:left;
    }
    #replyMsgBtn{background-color: rgb(84, 173, 247);}
    #nameListArea{
            background-color: white;
            border:none;
            border-radius: 1.05ex;
            width: 150px;
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
                        <button id="delBtn" class="btnStyle" style="float:right" onclick="delMsg();"><a class="aTag">삭제</a></button>
                        <br clear="both"><br>
                        <table id="rMsgTable" align="center">
                            <thead>
                                <tr align="center"  style=" background-color: rgb(181, 211, 236);">
                                    <th width="50">
                                        <input type="checkbox" id="checkAll" name="check">
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
                                            <input type="checkbox" class="checkOne" name="check">
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
                                        <td class="mContent" max-width="350px" data-toggle="modal" data-target="#readMsg">
                                        	${m.msgContent}
                                        	<input type="hidden" class="sNo" value="${m.sendMsgNo }">
                                        	<input type="hidden" class="rNo" value="${m.receiveMsgNo }">
                                        </td>
                                        <td>${m.readDate}</td>
                                    </tr>
                                    <form id="postForm" action="" method="post">
                                        <input type="hidden" id="msgNoDel" name="msgNoDel[]" value="">
                                    </form>
                                </c:forEach>
                            </tbody>
                        </table>
                        <!-- 개별 쪽지 모달창 -->
                        <!-- The Modal -->
                        <div class="modal" id="readMsg" >
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content" >
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"  onclick="location.reload();">&times;</button>
                                    </div>
                                    <!-- Modal body -->
                                    <div class="modal-body" align="center" id="tableArea" >
                                        <button type="button" class="btnStyle" id="replyMsgBtn" style="float:right; margin-right:30px;" data-toggle="modal" data-target="#replyMsg">답장</button>
                                        <table width="650px" height="400px">
                                            <tr >
                                                <th width="150" id="rereceiverNo" height="50px" >  
                                                    발신인                                             
                                                </th>
                                                <td colspan="2" id="senderName">
                                                    <div id="empInfo">
                                                        <span id="dName" style="font-size:12px"></span>
                                                        <span id="tName" style="font-size:12px"></span>
                                                        <span id="eName" style="font-weight:900"></span>
                                                        <span id="jName"></span>
                                                        <input type="hidden" id="eNo" value="">
                                                        
                                                    </div>               
                                                </td>
                                            </tr>
                                            <tr>
                                                <th height="80px">발신날짜</th>
                                                <td colspan="2" >
                                                    <div id="sendDate">

                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    내용
                                                </th>
                                                <td colspan="2" align="center">
                                                    
                                                    <pre class="content-area">

                                                    </pre>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                       
                                    </div>
                                </div>
                            </div>  
                        </div>
                        <!-- 답장하기 모달창 -->
                        <!-- The Modal -->
                        <div class="modal" id="replyMsg" >
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content" >
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                    <h3 class="modal-title">답장 보내기</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <!-- Modal body -->
                                    <form action="sendMsg.ms" id="replyForm">
                                        <div class="modal-body" align="center" id="tableArea" >
                                            <table width="650px" height="400px">
                                                <tr >
                                                    <th width="150" id="receiverNo" height="50px" >  
                                                        수신인                                             
                                                    </th>
                                                    <td colspan="2" id="reName">
                                                    </td>
                                                </tr>
                                                <tr>
                                                <tr>
                                                    <th>
                                                        내용
                                                    </th>
                                                    <td colspan="2" align="center" class="content">
                                                        <textarea name="content" id="reContent" cols="65" rows="14" style="resize:none"></textarea>
                                                    </td>
                                                </tr>
                                            </table>
                                            <input type="hidden" id="rEmpNo" name="rEmpNo" value="">
                                            <input type="hidden" id="sEmpNo" name="sEmpNo" value="${loginUser.empNo }">
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="submit" class="btnStyle" id="sendMsgBtn">전송</button>
                                            <button type="button" class="btnStyle" data-dismiss="modal">닫기</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
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
                               	
                               	
                               	if($(this).hasClass("noResult")){
                               		return false;
                               	}else{
                                   	selectMsg($rNo, $sNo);
                               	}
                              
                           	});
							
                            // 메세지 선택보기
                            function selectMsg(rMsgNo, sMsgNo){
                            	let receiverNo = '${loginUser.empNo}'
                            	$.ajax({
                            		url:"selectRMsg.ms",
                            		data:{
                            			receiverNo:receiverNo,
                            			sendMsgNo:sMsgNo,
                            			receiveMsgNo:rMsgNo
                            		},success:function(msg){
                            			//console.log(msg);
                                        let deptName = msg.deptName;
                                        let teamName = msg.teamName;
                                        let jobName = msg.jobName;
                                        if(deptName === "없음" || deptName === "미정"){
                                            deptName = "";
                                        }
                                        if(teamName === "없음" || teamName === "미정"){
                                            teamName = "";
                                        }
                                        if(jobName === "없음" || jobName === "미정"){
                                            jobName = "";
                                        }
                                        $("#dName").text(deptName);
                                        $("#tName").text(teamName);
                                        $("#eName").text(msg.empName);
                                        $("#jName").text(jobName);
                                        $("#sendDate").text(msg.sendDate);
                                        $(".content-area").text(msg.msgContent);
                                        $("#eNo").attr("value", msg.senderNo);
                            		},error:function(){
                            			console.log("메세지 1개 클릭용 ajax 통신 실패");
                            		}
                            	})
                            }

                             //글 삭제하기 알러트
                             function delMsg(){
                                    
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

                                        delFormSubmit();  
                                    
                                    }
                                })
                            }

                            function delFormSubmit(){
                                
                                let count = $("input[name='check']:checked").length;
                                let checkArr = new Array();
                                $("input[name='check']:checked").each(function(){
                                    checkArr.push($(this).parent().siblings(".mContent").children(".rNo").val())
                                    
                                }); 
                                $("#msgNoDel").attr("value", checkArr);
                                //console.log(checkArr);
                                //console.log(count);
                                    
                                $("#postForm").attr("action", "deleteRMsg.ms").submit(); 
                            }
                            
                            // 답장하기
                            $(document).on("click", "#replyMsgBtn", function(){                           
                                let $rEmpName = $(this).next().children().children().children("#senderName").children().children("#eName").text();
                                let $rEmpNo = $(this).next().children().children().children("#senderName").children().children("#eNo").val();
                                //console.log($rEmpName);
                                $("#reName").text($rEmpName);
                                $("#rEmpNo").attr("value", $rEmpNo);
                            })


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