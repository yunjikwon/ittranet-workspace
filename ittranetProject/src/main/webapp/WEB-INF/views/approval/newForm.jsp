<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
<style>
    .contentArea{
        
        height: 600px;
        text-align: center;
        margin:auto;
    }
    #title{
        font-size: 20px;
        margin:10px;
        margin-left: 20px;
        font-weight: 700;
        color:rgb(94, 94, 94);
    }
    .content{
        display: inline-block;
        width:40%;
        height:20%;
        margin:10px;
        padding:10px;
        text-align: center;
        box-shadow: 1px 1px 5px rgba(94, 94, 94, 0.8);
        cursor:pointer;
    }
    #cTitle{
        font-size: 17px;
        font-weight: 600;        
    }
    #cEx{
        font-size: 14px;
    }
</style>
</head>
<body>
<!--  
<button class="approvalbtn" style="background-color:rgba(36, 151, 123, 0.26);"type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">
                반려처리</button>
-->
                
<!-- 새기안 모달창 -->
<!-- The Modal -->
<div class="modal" id="newFormModal">
    <div class="modal-dialog">
    <div class="modal-content">
    	
		<div class="modal-header">
          <h5 class="modal-title" id="newFormModalLabel">새기안 작성</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">x</span>
          </button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
		<div class="contentArea">

		        <div id="newFormtitle">새기안 작성</div>
		
		        <hr width="95%">
		        <br>
		        <div class="content">
		            <div id="cTitle">지출결의서</div>
		            <hr>		        
		            <div id="cEx">
		               	 업무처리시 지출되는<br> 비용 사전 승인
		            </div>
		        </div>
		
		        <div class="content">
		            <div id="cTitle">추가예산신청</div>
		            <hr>
		            <div id="cEx">
		                	프로젝트 비용<br> 추가 신청
		            </div>
		        </div>
		        <div class="content">
		            <div id="cTitle">연장근무신청</div>
		            <hr>
		            <div id="cEx">
		                	연장 근무 신청 양식
		            </div>
		        </div>
		        <div class="content">
		            <div id="cTitle">회의록</div>
		            <hr>
		            <div id="cEx">
		                	회의록 양식
		            </div>
		        </div>
		        <div class="content">
		            <div id="cTitle">사업계획서</div>
		            <hr>
		            <div id="cEx">
		              	 새로운 프로젝트/사업시<br>계획서 양식
		            </div>
		        </div>
		        <div class="content">
		            <div id="cTitle">시말서</div>
		            <hr>
		            <div id="cEx">
		                	업무과실등에 대한<br> 사유 기재한 문서
		            </div>
		        </div>
		
		    </div>
        </div>

        
    </div>
    </div>
</div>



</body>
</html>