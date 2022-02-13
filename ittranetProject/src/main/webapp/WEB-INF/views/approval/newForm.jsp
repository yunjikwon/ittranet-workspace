<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    
<style>
    .FormcontentArea{
        text-align: center;
        margin:auto;
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
        color:rgb(94, 94, 94);     
    }
    #cEx{
        font-size: 14px;
    }
    .modal-title{
    	font-size: 22px;
        font-weight: 700;
        color:rgb(94, 94, 94);
    }
</style>
</head>
<body>   
<!-- 새기안 모달창 -->    	
<div class="modal-header">
  <h5 class="modal-title" id="newFormModalLabel">새기안 작성</h5>
  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
    <span aria-hidden="true">x</span>
  </button>
</div>

<!-- Modal body -->
<div class="modal-body">
	<div class="FormcontentArea">

        <br>
        <div class="content" onclick="location.href='expenditure.fo'">
            <div id="cTitle">지출결의서</div>
            <hr>		        
            <div id="cEx">
               	 업무처리시 지출되는<br> 비용 사전 승인
            </div>
        </div>

        <div class="content" onclick="location.href='budget.fo'">
            <div id="cTitle">추가예산신청</div>
            <hr>
            <div id="cEx">
                	프로젝트 비용<br> 추가 신청
            </div>
        </div>
        <div class="content" onclick="location.href='overtime.fo'">
            <div id="cTitle">연장근무신청</div>
            <hr>
            <div id="cEx">
                	연장 근무 신청 양식
            </div>
        </div>
        <div class="content" onclick="location.href='proceedings.fo'">
            <div id="cTitle">회의록</div>
            <hr>
            <div id="cEx">
                	회의록 양식
            </div>
        </div>
        <div class="content" onclick="location.href='bussiness.fo'">
            <div id="cTitle">사업계획서</div>
            <hr>
            <div id="cEx">
              	 새로운 프로젝트/사업시<br>계획서 양식
            </div>
        </div>
        <div class="content" onclick="location.href='apology.fo'">
            <div id="cTitle">시말서</div>
            <hr>
            <div id="cEx">
                	업무과실등에 대한<br> 사유 기재한 문서
            </div>
        </div>

    </div>
</div>
<br><br>



</body>
</html>