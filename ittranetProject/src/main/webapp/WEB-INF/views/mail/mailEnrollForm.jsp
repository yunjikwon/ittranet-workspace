<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .middle{
             width:800px;
             height:800px;
             font-family: 'Gowun Dodum', sans-serif;
    }
    .buttonbar{
        float:right;
        width:800px;
        height:80px;
            
    }


    .mailsend{
              width:800px;
              height:750px;
    }
    .maildetail{
                width:800px;
                height:70px;
                font-size:15px;

    }
    .maildetail div{
                    width:800px;
    }
    .maildetail input{
                      float:right;
                      width:700px;

    }
    .mailsend textarea{
                    width:800px;
                    height:500px;

    }
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>
<body>
    <div class="middle">
        
        <br><br>
        <div class="buttonbar">
            <button type="button" class="btn btn-secondary">내게쓰기</button>
            <button type="button" class="btn btn-success">보내기</button>
            <button type="button" class="btn btn-light">취소</button>
        </div>

        <div class="mailsend">

			<form id="enrollForm" method="post" action="insert.ml" enctype="multipart/form-data">
            <div class="maildetail">

			<input type="hidden" id="sdaccount" name="senderAccount" va>
			
                <div class="receiver">
                    받는사람 <input type="text" id="rvaccount" name="receiverAcoount" required>
                </div>

                <br>
                <div class="subject">
                    제목  <input type="text" id="title" name="mailTitle" >
                </div>

                <br>
                <div class="attach">
                    첨부 <input type="file" multiple>
                </div>

                <br>
                <br>
                <textarea placeholder="내용을 입력해주세요."></textarea>

            </div>

            
        </div>
    </div>
</body>
</html>