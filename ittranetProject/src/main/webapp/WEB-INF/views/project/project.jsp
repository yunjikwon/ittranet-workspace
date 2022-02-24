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
            <button class="button3">삭제</button>
            <button class="button2">상태 변경</button>
            <button class="button1">새 업무</button>
            <!-- <a data-toggle="modal" data-id="${ list.get(0).prNo }" class="button1" href="#modalid">새 업무</a> -->

            <br><br>
        <table class="todo" width="780" style="text-align: center;" >
            <thead>
                <tr style="background-color: rgba(209, 189, 220, 0.7); border: none; font-size: 14px; ">
                    <th width="50"></th>
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
                    <td>&emsp;<input type="checkbox"></td>
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
				   <input id="write" name="nfContent" type="text" name="write" placeholder="&emsp;내용을 입력해주세요">
          		   <input id="file" type="file" name="file">
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
                             <!--<input type="hidden" name="filePath" value="${ n.changeName }" >--> 
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


	                <div class="feedcontent">
	                    <p>${n.nfContent}</p>
	                    <p></p>
	                    
	                
	                </div>
	                
		
	            
    
	                <!--댓글-->
	                <div class="reply" style="font-size: 13px;">
	                    <div class="replylist">
	                        <b>오트라</b> &emsp;&emsp;&emsp; 
	                        <span class="replycontents">안녕하세요 !</span>
	                        <span class="date">2022-01-10&emsp;11:48</span>
	                    </div>
	                    
	                    <!-- 댓글 작성 -->
	                    <input id="replycontent" type="text" name="reply" placeholder="&emsp;댓글을 입력해주세요">
	                    <button id="replyok" onclick="addReply"><b>등록</b></button>
	                </div>
	            
	          
	            </div>
            </c:forEach> 
        </div>
        
    


    </div>
    </div>
    </div>
    </div>
    

</body>

<!-- 새 업무 생성 모달 -->
<div class="modal hide" id="modalid">


 <div class="modal-header">
  <h5 class="modal-title">새 업무</h5>

   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    <span aria-hidden="true">&times;</span>
   </button>
  </div>

  <div class="modal-body">
    <input type="text" name="bookId" id="bookId" value="어케 나오나"/> 
  </div>
</div>

<script>
$(document).on("click", ".open-modalid", function () { // 클릭하면 id가 modalid인 모달을 연다는 의미이다.
    var myBookId = $(this).data('id'); // a태그에서 data-'id'(''는 강조의 의미)가 정의하고 있는 값을 가져와서 myBoodId에 넣는다.
                                       // 예를 들어, a태그에서 data-title="제목"이라고 되어있다면
                                       // 이 코드는 var myBookId = $(this).data('title')이 될 것이다.
    $(".modal-body #bookId").val( myBookId ); // modal의 body에 있는,
                                              // name과 id가 bookId인 태그의 value를(현재는 value="") myBookId로 바꿔준다.
});
</script>


</html>