<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.h4j.ITtranet.project.model.vo.Newsfeed" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
   
    .wrap{
       padding: 30px;
    }
    .menuname{
        display:inline-block;
        width: 300px;
        margin-left: 20px;
    }
    
    button{
        width: 80px;
        height: 35px;
        border: none;
        border-radius: 1mm;
        font-size: 13px;
        font-weight: bold;
        color: white;
    }
    .button1{
        background-color: rgb(165, 137, 177); 
        float: right;
        margin: 10px;
        border-radius: 1mm;
    }
    .button2{
        background-color: rgb(202, 183, 211);       
        float: right;
        margin: 10px;
        border-radius: 1mm;
    }
    .button3{
        background-color: rgb(160, 156, 163);       
        float: right;
        margin: 10px;
        margin-right: 40px;
        border-radius: 1mm;
    }
    .todo{
        margin-left: 50px;
    }

    tr{
        height: 40px;
        background-color: rgba(255, 255, 255, 0.57);
        border-bottom: 1px solid silver;
        font-size: 13.5px;
    }

    #newsfeed{
       padding: 15px;
       margin-left: 10px;
   }

   #feedwrite{
       border:1px solid rgb(190, 190, 190);
       border-radius: 5mm;
       width: 830px;
       height: 200px;
       padding: 10px;
       background-color: rgba(211, 196, 220, 0.47);
   }

   #write{
       width: 700px;
       height: 80px;
       border-radius: 2mm;
       border:1px solid rgb(190, 190, 190);
       margin-left:100px;
   }

   #file{
       margin-left: 100px;
       margin-top: 5px;
       font-size: 13px;
   }

   #writeok{
       float: right;
       margin-right: 20px;
       border-radius: 1mm;
       width: 70px;
   }

   .feedlist{
       border:1px solid rgb(190, 190, 190);
       border-radius: 5mm;
       background-color: rgba(224, 224, 224, 0.87);
       width: 830px;
       padding: 10px;
       margin-top: 20px;
       
   }
   .profile{
       display:inline-block;
       width: 70px;
       height: 70px;
       background-color: white;
       border-radius: 50%;
       border: 1px solid;
       margin: 10px;
   }
   .projectmem{
       display:inline-block;
       width: 500px;
       height: 30px;
       margin-left: 10px;
   }
   .feedcontent{
       width: 680px;
       margin-left: 105px;
       font-size: 13px;
   }
   .buttons{
       float: right;
       margin: 25px;
       font-size: 13px;
   }

   .btn1{
       background-color: rgb(165, 137, 177);
       border-radius: 1mm;
       width: 50px;
       height: 30px;
   }

   .btn2{
       background-color: rgb(160, 156, 163);  
       border-radius: 1mm;   
       width: 50px;
       height: 30px;
    }
   .reply{
       background-color: rgb(227, 210, 235);
       border-radius: 3mm;
       border: 1px solid rgb(204, 204, 204);
       width: 700px;
       margin-left: 100px;
       margin-top: 15px;
       padding: 15px;
   }
   .replylist{
       margin-bottom: 15px;
   }
   .date{
       float: right;
       margin-right: 70px;
   }
   .replycontent{
       width: 585px;
       height: 60px;
       border-radius: 2mm;
       border: 1px solid rgb(199, 198, 198);
   }
   .replyok{
       background-color: rgb(187, 159, 202);   
       margin-left: 8px;
       border-radius: 1mm;
       width: 70px;
   }

   ::placeholder{
       font-size: 13px;
   }

   .modal-overlay{
        width: 300px;
        height: 300px;
        padding: 15px;
        background-color :rgb(244, 240, 245);
        border: 1px solid rgb(199, 198, 198);
        border-radius: 2mm;
   }

   .todoButtons{
        margin-left: 120px;
        margin-top: 10px;
   }
   
   #modalid{
        width: 300px;
        height: 260px;
        position: absolute;
        margin: auto;
   }

