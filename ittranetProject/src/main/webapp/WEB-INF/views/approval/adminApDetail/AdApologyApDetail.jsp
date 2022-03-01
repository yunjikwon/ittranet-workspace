<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
       /*메뉴바 픽스 스타일*/
     	.attendance_mn{
     		color:#000000;
     	}
     	#innerouter{
            width:90%;
            height:90%;
            background-color: white;
            margin:auto;
            margin-top: 10px;
        }

        #detailTitle{
           font-size: 20px;
            font-weight: 700;
            margin-left: 50px;
            display: inline-block;

        }
        #listbtn{
        	text-decoration:none;
            display: inline-block;
            margin-left:700px;
            border:none;
            border-radius: 3px;
            width:90px;
            height: 35px;
            background-color: rgba(122, 39, 135, 0.26);
            color:black;
            text-align:center;
            padding-top: 5px;
        }       
        #contentArea{
            width:90%;
            min-height: 300px; 
            border-collapse: collapse;
            margin: auto;
            margin-top:20px;
            font-size: 16px;
        }
        #contentArea td,th{
            border:1px solid rgb(224, 224, 224);
            padding:10px 5px;
        }
        #detailContent{
			padding:15px 40px;
            height:200px;
        }
        #contentArea span{
            margin-top:10px;
            margin:7px;
        }
        .contentTitle{
            font-size: 15px;
            font-weight: 600;
            text-align: right;
            
        }
		.apbtn{
            margin:auto;
            margin-top:20px;
            margin-left: 40px;
            margin-right: 40px;
            border:none;
            width:130px;
            height:40px;
            border-radius: 3px;
            font-weight: 600;
        }

        /*모달창*/
        .modalcc{
            color:gray;
            border:none;
            width:200px;
            height:100%;
        }
        .modalok{
            color:skyblue;
            border:none;
            width:200px;
            height:100%;
        }

        /* modal position(center)*/
        .modal {
          text-align: center;
          width:500px;
        }
        @@media screen and (min-width: 768px) {
          .modal:before {
            display: inline-block;
            vertical-align: middle;
            content: " ";
            height: 100%;
          }
        }
        .modal-dialog {
            display: inline-block;
            text-align: left;
            vertical-align: middle;
        }
        .modal-content {
        	width:400px;
        	magin:auto;
        }
        .modal-body{
        	margin:auto;
        }
    </style>
    
