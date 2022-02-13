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

		<input type="hidden" name="mno" value="${ m.sendMailNo }">
		
        <div class="mailcontent">
            <div>${ m.mailtitle }</div>
            <div>${ m.sendDate }</div>
            <br>
            <div>${ m.sdpp }</div>
            <div>${ m.rvpp }</div>
            <br>
            <hr>

            <div>${ m.mailContent }</div>
        </div>
    </div>

</body>
</html>