<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	    .boardListOuter{
        	margin:auto;
            width: 900px;
            /*margin-left: 500px;*/
        }
       #addBtn, #searchBtn{
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
        #paging-area{
            text-align: center;
        }
        #boardListTable{
            font-size: 14px;
        }
        .pageBtn{
        	border: 1px solid black;
            width : 25px;
            height : 30px;
            font-size: 14px;
            font-weight: 900;
            border: none;
            border-radius: 1.05ex;
            background: rgba(195, 200, 247, 0.822);
        }
        .pageBtn:hover, #addBtn:hover, #searchBtn:hover{
            opacity: 50%;
        }
        .aTag, .aTag:hover{
            text-decoration: none;
            color: black;
            cursor: pointer;
        }
        .boardTitle{
            cursor: pointer;
        }
        
</style>
</head>
<body>
	 <!--헤더자리-->
	<jsp:include page="../common/header.jsp" />
  
	

    <!-- 게시글 전체 영역-->
    <div class="boardListOuter" align="center">
        <span align="left" style="margin-left:50px;">
            <h2>자유게시판</h2>
        </span>
        <button id="addBtn" style="float:right"><a class="aTag" href="insert.bo">새글등록</a></button>
        <br clear="both">
        <!-- 게시글 전체보기 리스트 영역-->
        <table id="boardListTable" class="table thead-light table-hover">
            <thead>
                <tr align="center">
                    <th width="50px">No.</th>
                    <th width="450px">글제목</th>
                    <th width="125px">작성자</th>
                    <th width="125px">작성일</th>
                    <th width="80px">조회수</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="b" items="${ list }">
	                <tr align="center">
	                    <td class="bno">${ b.boardNo }</td>
	                    <td  class="boardTitle">${ b.boardTitle }
	                    	
	                    </td>
	                    <td>${ b.empName }</td>
	                    <td>${ b.createDate }</td>
	                    <td>${ b.count }</td>
	                </tr>
	        	</c:forEach>
                
            </tbody>          
        </table>
        <br>
        
        <script>
        	$(function(){
        		$("#boardListTable>tbody>tr").click(function(){
        			location.href = 'detail.bo?bno=' + $(this).children(".bno").text();
        		})
        	})
        </script>
        <!-- 페이징 바 영역-->
        <div id="paging-area">
        	<c:choose>
        		<c:when test="${ pi.currentPage eq 1 }">
        	    	<button class="pageBtn" disabled>&lt;</button>
        	    </c:when>
        	    <c:otherwise>
        	    	<button class="pageBtn"><a class="aTag" href="list.bo?cpage=${ pi.currentPage-1 }">&lt;</a></button>
        	    </c:otherwise>
        	</c:choose>
        	
        	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
         		<button class="pageBtn"><a class="aTag" href="list.bo?cpage=${ p }">${ p }</a></button>
         	</c:forEach>
           
            <c:choose>
            	<c:when test="${ pi.currentPage eq pi.maxPage }">
            		<button class="pageBtn" disabled>&gt;</button>
            	</c:when>
            	<c:otherwise>
            		<button class="pageBtn"><a class="aTag" href="list.bo?cpage=${ pi.currentPage+1 }">&gt;</a></button>
            	</c:otherwise>
            </c:choose>
        </div>
        <br>
        
        
        <div id="search-area" align="center">
            <select name="search" id="">
                <option value="title">글제목</option>
                <option value="writer">작성자</option>
                <option value="number">글번호</option>
            </select>
            <input type="text" id="keyword">
            <button id="searchBtn"><a class="aTag" href="search.bo">검색</a></button>
        </div>
        <br>
    </div>
    <br clear="both">
	<!-- 푸터바 영역 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>