</head>
<body>
	<div class="back">
		<div class="innerBack">
		<!-- 헤더 -->
	    <jsp:include page="../../common/pageHeader.jsp"/>
	    <!-- 메뉴바 -->
   		<jsp:include page="../../common/adminMenu.jsp"/>
	   	
	   	
	   	<br clear="both">
	   	
	   	<div style="position:relative">
		   	<!--사이드바-->
                <jsp:include page="../../common/sidebar.jsp" />
                <!-- 각 메뉴에 맞게 수정 -->    	
		        <div class="cont">
		            <ul id="ac">
		                <li class="division">
		                    <a href="#">결재관리</a>
		                </li>
		                <div id="border">
				               <li class="menu1">
				                  <a href="adminForm.dr">기안 양식 관리</a>
				               </li>
                               <li class="menu1">
                                    <a href="adminApWait.ap">관리자 권한 관리</a>
                                </li>
				               
		            	</div>
		            </ul>
		         </div>
		   	
		    <div class="mainOuter">
		        <br>
		        <div id="detailTitle">
		            	${ b.apStatus } 결재 상세
		        </div>
		        
		        <a id="listbtn" href="adminApWait.ap">목록으로</a>
	            <div id="innerouter" style="padding:5% 5%;">
		            <table id="contentArea" align="center">
		                <tr>
		                    <th colspan="2" 
		                    style="font-size: 18px; text-align:left; padding-left: 15px;">
		                       	${ b.drDivision }
		                    </th>
		                </tr>
		                <tr>
		                    <th width="200px">기안자</th>
		                    <td>
		                    	${ b.empName }
		                    </td>
		                </tr>
		                <tr>
		                    <th>결재자</th>
		                    <td>
		                    	<c:forEach var="l" items="${ aline }">
		                        	<c:if test="${ l.drNo eq b.drNo }">
			                           		${ l.empName }&nbsp;${l.job } &nbsp;&nbsp;
		                           	 </c:if>
		                        </c:forEach>
		                    </td>
		                </tr>
		                <tr>
		                    <th>제목</th>
		                    <td>${ b.drTitle }</td>
		                </tr>
		                <tr>
		                    <th>첨부파일</th>
		                    <td>${ at.filePath }</td>
		                </tr>
		                <tr>
		                	<th>내용</th>
		                    <td colspan="2" id="detailContent">
		                      	
		                        ${ b.drContent }
		                        
		                    </td>
		                </tr>
		
		                   
		            </table> <br>      
		            
		            <!----------------------------------------------------------------------------->
		            <!-- jQuery 라이브러리 -->
					<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
					<!-- 부트스트랩에서 제공하고 있는 스타일 -->
					<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
					<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
					<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		            <div style="text-align: center;">
		
					<button class="apbtn" style="background-color:rgba(36, 151, 123, 0.26);"type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">
		                	관리자 권한 반려
                	</button>
		                <!-- The Modal -->
		                <div class="modal" id="myModal1">
		                    <div class="modal-dialog">
			                    <div class="modal-content">
			                		<!-- Modal header-->
			                        <div class="modal-header" style="margin-top: 10px; font-weight: 700; font-size:20px;">
			                           	   	 &nbsp;&nbsp; 반려
			                        </div>
			                        <!-- Modal body -->
			                        <div class="modal-body">
			                        	관리자 의견<br><br>
			                        <textarea style="width:350px; height:150px; border:1px solid lightgray; align:center;"></textarea>
			                        </div>
			                
			                        <!-- Modal footer -->
			                        <div class="modal-footer">
			                            <button type="button" class="btn modalcc" data-dismiss="modal">CANCEL</button>
			                            <button type="button" class="btn modalok" data-dismiss="modal" onclick="postFormSubmit(1);">OK</button>
			                        </div>
			                
		                    	</div>
		                    </div>
		                </div>
		
		            <button class="apbtn" style="background-color:rgba(122, 39, 135, 0.26);" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">
		                	관리자 권한 결재
		            </button>
		                <!-- The Modal -->
		                <div class="modal" id="myModal2">
		                    <div class="modal-dialog">
			                    <div class="modal-content">
			                		<!-- Modal header-->
			                        <div class="modal-header" style="margin-top: 10px; font-weight: 700; font-size:20px;">
			                           	   	 &nbsp;&nbsp; 결재
			                        </div>
			                        <!-- Modal body -->
			                        <div class="modal-body">
			                        	관리자 의견<br><br>
			                        <textarea style="width:350px; height:150px; border:1px solid lightgray; align:center;"></textarea>
			                        </div>
			                
			                        <!-- Modal footer -->
			                        <div class="modal-footer">
			                            <button type="button" class="btn modalcc" data-dismiss="modal">CANCEL</button>
			                            <button type="button" class="btn modalok" data-dismiss="modal" onclick="postFormSubmit(2);">OK</button>
			                        </div>
			                
		                    	</div>
		                    </div>
		                </div>
		        
		            </div>  <br>   
        		</div> <br><br>
        	
        	
        	<form id="postForm" action="" method="post">
        		<input type="hidden" name="drNo" value="${ b.drNo }">
        	</form>
        	<script>
	       		function postFormSubmit(num){
	       			if(num==1){
	       				$("#postForm").attr("action", "updateAdminReject.ap").submit();
	       			}else {
	       				$("#postForm").attr("action", "updateAdminComplete.ap").submit();
	       			}
	       		}
        	</script>
        	
        	
        	</div>
	    <!-- 푸터 -->
	    <jsp:include page="../../common/footer.jsp"/>
	    
		</div>    
	</div> 
</div>
    
</body>
</html>