</style>
</head>
<body>
<div class="back">
 <div class="innerBack">
 	<jsp:include page="../common/pageHeader.jsp" />
 	<jsp:include page="../common/userMenu.jsp" />
 	
 	<br clear="both">
 	<div style="position:relative">
 	<jsp:include page="../common/sidebar.jsp"  />
 		<div class="cont">
          <ul id="ac">
             <li class="division">
               <a href="#">프로젝트</a>
             </li>
                <div id="border">
		               <li class="menu1">
		                  <a href="list.pr">내 프로젝트</a>
		               </li>
		               <li class="menu1">
		                  <a href="#">프로젝트 만들기</a>
		               </li>
		               <li class="menu1">
		                  <a href="todo.pr">내 업무</a>
		               </li>
		               <li class="menu1">
		                  <a href="news.pr">뉴스피드</a>
		               </li>
            	</div>
            </ul>
         </div>
 

    <div class="mainOuter"> 
    <div class="wrap">   
        <h4 style="font-weight:bold;">${ list.get(0).prTitle }</h4>
        
        <!--담당 업무, 업무 버튼, 리스트-->
        <div class="menuname">
            <br>
            <h6 style="font-weight: bold;">&emsp;담당 업무</h6>
        </div>
            <button id="deleteTd" class="button3" onclick="deleteTodo();">삭제</button>
            <button id="updateTodo" class="button2" onclick="updateTodo();">상태 변경</button>
            <button id="newTodo" class="button1" onclick="openNew();">새 업무</button>
          
            <br><br>
        <table class="todo" width="780" style="text-align: center;" >
            <thead>
                <tr style="background-color: rgba(209, 189, 220, 0.7); border: none; font-size: 14px; ">
                    <th width="50"><input name="allCheck" id="allCheck" type="checkbox" /></th>
                    <th width="50">no</th>
                    <th width="340px">업무</th>
                    <th width="115">담당자</th>
                    <th width="115">상태</th>
                    <th width="115">만료일</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="t" items="${ todo }">
                <tr>
                    <td>&emsp;<input type="checkbox" class="selectTodo" name="RowCheck" value="${ t.todoNo }" /></td>
                    <td>
                  	 1
                    </td>
                    <td>${ t.todoTitle }</td>
                    <td>${ t.empName }</td>
                    <td>
	                   <c:choose>
	                       <c:when test="${ t.status eq 'W'}">
	                        	대기
	                       </c:when>
	                       <c:when test="${ t.status eq 'Y'}">
	                           	진행중
	                       </c:when>	                            		
	                       <c:when test="${ t.status eq 'O'}">
	                                                              완료
	                       </c:when>
	                       <c:when test="${ t.status eq 'L'}">
	                           	지연
	                        </c:when>	                            		
	                        <c:when test="${ t.status eq 'N'}">
	                           	삭제
	                        </c:when>
	                      </c:choose>    
                    </td>
                    <td>${ t.todoEnddate }</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
 
        <!-- 소식 뉴스피드 -->
        <div class="menuname">
            <br><br>
            <h6 style="font-weight: bold;">&emsp;소식</h6>
        </div>
        
        <div id="newsfeed">
           <!--게시물 작성-->
           <div id="feedwrite">
                <div class="profile">
                    <br>사진
                </div>
                 <form id="ttt" action="ninsert.pr" method="post" enctype="multipart/form-data">
				   <input type="hidden" name="prNo" value="${list.get(0).prNo}">
				   <input type="hidden" name="empNo" value="${ loginUser.empNo }">
				   <input id="write" name="nfContent" type="text" placeholder="&emsp;내용을 입력해주세요">
          		   <input id="upfile" type="file" name="upfile">
           		   <button type="submit" id="writeok"  style="background-color: rgb(187, 159, 202);">등록</button>
	  			 </form>
		    </div>
        
        <script>        
     
        
          // 게시글 작성용 ajax                
          /*
        $("#writeok").click(function(){
           
            if($("#write").val().trim().length != 0){   
               
               let data = new FormData($("#ttt")[0]); // 해당 아이디를 가진 form요소의 요청시 전달값들을 FormData객체 형태로 만드는 과정 
                 
               $.ajax({
                     url:"ninsert.pr",
                     data: data  // 아까 위에서 만든 data 전달
                     , processData: false
                     , contentType: false // formData를 써서 ajax로 값을 넘기기위해 processData, contentType 속성
                     , enctype:"multipart/form-data" // 파일 넘기려면 무조건 작성해야되는 옵션
                     , success: function(status){
                         console.log("뉴스피드 게시글 작성용 ajax통신 성공");
                         console.log(status);
                         location.reload();
                     }, error:function(){
                        console.log("뉴스피드 게시글 작성용 ajax통신 실패");
                     } 
                })
            }else{
              alertify.alert("게시글 작성 후 등록 요청 해주세요 !");
            }

      })
      */
        
        </script>
        
           
            
            <!-- 게시물 -->
            <c:forEach var="n" items="${ list }">
	            <div class="feedlist">
	                <div class="profile">
	                   <br>사진
	                </div>
	                <div class="projectmem">
	                    <b>${n.empName } &emsp;&emsp;&emsp;</b>
	                    <h style="font-size: 12px; color: dimgray;">${n.nfDate } &emsp; 13:01</h>
	                </div>
	                
	                <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
	                	<c:if test="${ loginUser.empNo eq n.empNo }">
                            <div class="buttons">
                                <button id="updateFeed" class="btn1" onclick="postFormSubmit(1);">수정</button>
                                <button id="deleteFeed" class="btn2" onclick="postFormSubmit(2);">삭제</button>
                            </div>
	               		</c:if>                     
	           
                            <form id="postForm" action="" method="post">
                                <input type="hidden" name="nfNo" value="${ n.nfNo }">
                                <input type="hidden" name="prNo" value="${ n.prNo }">
                            </form>	               		
	                   
                            <script>
                                function postFormSubmit(num){
                                    if(num == 1){ // 수정하기
                                        $("#postForm").attr("action", "updateForm.pr").submit();
                                    }else{ // 삭제하기
                                        $("#postForm").attr("action", "delete.pr").submit();
                                    }
                                }
                            </script>

					<!-- 게시글 내용 -->
	                <div class="feedcontent">
	                    <p>${n.nfContent}</p>
	                    <form id="postForm" action="" method="post">
                                <input type="hidden" name="nfNo" value="${ n.nfNo }">
                        </form>
	                    <c:choose>
							<c:when test="${ empty pra }">
								 첨부파일이 없습니다.
							</c:when>
							<c:otherwise>
								<c:forEach var="pra" items="${ pra }">
									<a href="${ pra.filePath }" download="${ pra.originName }" class="aTag">${ at.originName }</a><br>
								</c:forEach>
							</c:otherwise>
						</c:choose>	                    	       
	                </div>
	                
		
	            
    
	                <!--댓글-->
	                <div class="reply" style="font-size: 13px;">
	                    <div class="replylist">
                            <table>
                              <thead>
                                <tr>
                                    <td><b>&emsp;오트라</b> &emsp;&emsp;&emsp; </td>
                                    <td><span class="replycontents">안녕하세요 !</span>댓글 내용</td>
                                    <td>2022-01-10&emsp;11:48</span></td>
                                </tr>
                                <tr>         	 
                                    <td colspan="3">
                              		  <textarea id="replyContent" type="text" name="reply"  cols="80" rows="3" style="resize:none; margin:10px; border-radius: 2mm;"></textarea>                            	
                                    </td>
                                    <td>
                                        <button id="replyok" onclick="addReply(${n.nfNo});"><b>등록</b></button>  
                                    </td>
                                </tr>
                              </thead>
                              <tbody>
                              </tbody>
                            </table>
	                    </div>
	                    </div>
       </div>
       
	
    </c:forEach>

	<script>

	<!-- 댓글 script -->
	
		function addReply(int){
			

			var nfNo = ${n.nfNo};
			
			
			if($("#replyContent").val().trim().length != 0){
				$.ajax({
					url : "rinsert.pr",
					data : {
						refNo:nfNo,
						empNo:${ list.get(0).prNo },
						replyContent:$("#replyContent").val()
					}, success:function(status){
						if(status == "success"){
							selectReplyList();
							$("#replyContent").val("");
						}
					}, error:function(status){
						console.log("댓글작성용 ajax통신 실패")
					}
				})
			}else{
				alertify.alert("댓글 작성후 등록 요청해주세요!");
			}
		}
	</script>
	
    </div>
    </div>
    </div>
    </div>
   <!-- 새 업무 생성 모달 -->
