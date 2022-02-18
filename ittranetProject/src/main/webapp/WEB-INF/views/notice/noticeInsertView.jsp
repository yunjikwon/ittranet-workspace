<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .noticeDetailOuter{
		width: 900px;
		box-sizing: border-box;
		margin:auto;
		background-color: rgba(211, 211, 211, 0.466);
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
	#updateBtn, #btn-area>button{
		width : 70px;
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
	select{
		width:90px;
		height: 30px;
	}
</style>
</head>
<body>
    <div class="back">
        <div class="innerBack">
            <!--헤더-->
            <jsp:include page="../common/pageHeader.jsp" />
            <!--메뉴바-->
            <jsp:include page="../common/userMenu.jsp" />

            <br clear="both">
            <div style="position:relative">
                
                <!--사이드바-->
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
                <!--구현시작!-->
                <div class="mainOuter">
                    <br>
                    <span style="margin: 10px;">
                        <h2 style="margin-left:50px; font-weight: 900;"><a class="aTag" href="list.no">공지사항</a></h2>
                    </span>
                    <br clear="both">
                    <div class="noticeDetailOuter" align="center">
                        
                        <br><br>
                        <br clear="both"><br>
                        <!-- 게시글 상세내역-->
                        <form id="insertForm" method="post" action="insert.no" enctype="multipart/form-data" align="center">
                        	<input type="hidden" id="empNo" name="empNo" value="${ loginUser.empNo }">
                            <table id="noticeDetailTable" align="center">
                                <tr>
									<th width="100" height="50">글제목</th>
									<td align="center" width="400">
										<input type="text" id="title" name="noticeTitle" class="formInput" required>
									</td>
									<th width="100">말머리</th>
									<td width="100">
										<select name="headerTitle" id="headerTitle">
											<c:forEach var="h" items="${ headerList }">
			                                	<option value="${ h.headerNo }">${ h.headerTitle }</option>
											</c:forEach>
		                            	</select>
		                            		<input type="hidden" id="headerNo" name="headerNo" value="">
									</td>
								</tr>
                                <tr>
                                    <th height="120">첨부파일</th>
                                    <td colspan="2" id="file-area">
                                       		<input type="file" name="upfile" class="formInput" >
                                    </td>                                                                       
                                    <td width="80">
                                        <button type="button" id="addFileBtn"><i class="fa fa-solid fa-plus"></i></button>
                                        <button type="button" id="removeFileBtn"><i class="fa fa-solid fa-minus"></i></button>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <th style="border:none;" height="30">
                                        내용
                                    </th>
                                </tr>
                                <tr>
                                    <td colspan="4" height="400px" align="center" >
                                        <textarea name="noticeContent" id="content" cols="80" rows="20" style="resize:none" required></textarea>
                                    </td>
                                </tr>
                            </table>
                            <div align="center" id="btn-area">
                                <button class="btnStyle" onclick="goBack();">뒤로가기</button>
                                <button class="btnStyle" type="submit">등록하기</button>
                            </div>
                        </form>
                        
                        <script>
                        	// select값 넣기
                        	$("#headerTitle").click(function(){
                       			let $value = $("#headerTitle option:selected").val();
                       			$("#headerNo").attr("value", $value);
                        	});


                        	//뒤로가기
                            function goBack(){
                                window.history.back();
                            }
							
                        	// 파일 추가 삭제
                            $(function(){

                                let maxAppend = 1;
                                let text = "<input type='file' name='upfile' class='formInput' required>";

                                $("#addFileBtn").on("click", function(){

                                                                      
                                    if(maxAppend >= 5){
                                        Swal.fire({
                                        	text : '첨부파일은 5개까지만 추가 가능합니다'
                                        });
                                        return;
                                    }
                                    $("#file-area").append(text);
                                    maxAppend++;
                                });

                                $("#removeFileBtn").on("click", function(){
                                    if(maxAppend <= 1) return;
                                    $("input[name=upfile]:last-child").remove();
                                    maxAppend--;
                                })
                            })
                        	
                        
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