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
     .searchwrap{
        border: 1px solid rgb(202, 202, 202);
        background-color: rgb(237, 237, 237);
        border-radius: 2mm;
        width: 300px;
        height: 200px;
        padding : 15px;
    }
    .result{
        margin-top: 10px;
        border: 1px solid rgb(202, 202, 202);
        border-radius: 1mm;
        background-color: white;
        width: 290px;
        height: 110px;
        padding: 5px;
    }
    #search{
        border: 1px solid rgb(202, 202, 202);
        border-radius: 1mm;
        height: 25px;
        width: 200px;
    }
    #searchButton{
        float: right;
        background-color: rgb(187, 159, 202);
    }
    .cancleButton{
        background-color: rgb(190, 190, 190);
        margin-top:10px;
        margin-right: 10px;
        float: right;
    }
    .okButton{
        background-color: rgba(207, 168, 241, 0.45);
        margin-top:10px;
        float: right;
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
            	<input type="hidden" name="empNo" value="${loginUser.empNo}">
                <ul style="font-size: 14px;">
                    <li><p>
                        프로젝트명
                        <input type="text" id="prTitle" name="prTitle">
                    </p></li>
                    <li><p>담당자 &emsp;&emsp;
                        <input type="text" name="prSize">
                        <a data-toggle="modal" data-target="#mem" onclick="searchMem();">
				          	사원 선택
				        </a>
                    </p></li>
                    <li><p>만기일 &emsp;&emsp;&emsp;&emsp; <input type="date" name="prEnddate" id="prEnddate">
                    </p></li>
                    <li><p>내용</p>
                        &emsp;&emsp;<textarea name="prContent" id="prContent" cols="50" rows="10"></textarea>
                    </li>
                    <li><p>로고 &emsp;&emsp;&emsp;&emsp;&emsp;
                        <input type="text" name="prLogo">
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
    
	    <!-- 사원 선택 -->
		<div id="mem" class="modal">
		    <div class="modal-dialog" style="max-width: 700px;">
		        <div class="modal-content">
		        </div>
		    </div>
		</div>	
		
<div class="searchwrap">
    <div class="name">
        <input type="text" id="search" val="" placeholder="이름을 입력하세요">
        <button onclick="searchName();" id="searchButton">검색</button>
    </div>
    <div class="result">
        <table>
            <tbody>

            </tbody>
        </table>
    </div>
    <button class="okButton">확인</button>
    <button data-dismiss="modal" onclick="cancelButton">취소</button>
</div>


</body>
<script>
function searchName(){
	  let search = $(".search").val();
	    			
	  $.ajax({
	    type : 'GET',
	    url:"addmem.pr",
	    data:{
	    	search:search
	    }, success : function(list){
			let arr="";
		    for(let i in list){
                 arr +="<tr class='rows'>"
			    	 + "<td>" + <input type='radio' name='newMem'> + "</td>"
			    	 + "<td name='team'>"+ list[i].team + "</td>"
			    	 + "<td name='job'>"+ list[i].job + "</td>"
			    	 + "<td name='empName'>"+ list[i].empName + "</td>"    						   
		    		 + "</tr>";
		    	}
	   	  $('.result > tbody').html(arr);
	   	  $("#search").val('');
	    }, error:function(){
	    	console.log("멤버추가 ajax 통신 실패");
	    }
	 })
  }
  
  function cancelButton(){
	  $(".searchwrap").hide();
  }
</script>
</html>