<div class="modal-overlay" id="modalid">
    <div class="modal-window">
        <h6 class="modal-title">새 업무</h6>
            <div class="modal-body">
                <table class="makeTodo">
                    <tr style="background-color: transparent;">
                        <th><label for="tdTitle">업무명</th>
                        <td><textarea name="tdTitle" id="tdTitle" rows="1" cols="30"></textarea></td>
                    </tr>
                    <tr style="background-color: transparent;">
                        <th><label for="tdEnddate">만료일</label></th>
                        <td><textarea name="tdEnddate" id="tdEnddate" rows="1" cols="30"></textarea></td>
                    </tr>
                    <tr style="background-color: transparent;">
                        <th><label for="todoContent">메모</label></th>
                        <td><textarea name="todoContent" id="todoContent" rows="4" cols="30" ></textarea></td>
                    </tr>
                </table>
                    <div class="todoButtons">
                        <button type="button" onclick="closeTodo();" style="background-color: rgb(190, 190, 190);">취소</button>
                        <button type="button" onclick="insertTodo();" style="background: rgba(207, 168, 241, 0.45);">완료</button>
                    </div>   
                </div>
                
                <script>
              	
            	    closeTodo()
                
                	function openNew(){
                		$('#modalid').show();
                	}
                	
                	function closeTodo(){
                		$('#modalid').hide();
                	}
                	
                    function insertTodo(){
                        $.ajax({
                            url:"tdinsert.pr",
                            data:{
                                prNo:'${ list.get(0).prNo }',
	                			empNo:'${loginUser.empNo}',
	                			todoTitle:$("#tdTitle").val(),
	                			todoEnddate:$("#tdEnddate").val(),
	                			todoContent:$("#todoContent").val()
	                		}, success:function(status){
	                			if(status == "success"){
								    console.log("새 업무 ajax 통신 성공")
	                			    close();
                                    location.reload();
	                			}
	                		}, error:function(){
	                			console.log("새 업무 ajax 통신 실패")
                            }
                        })
                    }

                </script>
  
        </div>

 <!-- 업무 수정 모달 -->
<div class="modal-overlay" id="modalupdate">
    <div class="modal-window">
        <h6 class="modal-title">업무 수정</h6>
            <div class="modal-body">
                <table class="makeTodo">
                    <tr style="background-color: transparent;">
                        <th><label for="tdTitle">업무명</th>
                        <td><textarea name="tdTitle" id="tdTitle" rows="1" cols="30"></textarea></td>
                    </tr>
                    <tr style="background-color: transparent;">
                        <th><label for="tdEnddate">만료일</label></th>
                        <td><textarea name="tdEnddate" id="tdEnddate" rows="1" cols="30"></textarea></td>
                    </tr>
                    <tr style="background-color: transparent;">
                        <th><label for="todoContent">메모</label></th>
                        <td><textarea name="todoContent" id="todoContent" rows="4" cols="30" ></textarea></td>
                    </tr>
                </table>
                    <div class="todoButtons">
                        <button type="button" onclick="closeTodo();" style="background-color: rgb(190, 190, 190);">취소</button>
                        <button type="button" onclick="insertTodo();" style="background: rgba(207, 168, 241, 0.45);">완료</button>
                    </div>   
                </div>

  
        </div>
	


 

</body>



</html>