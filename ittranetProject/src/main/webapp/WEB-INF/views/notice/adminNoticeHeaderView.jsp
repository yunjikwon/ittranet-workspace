<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .headerDetailOuter{
		width: 800px;
		box-sizing: border-box;
		margin:auto;
        font-size: 14px;
    }
    #noticeDetailTable{
		width: 700px;
		border-collapse: collapse;
		margin: auto;
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
	#noticeDetailTable td, #noticeDetailTable th{
		border-bottom: 1px solid rgb(184, 184, 184);
        border-top: 1px solid rgb(184, 184, 184);
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
	#deleteBtn, #addBtn{
		width : 50px;
		height : 30px;		
	}
    .formInput{
        width: 90%;
        height: 25px;
    }
    #addFileBtn, #removeFileBtn{
    	width: 25px;
    	height: 25px;
        font-size: 14px;
        font-weight: 900;
        border: none;
        border-radius: 1.05ex;
        background: rgba(195, 200, 247, 0.822);
    }
	.board_mn{
		color: #000000;
	}
	
</style>
</head>
<body>
    <div class="back">
        <div class="innerBack">
            <!--헤더-->
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
            <!--메뉴바-->
            <jsp:include page="../common/adminMenu.jsp" />

            <br clear="both">
            <div style="position:relative">
                
                <!--사이드바-->
                <jsp:include page="../common/sidebar.jsp" />
                <!-- 각 메뉴에 맞게 수정 -->    	
		        <div class="cont">
		            <ul id="ac">
		                <li class="division">
		                    <a href="#">게시판 관리</a>
		                </li>
		                <div id="border">
				                <li class="menu1">
				                    <a href="listAdmin.no">공지사항 관리</a>
				                </li>
                                <li class="menu1">
                                    <a href="headerAdmin.no">공지사항 말머리 관리</a>
                                </li>
				                <li class="menu1">
				                    <a href="listAdmin.bo">자유게시판 관리</a>
				                </li>
				              
		            	</div>
		            </ul>
		         </div>
                <!--구현시작!-->
                <div class="mainOuter">
                    <br>
                    <span style="margin: 10px;">
                        <h2 style="margin-left:50px; font-weight: 900;"><a class="aTag" href="headerAdmin.no">공지사항 말머리 관리</a></h2>
                    </span>
                    <br clear="both">
                    <div class="headerDetailOuter" align="center">
                        
                        <br><br>
                        <button id="deleteBtn" class="btnStyle" style="float:right; margin-right:50px;" onclick="delHeader();">삭제</button>
                        <button id="addBtn" class="btnStyle" style="float:right; margin-right:5px;" data-toggle="modal" data-target="#addHeader">등록</button>
                        
                        <br clear="both"><br>
                        <!-- 게시글 상세내역-->
                        <table id="headerDetailTable" width="700">
                            <thead>
                                <tr align="center">
                                    <th width="100">
                                        <input type="checkbox" id="checkAll">
                                    </th>
                                    <th width="100">No.</th>
                                    <th width="300">말머리 제목</th>
                                    <th width="100"></th>
                                </tr>
                               
                            </thead>
                            <tbody>
                                <c:forEach var="h" items="${headerList}">
                                    <tr align="center">
                                        <td><input type="checkbox" name="check" class="checkOne"></td>
                                        <td class="headerNo">${h.headerNo}<input type=hidden class="headerNoInput" value=""></td>
                                        <td class="headerTitle">${h.headerTitle}</td>
                                        <td><button class="btnStyle updateBtn" style="width:50px; height:25px; font-size: 13px;" data-toggle="modal" data-target="#updateHeader">수정</button></td>
                                    </tr>
                                    <form id="postForm" action="" method="post">
                                        <input type="hidden" id="headerNoDel" name="headerNoDel[]" value="">
                                    </form>
                                </c:forEach>
                            </tbody>
                        </table>
                        <script>
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
                       
                        </script>
                         <!-- 강제적용 위해 script 추가-->
                        <!-- jQuery 라이브러리 -->
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                        <!-- 부트스트랩에서 제공하고 있는 스타일 -->
                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
                        <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
                        
                        <!-- 등록용 모달창-->
                        <div class="modal" id="addHeader" >
                            <div class="modal-dialog modal-dialog-scrollable">
                                <div class="modal-content" >
                        
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                    <h4 class="modal-title">말머리 등록</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                            
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <form action="" id="addHeaderModal">
                                            <table width="400px" height="200px" >
                                            
                                                <tr>
                                                    <th width="100px" height="100px">
                                                        말머리 제목
                                                    </th>
                                                    <td width="250px" height="200px">
                                                        <input type="text" id="newHeaderTitle" value="">
                                                    </td>
                                                    <td>
                                                        <button id="modalAddBtn" class="btnStyle" style="width:70px; height:25px; font-size: 13px;">등록</button>
                                                    </td>
                                                </tr>
                                                
                                            </table>
                                        </form>
                                    </div>
                            
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    </div>
                        
                                </div>
                            </div>
                        </div>

                        <!-- 수정용 모달-->
                        <div class="modal" id="updateHeader" >
                            <div class="modal-dialog modal-dialog-scrollable">
                                <div class="modal-content" >
                        
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                    <h4 class="modal-title">말머리 수정</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                            
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <form action="" id="updateHeaderModal">
                                            <table width="400px" height="200px" >
                                            
                                                <tr>
                                                    <th width="100px" height="100px">
                                                        말머리 제목
                                                    </th>
                                                    <td width="250px" height="200px">
                                                        <input type="text" width="200px" value="">
                                                    </td>
                                                    <td>
                                                        <button id="modalUpdateBtn" class="btnStyle" style="width:70px; height:25px; font-size: 13px;">수정</button>
                                                    </td>
                                                </tr>
                                                
                                            </table>
                                        </form>
                                    </div>
                            
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    </div>
                        
                                </div>
                            </div>
                        </div>
                        <script>
                            $(document).on("click", ".updateBtn", function(){
                                let hTitle = $(this).parent().prev(".headerTitle").text();
                                let hno = $(this).parent().prev().prev(".headerNo").text();
                                console.log(hno);
                                $("#updateHeaderModal input").attr("value", hTitle);
                                $(".headerNoInput").attr("value", hno);
                            })

                            // 새로 등록하기
                            $("#modalAddBtn").click(function(){
                                $newTitle = $("#newHeaderTitle").val();
                                console.log($newTitle);
                                
                                $.ajax({
                                    url:"addHeader.no",
                                    data: {
                                        headerTitle:$newTitle
                                    },success:function(status){
                                    	if(status === "success"){
	                                        console.log("성공");
                                    	}
                                    },error:function(){
                                        console.log("헤더 등록용 ajax 통신 실패");
                                    }
                                })
                            })
                            
                            // 수정하기
                            $("#modalUpdateBtn").click(function(){
                            	let newTitle = $("#updateHeaderModal input").val();
                            	let hno = $(".headerNoInput").val();
                            	
                            	
                            	$.ajax({
                               		url:"updateHeader.no",
                            		data:{
                            			headerNo: hno,
                            			headerTitle:newTitle
                            		},success:function(status){
                                    	if(status === "success"){
	                                        console.log("성공");
                                    	}
                                    },error:function(){
                                        console.log("헤더 수정용 ajax 통신 실패");
                                    }
                            		
                            	})
                            	
                            })
                            
                            //삭제하기
                            function delHeader(){
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
                                    checkArr.push($(this).parent().siblings(".headerNo").text())
                                    
                                }); 
                                console.log(checkArr);
                                $("#headerNoDel").attr("value", checkArr);
                                $("#postForm").attr("action", "deleteHeader.no").submit(); 
                            }
                        </script>


                        <br><br>
                    </div>

                </div>
                
            </div>   
            <!--푸터-->
            <jsp:include page="../common/footer.jsp" />         
        </div>
    </div>
  
</body>
</html>