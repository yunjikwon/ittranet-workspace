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
            width:80px;
            height:30px;
            border-radius: 3px;
            font-weight: 600;
        }

        /*모달창*/
        .modalcc{
            color:gray;
            border:none;
            width:40%;
            height:100%;
            margin:auto;
        }
        .modalok{
            color:skyblue;
            border:none;
            width:40%;
            height:100%;
            margin:auto;
        }
        /*
        .modal{
            width:300px;
            height:400px;
            margin:auto;
            vertical-align: middle;
        }
        */
        /* modal position(center)*/
        .modal {
          text-align: center;
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
    </style>
</head>
<body>
<div class="back">
	<div class="innerBack">
		<!-- 헤더 -->
	    <jsp:include page="../../common/pageHeader.jsp"/>
	    <!-- 메뉴바 -->
	   	<jsp:include page="../../common/userMenu.jsp"/>
	   	
	   	
	   	<br clear="both">
	   	
	   	<div style="position:relative">
		   	<!-- 사이드바 -->
		   	<jsp:include page="../approvalSidebar.jsp" />
		   	
		    <div class="mainOuter">
		        <br>
		        <div id="detailTitle">
		            	미처리 결재 상세
		        </div>
		        
		        <a id="listbtn" href="approvalWait.ap">목록으로</a>
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
		                	<th>프로젝트 제안</th>
		                    <td id="detailContent">자세한 사항 첨부파일 확인 부탁드립니다.<br>
		                        ${ b.drBusiness }
		                        
		                    </td>
		                </tr>
		
		                   
		            </table> <br>       
		            
		            <!-- ------------------------------------------------------------------------- -->
		            
		            <div style="text-align: center;">
		
		            <button class="apbtn" style="background-color:rgba(36, 151, 123, 0.26);"type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">
		                	반려처리
                	</button>
		                <!-- The Modal -->
		                <div class="modal" id="myModal1">
		                    <div class="modal-dialog">
			                    <div class="modal-content">
			                
			                
			                        <!-- Modal body -->
			                        <div class="modal-body" style="height: 80px; margin-top: 12px; font-weight: 600;">
			                           	 반려 처리가 완료되었습니다.
			                        </div>
			                
			                        <!-- Modal footer -->
			                        <div class="modal-footer">
			                            <button type="button" class="btn modalcc" data-dismiss="modal">CANCEL</button>
			                            <button type="button" class="btn modalok" data-dismiss="modal">OK</button>
			                        </div>
			                
		                    </div>
		                    </div>
		                </div>
		
		            <button class="apbtn" style="background-color:rgba(122, 39, 135, 0.26);" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">
		                	결재확인
		            </button>
		                <!-- The Modal -->
		                <div class="modal" id="myModal2">
		                    <div class="modal-dialog">
			                    <div class="modal-content">
			
			                        <!-- Modal body -->
			                        <div class="modal-body" style="height: 80px; margin-top: 12px; font-weight: 600;">
			                           	 결재 처리가 완료되었습니다.
			                        </div>
			                
			                        <!-- Modal footer -->
			                        <div class="modal-footer">
			                            <button type="button" class="btn modalcc" data-dismiss="modal">CANCEL</button>
			                            <button type="button" class="btn modalok" data-dismiss="modal">OK</button>
			                        </div>
			                
			                    </div>
		                    </div>
		                </div>
		        
		            </div>  <br>   
        		</div> <br><br>
        	
        	</div>
	    <!-- 푸터 -->
	    <jsp:include page="../../common/footer.jsp"/>
	    
		</div>    
	</div> 
</div>
    
</body>
</html>