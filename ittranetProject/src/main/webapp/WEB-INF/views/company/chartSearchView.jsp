<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .chartOuter{
		width: 900px;
		box-sizing: border-box;
		margin:auto;
        font-size: 14px;
        height: 650px;
    }
    .chartOuter ul, .chartOuter li{
        text-decoration: none;
        list-style: none;
        padding:0;
        margin-bottom: 20px;
    }
    .liBtn, .noneBtn{
        font-size: 14px;
		font-weight: 900;
        border:none;
        border-radius: 1.05ex;
        width: 100px;
    }
    .noneBtn{height: 30px; background: rgb(148, 148, 148);}
    .liBtn{height:40px; background: rgba(134, 131, 131, 0.308);}
    #department-area>li{
        float:left;
        margin-left: 25px;
        margin-right: 25px;
        display:block;  
    }
    .liBtn:hover{
        opacity: 50%;
        cursor: pointer;
    }
    /*button효과*/
    #department-area>li>ul>li+a{display:block;}
	.aTag, .aTag:hover{
		text-decoration: none;
		color: black;
		cursor: pointer;
	}
    .btnStyle{
        border: none;
        margin: 5px;
        padding:0;
        font-size: 14px;
		font-weight: 900;
        border-radius: 1.05ex;
		background: rgb(228, 227, 227);
        cursor: pointer;
        width : 130px;
		height : 50px;	
    }
    .btnStyle:hover{opacity: 50%;}
	#updateBtn, #btn-area>button{
		width : 70px;
		height : 30px;		
	}
    .formInput{
        width: 90%;
        height: 25px;
    }
    #addFileBtn, #removeFileBtn{
    	width: 25px;
    	height: 25px;
        font-size: 14px;
        font-weight: 900;
        border: none;
        border-radius: 1.05ex;
        background: rgba(195, 200, 247, 0.822);
    }
	.company_mn{
		color: #000000;
	}
	
</style>
</head>
<body>
    <div class="back">
        <div class="innerBack">
            <!--헤더-->
            <jsp:include page="../common/pageHeader.jsp" />
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
		                    <a href="#">조직도</a>
		                </li>
		                <div id="border">
				               <li class="menu1">
				                  <a href="chartMain.co">조직도</a>
				               </li>
				               <li class="menu1">
				                  <a href="search.co">상세조회</a>
				               </li>
				              
		            	</div>
		            </ul>
		         </div>
                <!--구현시작!-->
                <div class="mainOuter">
                    <br>
                    <span style="margin: 10px;">
                        <h2 style="margin-left:50px; font-weight: 900;"><a class="aTag" href="">조직도 상세조회</a></h2>
                    </span>
                    
                    <div class="chartOuter" align="center">
                        
                        <br><br>
                        
                        <br clear="both"><br>
                    </div>
                    <script>
                        
                    </script>
                </div>
                
            </div>   
            <!--푸터-->
            <br clear="both">
            <jsp:include page="../common/footer.jsp" />         
        </div>
    </div>
  
</body>
</html>