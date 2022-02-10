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
            
               
    }
    table{
          text-align:center;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
                <button class="btn btn-success">메일쓰기</button>
                <button class="btn btn-danger">삭제</button>
            </div>
            <br><br><br>

            <div class="table table-hover" align="center">
                <table>
                    <tr>
                        <th style="width:50px;"><input type="checkbox"></th>
                        <th style="width:50px;">☆</th>
                        <th style="width:150px;">보낸사람</th>
                        <th style="width:500px;">제목</th>
                        <th style="width:200px;">날짜</th>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>★</td>
                        <td>김과장</td>
                        <td>이트라사원 자료 하나만 찾아주세요.</td>
                        <td>2022-01-19 07:10</td>
                    </tr>
                </table>
            </div>

            페이징바 자리ㅎㅎ

        </div>
        
        <jsp:include page="../common/footer.jsp" />


    </div>
    </div>
    </div>


</body>
</html>