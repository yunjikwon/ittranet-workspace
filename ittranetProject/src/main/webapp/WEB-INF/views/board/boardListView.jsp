<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
-->
<style>
    .boardListOuter{
        margin:auto;
        width: 900px;
        box-sizing: border-box;
        font-size: 14px;
        /*margin-left: 500px;*/
        
    }
    .btnStyle{
    border: none;
    margin: 5px;
    padding:0;
    font-size: 14px;
    font-weight: 900;
    border-radius: 1.05ex;
    background: rgba(162, 171, 255, 0.822);
    cursor: pointer;
    }
    .btnStyle:hover{opacity: 50%;}
    #addBtn, #searchBtn{
        width : 70px;
        height : 30px;
    }
    #paging-area{
        text-align: center;
    }
    
    .pageBtn{
        width : 25px;
        height : 30px;
        font-size: 14px;
        font-weight: 900;
        border: none;
        border-radius: 1.05ex;
        background: rgba(195, 200, 247, 0.822);
    }
    .pageBtn:hover{
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
    .board_mn{
		color: #000000;
	}   
</style>
</head>
<body>	
	 
    <div class="back">
        <div class="innerBack">
            <!--헤더-->
            <jsp:include page="../common/pageHeader.jsp" />
            <!-- 글 삭제시 나타나는 alert창 위한 구문 -->
			<c:if test="${ not empty alertMsg }">
				<script>
					Swal.fire({
					  position: 'middle',
					  icon: 'success',
					  text: '${ alertMsg }',
					  showConfirmButton: false,
					  timer: 1500
					})
				</script>
				<c:remove var="alertMsg"  />
				
			</c:if>
            <!--메뉴바-->
            <jsp:include page="../common/userMenu.jsp" />
            <br clear="both">
            <div style="position:relative">
                 <!--사이드바-->
                <jsp:include page="../common/sidebar.jsp" />
                <!-- 각 메뉴에 맞게 수정 -->    	
		        <div class="cont">
		            <ul id="ac">
		                <li class="division">
		                    <a href="#">게시판</a>
		                </li>
		                <div id="border">
				               <li class="menu1">
				                  <a href="#">공지사항</a>
				               </li>
				               <li class="menu1">
				                  <a href="list.bo">자유게시판</a>
				               </li>
				              
		            	</div>
		            </ul>
		         </div>
                <!--구현시작!-->
             
                <div class="mainOuter">
                    <br>
                    <span style="margin: 10px;">
                        <h2 style="margin-left:50px; font-weight: 900;"><a class="aTag" href="list.bo">자유게시판</a></h2>
                    </span>
                    <!-- 게시글 전체 영역-->
                    <div class="boardListOuter" align="center">
                        
                        <button id="addBtn" class="btnStyle" style="float:right"><a class="aTag" href="insertForm.bo">새글등록</a></button>
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
                                            <c:if test="${ !empty atList }">
                                            	&nbsp;&nbsp;<i class="fa-solid fa-paperclip"></i>
                                            </c:if>
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
                            <button id="searchBtn" class="btnStyle"><a class="aTag" href="search.bo">검색</a></button>
                        </div>
                        <br>
                    </div>

                </div>
            </div>
           
            <!--푸터-->
            <jsp:include page="../common/footer.jsp" />
        </div>
    </div>

  
</body>
</html>