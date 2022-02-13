<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://kit.fontawesome.com/07e0557a32.js" crossorigin="anonymous"></script>
<style>
    .boardDetailOuter{
		width: 900px;
		box-sizing: border-box;
		margin:auto;
		background-color: rgba(211, 211, 211, 0.466);
        font-size: 14px;
    }
    #boardDetailTable{
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
	#boardDetailTable td, #boardDetailTable th{
		border-bottom: 1px solid rgb(184, 184, 184);
        border-top: 1px solid rgb(184, 184, 184);
	}
    .btn{
        border: none;
        margin: 5px;
        padding:0;
        font-size: 14px;
		font-weight: 900;
        border-radius: 1.05ex;
		background: rgba(162, 171, 255, 0.822);
        cursor: pointer;
    }
    .btn:hover{opacity: 50%;}
	#updateBtn, #btn-area>button{
		width : 70px;
		height : 30px;		
	}
    .formInput{
        width: 90%;
        height: 25px;
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
				                  <a href="#">공지사항</a>
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
                        <h2 style="margin-left:50px; font-weight: 900;"><a class="aTag" href="list.bo">자유게시판</a></h2>
                    </span>
                    <br clear="both">
                    <div class="boardDetailOuter" align="center">
                        
                        <br><br>
                        <button id="updateBtn" class="btn" style="float:right; margin-right:50px;"><a class="aTag">수정하기</a></button>
                        <br clear="both"><br>
                        <!-- 게시글 상세내역-->
                        <form id="insertForm" method="post" action="insert.bo" enctype="multipart/form-data" align="center">
                        	<input type="hidden" id="empNo" name="empNo" value="${ loginUser.empNo }">
                            <table id="boardDetailTable" align="center">
                                <tr>
                                    <th height="50">글제목</th>
                                    <td colspan="3">
                                        <input type="text" id="title" name="boardTitle" class="formInput">
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th height="120">첨부파일</th>
                                    <td colspan="2" id="file-area">
                                        <input type="file" name="upfile" class="formInput">
                                    </td>
                                                                       
                                    <td width="80">
                                        <button type="button" id="addFileBtn"><i class="fa-solid fa-plus"></i></button>
                                        <button type="button" id="removeFileBtn"><i class="fa-solid fa-minus"></i></button>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <th style="border:none;" height="30">
                                        내용
                                    </th>
                                </tr>
                                <tr>
                                    <td colspan="4" height="400px" align="center" >
                                        <textarea name="boardContent" id="content" cols="80" rows="20"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <div align="center" id="btn-area">
                                <button class="btn" onclick="goBack();">뒤로가기</button>
                                <button class="btn" type="submit">등록하기</button>
                            </div>
                            
                        </form>
                        <script>
                            function goBack(){
                                window.history.back();
                            }

                            $(function(){

                                let maxAppend = 1;
                                let text = "<input type='file' name='upfile' class='formInput'>";

                                $("#addFileBtn").on("click", function(){
                                    if(maxAppend >= 5){
                                        Swal.fire('첨부파일은 5개까지만 추가 가능합니다');
                                        return;
                                    }
                                    $("#file-area").append(text);
                                    maxAppend++;
                                });

                                $("#removeFileBtn").on("click", function(){
                                    if(maxAppend <= 1) return;
                                    $("input:last-child").remove();
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