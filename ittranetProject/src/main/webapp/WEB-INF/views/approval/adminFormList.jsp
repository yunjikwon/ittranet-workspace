<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
		/*메뉴바 픽스 스타일*/
     	.attendance_mn{
     		color:#000000;
     	}
     	#innerouter{
            width:90%;
            heigth:800px;
            background-color: white;
            margin:auto;
            margin-top: 10px;
            margin-bottom:100px;
        }
		#adminFormTitle{
			font-size: 25px;
            font-weight: 700;
            margin-left: 70px;
            display: inline-block;
		}
       .formBox{
          margin:auto;
          margin:15px;
          border: 1px solid lightgray;
          height:80px;
          background-color:white;
          box-shadow: 2px 4px 4px 1px gray;
      }
      .formTitle{
          display: inline-block;
          font-size: 20px;
          margin-top:25px;
          margin-left: 50px;
          font-weight: 700;
          color:rgb(94, 94, 94);
      }
      #s{
      	margin:auto;
      	width:90%;
      }
      .delBtn{
          display: inline-block;
          border: none;
          border-radius: 4px;
          width: 70px;
          height: 30px;
          background-color: rgb(248, 60, 60);
          color:white;
          float: right;
          margin: 25px 25px 10px 25px;
      }
</style>
<body>
<div class="back">
	<div class="innerBack">
	<!--헤더-->
	<jsp:include page="../common/pageHeader.jsp" />
	<!-- 메뉴바 -->
   	<jsp:include page="../common/adminMenu.jsp"/>
   	
   	
   	<br clear="both">
   	
	   	<div style="position:relative">
                 <!--사이드바-->
                <jsp:include page="../common/sidebar.jsp" />
                <!-- 각 메뉴에 맞게 수정 -->    	
		        <div class="cont">
		            <ul id="ac">
		                <li class="division">
		                    <a href="#">결재관리</a>
		                </li>
		                <div id="border">
				               <li class="menu1">
				                  <a href="adminForm.dr">기안 양식 관리</a>
				               </li>
                               <li class="menu1">
                                    <a href="adminApWait.ap">관리자 권한 관리</a>
                                </li>
				               
		            	</div>
		            </ul>
		         </div>
		   	
		    <div class="mainOuter">
		    <br>
		    <div id="adminFormTitle">
	            	기안양식 관리
	        </div>
			        
	           <div id="innerouter" style="padding:5% 5%;">
	           		<div id="s">
		           		<div class="formBox">
					        <div class="formTitle">지출결의서</div>
					        <button class="delBtn">삭제</button>
					    </div>
					    <div class="formBox">
					        <div class="formTitle">추가예산신청</div>
					        <button class="delBtn">삭제</button>
					    </div>
					    <div class="formBox">
					        <div class="formTitle">사업계획서</div>
					        <button class="delBtn">삭제</button>
					    </div>
					    <div class="formBox">
					        <div class="formTitle">연장근무신청</div>
					        <button class="delBtn">삭제</button>
					    </div>
					    <div class="formBox">
					        <div class="formTitle">회의록</div>
					        <button class="delBtn">삭제</button>
					    </div>
					    <div class="formBox">
					        <div class="formTitle">시말서</div>
					        <button class="delBtn">삭제</button>
					    </div>
	           		</div>
			   </div><!-- innerOuter 끝 -->
			</div><!-- mainOuter 끝 -->
		    <!-- 푸터 -->
		    <jsp:include page="../common/footer.jsp"/>
		</div>
	</div> 
</div>
	
	
</body>
</html>