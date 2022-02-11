<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
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
        	width:530px;
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
		            추가예산신청
		        </div>
		        <form action="" method="post" onsubmit="">
		        <div id="innerouter">
		            <table  class="formTable">
		                <tr>
		                    <td width=200>제목</td>
		                    <td width=450><input type="text" placeholder="내용을 입력해주세요" name="" value="" size="50"></td>
		                    <td>
		                    	<button class="formbtn">
		                    		<a data-toggle="modal" data-target="#line" data-backdrop="static" role="button">
				                      	결재선
				                    </a>		                    		
	                    		</button>
                    		</td>
		                </tr>
		                <tr>
		                    <td>파일첨부</td>
		                    <td>
		                        <button style="width:60px; height:20px; font-size: 10px; border:none;">파일첨부</button>
		                        <br><br>
		                        <input type="text" placeholder="파일첨부"  name="" value="" size="50">
		                    </td>
		                    <td></td>
		                </tr>
		                <tr>
		                    <td>사유</td>
		                    <td><input type="text" placeholder="사유"  name="" value="" size="50"></td>
		                    <td></td>
		                </tr>
		                <tr>
		                    <td>비용청구</td>
		                    <td><input type="text" placeholder="비용청구"  name="" value="" size="50"></td>
		                    <td></td>
		                </tr>
		                <tr>
		                    <td colspan="2"><textarea  name="" value="" cols="62" rows="10">위 금액을 청구하오니, 자세한 항목은 첨부파일을 확인해주시기 바랍니다.
		                    </textarea></td>
		                    <td>
		                        <br><br><br><br><br><br><br>
		                        <button class="formbtn" style="background-color: rgba(158, 214, 252, 0.44);">
		                        작성
		                        </button>
		                    </td>
		                </tr>
		            </table>
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
</html>