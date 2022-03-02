<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
    	/*메뉴바 픽스 스타일*/
     	.approval_mn{
     		color:#000000;
     	}
    
        #formtitle{
            font-size: 20px;
            font-weight: 700;
            margin-left: 120px;

        }
        #innerouter{
            width:80%;
            height:90%;
            background-color: white;
            margin:auto;
            margin-top: 10px;
            margin-bottom:50px;
        }
        .formTable{
            width: 800px;
            height:400px;
            margin: auto;
            margin-top:20px;
        }
       .formTable td{
            padding: 15px;
            color:rgb(94, 94, 94);
            font-weight:700;
        }
        .formTable input{
        	width:350px;
        	height:30px;
        	border:2px solid lightgray;
        	border-radius:5px;
        }
        .formTable textarea{
        	width:400px;
        	border:2px solid lightgray;
        	border-radius:5px;
        }
        .formbtn{
            border:none;
            border-radius: 3px;
            width:80px;
            height:40px;
            font-size:15px;    
            color:color:rgb(94, 94, 94);        
        }
        #appLineText{
        	font-weight:600;
        	color:rgb(94, 94, 94);
        	font-size:17px;
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
		        <div id="formtitle">
		            사업계획서
		        </div>
		        <form action="insert.dr?formNo=1" method="post" enctype="multipart/form-data">
		        <div id="innerouter">
		            <table  class="formTable">
		                <tr>
		                    <td width=200>제목</td>
		                    <td width=450><input type="text" name="drTitle"placeholder="내용을 입력해주세요" size="50"></td>
		                    <td>
		                    	<button type="button" class="formbtn">
		                    		<a data-toggle="modal" data-target="#line" data-backdrop="static" role="button">
				                      	결재선
				                    </a>
				                    <input type="hidden" id="team" name="team">		                    		
	                    		</button>
                    		</td>
		                </tr>
		                <tr>
		                    <td> <label for="upfile">파일첨부</label></td>
		                    <td>
		                        <input type="file" id="upfile" class="form-control-file border" name="upfile" placeholder="파일첨부" size="50">
		                    </td>
		                    <td id="appLine">
		                    	<span id="appLineText">결재자 </span> <br> 
		                    </td>
		                </tr>	
		                <tr>
		                    <td></td>
		                    <td><input type="text" placeholder="합계" size="50"></td>
		                    <td></td>
		                </tr>
		                <tr>
		                    <td>프로젝트 제안</td>
		                    <td>
		                    	<textarea name="drBusiness" id="" cols="47" rows="10"></textarea>
		                    </td>
		                    <td>
		                        <br><br><br><br><br><br><br>
		                        <button class="formbtn" style="background-color: rgba(158, 214, 252, 0.44);">
		                        	작성
		                        </button>
		                    </td>
		                </tr>
		            </table>
		            <input type="hidden" name="drDivision" value=5>
		            <input type="hidden" name="empNo" value=${ loginUser.empNo }>
		        </div>
		        </form>
		
		    </div>
		</div>	
		
	<!-- 결재선 모달창 -->
	<div id="line" class="modal fade" tabindex="-1" role="dialog">
	    <div class="modal-dialog" style="max-width: 700px;">
	        <div class="modal-content">
		   		<jsp:include page="line.jsp"/>
	        </div>
	    </div>
	</div>		

    
    <!-- 푸터 -->
    <jsp:include page="../../common/footer.jsp"/>
</div>    
</div>   
</body>
</html>