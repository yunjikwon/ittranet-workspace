<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap{
        border: 1px solid red;
        width: 900px;
    }
    .secondwrap{
        width: 800px;
        margin-left: 20px;
        background-color: rgb(224, 224, 224);
        padding: 30px;
    }
    
    input[type="text"],[type="search"]{
        border-radius: 1mm;
        border: 1px solid rgb(192, 191, 191);
        width: 250px;
        height: 35px;
        margin-left: 30px;
        margin-bottom: 20px;
    }

    #information{
        border-radius: 1mm;
        border: 1px solid rgb(192, 191, 191);
        margin-left: 85px;
        margin-bottom: 20px;
    }
    button{
        width: 70px;
        height: 35px;
        border-radius: 1mm;
        border: none;
        font-size: 13px;
        font-weight: bold;
        color: white;
        float: right;
        margin-right: 30px;
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
 	<jsp:include page="../common/sidebar.jsp"  />
 		<div class="cont">
          <ul id="ac">
             <li class="division">
               <a href="#">프로젝트</a>
             </li>
                <div id="border">
		               <li class="menu1">
		                  <a href="list.pr">내 프로젝트</a>
		               </li>
		               <li class="menu1">
		                  <a href="newpro.pr">프로젝트 만들기</a>
		               </li>
		               <li class="menu1">
		                  <a href="todo.pr">내 업무</a>
		               </li>
		               <li class="menu1">
		                  <a href="news.pr">뉴스피드</a>
		               </li>
            	</div>
            </ul>
         </div>
    <div class="mainOuter"> 
    <div class="wrap">
        <h4 style="font-weight:bold;">프로젝트 만들기</h4>
        <br>

        <div class="secondwrap">
            <form in="newProject" method="post" action="npro.pr">
                <ul style="font-size: 14px;">
                    <li><p>
                        프로젝트명
                        <input type="text" id="prTitle" name="prTitle">
                    </p></li>
                    <li><p>담당자 &emsp;&emsp;
                        <input type="text" name="prSize">
                    </p></li>
                    <li><p>만기일 &emsp;&emsp;&emsp;&emsp;
                    	<select name="prEnddate" id="" >
                    		<optiond value="none">없음</optiond>
                    		<optiond value="yet">미정</optiond>
                    		<optiond value="date"><input type="date"></optiond>
                    	</select>
                    </p></li>
                    <li><p>내용</p>
                        &emsp;&emsp;<textarea name="prContent" id="prContent" cols="50" rows="10"></textarea>
                    </li>
                    <li><p>로고 &emsp;&emsp;&emsp;&emsp;&emsp;
                        <input type="file" name="prLogo">
                    </p></li>
                </ul>

                <button style="background-color: rgb(202, 183, 211);" type="submit">확인</button>
                <button style="background-color: rgb(160, 156, 163);">취소</button>
            </form>
                <br><br>
        </div>
    </div>
    <br><br>
    </div></div></div>
</body>
</html>