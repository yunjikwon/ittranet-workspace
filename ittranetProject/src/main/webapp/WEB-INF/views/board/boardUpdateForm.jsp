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
    #boardDetailTable{
		width: 700px;
		border-collapse: collapse;
		margin: auto;
    }
	.aTag, .aTag:hover, .fileTag{
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
	input[type=file]{
        font-size: 12px;
    }
    button[name=xmarkBtn]{
        width:20px;
        height:20px;
        font-size: 12px;
        font-weight: 900;
        vertical-align: middle;
        text-align: center;
        border: none;
        border-radius: 1.5ex;
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
                        <h2 style="margin-left:50px; font-weight: 900;"><a class="aTag" href="list.bo">자유게시판</a></h2>
                    </span>
                    <br clear="both">
                    <div class="boardDetailOuter" align="center">
                        
                        <br clear="both"><br>
                        <!-- 게시글 상세내역-->
                        <form id="updateForm" name="updateForm" method="post" action="update.bo" enctype="multipart/form-data" align="center">
                        	<input type="hidden" id="empNo" name="empNo" value="${ loginUser.empNo }">
                            <input type="hidden" id="bno" name="boardNo" value="${ b.boardNo }">
                            <table id="boardDetailTable" align="center">
                                <tr>
                                    <th height="50" width="100">글제목</th>
                                    <td colspan="3">
                                        <input type="text" id="title" name="boardTitle" class="formInput" required value="${ b.boardTitle }">
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th height="120">첨부파일</th>
                                    <td colspan="2" id="file-area" align="left">                                   	

                                        <c:if test="${ not empty atList}"> 
                                            <p style="font-size:12px; font-weight:900; margin:0;">현재 업로드된 파일</p>                                                   
                                            <c:forEach var="at" items="${ atList }">                                
                                                <a class="fileTag" name="reupfile"> ${ at.originName }
                                                    <button type="button" name="xmarkBtn">x</button> <br>
                                                    <input type="hidden" name="originName" value="${ at.originName }">
                                                    <input type="hidden" name="filepath" value="${ at.filePath }"> 
                                                    <input type="hidden" class="atNo" name="atNo" value="${ at.attachmentNo }">
                                                </a>  
                                            </c:forEach>
                                        </c:if>
                                        
                                      	<input type="file" name="reupfile" class="formInput" ><br>
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
                                    <td colspan="4" height="400px" align="center" ><br>
                                        <textarea name="boardContent" id="content" cols="80" rows="20" style="resize:none" required>${ b.boardContent }</textarea><br>
                                    </td>
                                </tr>
                            </table>
                            <div align="center" id="btn-area">
                                <button type="button" class="btnStyle" onclick="delBoard();">삭제하기</button>
                                <button type="button" class="btnStyle" onclick="goBack();">뒤로가기</button>
                                <button class="btnStyle" type="submit">수정하기</button>
                            </div>
                            <input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
                        </form>
                        
                		<script>
                        	//뒤로가기
                            function goBack(){
                                reset();
                                window.history.back();
                            }
                        	
                            let fileNoArr = new Array();
                            
                        	$(".fileTag").on("click", "button", function(e){
                                console.log("delete file");
                                let $attaNo = $(this).parent().children(".atNo").val();
                                console.log($attaNo);
                                $(this).parent().remove();
                                
                         		fileNoArr.push($attaNo);
                         		$("#fileNoDel").attr("value", fileNoArr); 
                         		console.log(fileNoArr)
                            })
                        	
                        	// 글 삭제하기
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
									$("#updateForm").attr("action", "delete.bo").submit();  
								   
								  }
								})
							}
							
                            let atList = '<c:out value="${atList}"/>';

							
                        	// 파일 추가 삭제
                            $(function(){
                            	
                                $("#addFileBtn").on("click", function(){
                                    let text = "<input type='file' name='reupfile' class='formInput' required>";
                                    
                                    console.log( $("[name=reupfile]").length);
                                    if(atList.length=0? maxAppend=1 : maxAppend=$("[name=reupfile]").length){

                                        
                                        console.log(maxAppend);     
                                                                        
                                        if(maxAppend >= 5){
                                            Swal.fire({
                                                text : '첨부파일은 5개까지만 추가 가능합니다'
                                            });
                                            return;
                                        }
                                        $("#file-area").append(text);
                                        maxAppend++;
                                    }

                                    // 마지막 요소 한개만 선택해서 삭제하는게 안됨!
                                    $("#removeFileBtn").on("click", function(){
                                        if(maxAppend <= 1) return;
                                        $("input[name=reupfile]:last-child").remove();
                                        maxAppend--;
                                    });
                                });   
                                   
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