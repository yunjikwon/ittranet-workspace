<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .middle{
           /*margin:auto;*/
           margin:10px;
           width:800px;
           height:800px;
          }
    .buttonbar{
               width:800px;
               height:50px;
    }
    .btn{
         float:right;
         margin:5px; 
         font-family: 'Gowun Dodum', sans-serif;      
    }
    .mailcontent{
                 font-family: 'Gowun Dodum', sans-serif;
    }
    #title{
           font-size:1.5em;
           font-weight:900;
           line-height:3em;
    }
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="middle">

        <div class="buttonbar">
            <button type="button" class="btn btn-secondary">답장</button>
            <button type="button" class="btn btn-warning">스팸</button>
            <button type="button" class="btn btn-danger">삭제</button>
            <button type="button" class="btn btn-light">목록</button>
        </div>

        <div class="mailcontent">
            <div id="title">${m.mailtitle}</div>
            <div id="senddate">2021-01-20 12:22</div>
            <br>
            <div>${ m.sdpp }</div>
            <div>받는사람 : 이트라사원 <ittra> </div>
            <br>
            <hr>

            <div id="content">
                1월 22일 11:00 예정이었던 회의가 변경되어 안내드립니다<br>
                착오 없으시길 바랍니다.<br>
                <br>
                변경 전 : 2022년 1월 22일 11:00<br>
                변경 후 : 2022년 1월 22일 14:00
            </div>
        </div>
    </div>

</body>
</html>