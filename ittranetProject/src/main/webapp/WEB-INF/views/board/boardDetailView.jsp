<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.boardDetailOuter{
		border: 1px solid black;
		width: 800px;
		box-sizing: border-box;
    }
    #boardDetailTable{
		width: 700px;
		border-collapse: collapse;
    }
	.aTag, .aTag:hover{
		text-decoration: none;
		color: black;
		cursor: pointer;
	}
	#content-area{
		margin:30px; 
		border-radius: 1.05ex;
		padding:10px;
		height:380px;
		background-color: rgba(211, 211, 211, 0.466);
	}
	#boardDetailTable td, #boardDetailTable th{
		border-bottom: 1px solid lightgrey;
	}
	#updateBtn, #replyInsertBtn{
		border: 1px solid black;
            width : 70px;
            height : 30px;
            margin: 5px;
            font-size: 14px;
            font-weight: 900;
            border: none;
            border-radius: 1.05ex;
            background: rgba(162, 171, 255, 0.822);
	}
</style>
</head>
<body>
	 <!--헤더자리-->
	<jsp:include page="../common/header.jsp" />
	<br clear="both">

    <!-- 게시글 전체 영역-->
    <div class="boardDetailOuter">
		<br><br>
		<button id="updateBtn" style="float:right; margin-right:50px;"><a class="aTag">수정하기</a></button>
		<br><br>
        <!-- 게시글 상세내역-->
        <table id="boardDetailTable" align="center">
            <tr>
                <th height="30">글제목</th>
                <td colspan="3" align="center">제목입니다</td>
            </tr>
            <tr>
                <th width="100" height="30">작성자</th>
                <td width="250">김철수</td>
                <th width="100">작성일</th>
                <td width="250">2020-01-01</td>
            </tr>
            <tr>
                <th height="50">첨부파일</th>
                <td colspan="3"></td>
            </tr>
			<tr>
				<th style="border:none;">
					내용
				</th>
			</tr>
            <tr>
                <td colspan="4" height="400px" >
                    <p id="content-area">
                        게시판 내용자리!
                    </p>
                </td>
            </tr>
        </table>
        <br>
        <hr>
        <!-- 댓글 영역 -->
        <div id="reply-area" align="center">
			<br>
            <table id="replyTable" width="700" >
                <thead>
                    <tr>
                        <th colspan="5">
                            <textarea name="" id="" cols="75" rows="5" style="resize:none"></textarea>
                        </th>
                        <th colspan="2">
                            <button id="replyInsertBtn">등록</button>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th colspan="2" width="100" height="30">이트라</th>
                        <td width="400">안녕하세요?</td>
                        <td width="110">2020-01-01 10:33</td>
                        <td width="30">수정</td>
                        <td width="30">삭제</td>
                        <td width="30">답글</td>
                    </tr>
                    <tr>
                        <th width="20" height="30"></th>
                        <th width="80">ㄴ관리자</th>
                        <td width="400">안녕하세요?</td>
                        <td width="110">2020-01-01 10:33</td>
                        <td width="30">수정</td>
                        <td width="30">삭제</td>
                        <td width="30">답글</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <br clear="both">
	<!-- 푸터바 영역 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>