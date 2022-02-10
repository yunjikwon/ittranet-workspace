<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Document</title>
<style>
	.wrap{
        width: 900px;
    }
    .outer{
           width:1200px;
           height:800px;
          }
    .outer div{float:left;}
    .top{
         width:1200px;
         height:200px;
    }
    .sidebar{
         width:300px;
         height:600px;
        }
    .middle{
            width:880px;
            height:580px;

    }

    #buttonbar{
    	float:right;
    	padding-left:5px;        
               
    }
    table{
          text-align:center;
    }
    
    /* 버튼 그라데이션 존예 */
    .w-btn {
    	position: relative;
    	border: none;
    	display: inline-block;
    	padding: 15px 30px;
    	border-radius: 15px;
    	font-family: "paybooc-Light", sans-serif;
    	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    	text-decoration: none;
    	font-weight: 800;
    	transition: 0.25s;
	}
    .w-btn-gra1 {
    	background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    	color: white;
	}
	.w-btn-gra2{
		background: linear-gradient(to top right, #33ccff 0%, #ff0000 100%);
		color: white;
	}

</style>

</head>
<body>
    <div class="back">
        <div class="innerBack">
			<jsp:include page="../common/pageHeader.jsp" />
 			<jsp:include page="../common/userMenu.jsp" />

 		<br clear="both">
 		<div style="position:relative">
			<jsp:include page="../mail/mailSideBar.jsp" />
			
        <div class="mainOuter">
			
            <br><br>
            <div id="buttonbar">
            	<button class="w-btn w-btn-gra1" type="button">메일쓰기</button>
                <button class="w-btn w-btn-gra2" type="button" data-toggle="modal" data-target="#exampleModal">삭제</button>
            
            	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">

        </button>
      </div>
      <div class="modal-body">
정말로 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger">네</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니요</button>
      </div>
    </div>
  </div>
</div>
            </div>
            <br><br><br>

            <div class="table table-hover" align="center">
                <table id="mailalllist" style="background-color:white">
                	<thead>
                    	<tr>
                        	<th style="width:50px;"><input type="checkbox"></th>
                        	<th style="width:50px;">☆</th>
                        	<th style="width:150px;">보낸사람</th>
                        	<th style="width:500px;">제목</th>
                        	<th style="width:200px;">날짜</th>
                    	</tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="m" items="${ list }">
                    		<tr>
                        		<td><input type="checkbox"></td>
                        		<td>★</td>
                        		<td>${ m.empName }</td>
                        		<td>${ m.mailTitle }</td>
                        		<td>${ m.sendDate }</td>
                    		</tr>
                    	</c:forEach>
                    </tbody>
                </table>
                <script>
            		$(function(){
            			$("#mailalllist>tbody>tr").click(function(){
            				location.href = 'detail.ml?mno=' + $(this).children(".mno").text();
            			});
            		})
            	</script>
            </div>

          	<div id="pagingArea">
    	<ul class="pagination justify-content-center">
	        <c:choose>
            	<c:when test="${ pi.currentPage eq 1 }">
                   			<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="alllist.ml?cpage=${ pi.currentPage-1 }">&lt;</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="alllist.ml?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="alllist.ml?cpage=${ pi.currentPage+1 }">&gt;</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
        
        <jsp:include page="../common/footer.jsp" />


    </div>
    </div>
    </div>


</body>
</html>