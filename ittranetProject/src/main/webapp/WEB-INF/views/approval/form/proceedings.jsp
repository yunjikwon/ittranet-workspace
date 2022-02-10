<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        #title{
            font-size: 20px;
            font-weight: 700;
            margin-left: 120px;

        }
        #innerouter{
            width:80%;
            height:90%;
            background-color: white;
            margin:auto;
            margin-top: 10px;
            margin-bottom:50px;
        }
         table{
            width: 800px;
            height:400px;
            margin: auto;
            margin-top:20px;
        }
       td{
            padding: 15px;
            color:rgb(94, 94, 94);
            font-weight:700;
        }
        .formbtn{
            border:none;
            border-radius: 3px;
            width:80px;
            height:40px;
            font-size:15px;    
            color:color:rgb(94, 94, 94);        
        }
        input{
        	width:400px;
        	height:25px;
        	border:2px solid lightgray;
        	border-radius:5px;
        }
        textarea{
        	width:400px;
        	border:2px solid lightgray;
        	border-radius:5px;
        }
    </style>
</head>
<body>

<div class="back">
<div class="innerBack">
	<!-- 헤더 -->
    <jsp:include page="../../common/pageHeader.jsp"/>
    <!-- 메뉴바 -->
   	<jsp:include page="../../common/userMenu.jsp"/>
   	   	
   	<br clear="both">
	   	
   	<div style="position:relative">
   	
	   	<!-- 사이드바 -->
	   	<jsp:include page="../approvalSidebar.jsp" />
   	
		    <div class="mainOuter">
		        <br>
		        <div id="title">
		            회의록
		        </div>
		        <form action="" method="post" onsubmit="">
		        <div id="innerouter">
		            <table>
		                <tr>
		                    <td width=120>제목</td>
		                    <td width=450><input type="text" placeholder="내용을 입력해주세요" name="" value="" size="50"></td>
		                    <td><button class="formbtn" >결재선</button></td>
		                </tr>
		                <tr>
		                    <td>파일첨부</td>
		                    <td>
		                        <button style="width:60px; height:20px; font-size: 10px; border:none;">파일첨부</button>
		                        <br><br>
		                        <input type="text" placeholder="파일첨부"  name="" value="" size="50">
		                    </td>
		                    <td></td>
		                </tr>
		                <tr>
		                    <td>회의안건</td>
		                    <td><input type="text" placeholder="회의안건"  name="" value="" size=""> 시간</td>
		                    <td></td>
		                </tr>
		                <tr>
		                    <td>회의일</td>
		                    <td><input type="date" name="" value="" size="50"></td>
		                    <td></td>
		                </tr>
		                <tr>
		                    <td colspan="2">
		                    </td>
		                    <td>
		                        <button class="formbtn" style="background-color: rgba(158, 214, 252, 0.44);">
		                        작성
		                        </button>
		                    </td>
		                </tr>
		            </table>
		        </div>
		        </form>
		
		    </div>
		</div>	

    
    <!-- 푸터 -->
    <jsp:include page="../../common/footer.jsp"/>
</div>    
</div>
</html>