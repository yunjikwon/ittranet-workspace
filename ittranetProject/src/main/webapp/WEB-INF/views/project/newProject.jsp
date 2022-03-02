<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- alert창 꾸미기 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
    .wrap{
        padding: 30px;
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
        width: 200px;
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
        border: none;
        font-size: 13px;
        font-weight: bold;
        color: white;
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
        margin-left: 16px;
        margin-top: 10px;
        border: 1px solid rgb(202, 202, 202);
        border-radius: 1mm;
        background-color: white;
        width: 290px;
        height: 110px;
        padding: 5px;
        overflow: auto
    }
   .result2{
        margin-left: 16px;
        margin-top: 10px;
        border: 1px solid rgb(202, 202, 202);
        border-radius: 1mm;
        background-color: white;
        width: 290px;
        height: 110px;
        padding: 5px;
        overflow: auto
    }
    #search{
        border: 1px solid rgb(202, 202, 202);
        border-radius: 1mm;
        height: 25px;
        width: 100px;
    }
    #searchButton{
        float: right;
        background-color: rgb(187, 159, 202);
        width : 80px;
        height: 35px;
        border-radius: 1mm;
    }
    .cancleButton{
        background-color: rgb(190, 190, 190);
        margin-top:10px;
        margin-right: 10px;
        margin: auto;
        border-radius: 1mm;
        width: 80px;
        height: 30px;
    }
    .okButton{
        background-color: rgba(207, 168, 241, 0.45);
        margin-top:10px;
        float: right;
        margin: auto;
        border-radius: 1mm;
        width: 80px;
        height: 30px;
    }
    .modal-content{
    	padding: 10px;
    	height : 450px;
    	width : 400px;
        background-color: rgb(245, 225, 250);
    }
    .memaddb{
        width: 100px;
        border-radius: 1mm;
        background-color: rgb(204, 185, 223);
        height: 30px;
        width: 80px;
    }
    #prLogo{
        border: 1px solid rgb(202, 202, 202);
        border-radius: 1mm;
        width: 180px;
        margin-left: 30px;
    }
    #prContent{
        border: 1px solid rgb(202, 202, 202);
        border-radius: 1mm;
        margin-left: 30px;
    }
    #prEnddate{
        border: 1px solid rgb(202, 202, 202);
        border-radius: 1mm;
        width: 180px;
        margin-left: 30px;
    }
    #okb{
        width: 100px;
        border-radius: 1mm; 
        margin: 10px;
        float: right;
        margin-right: 30px;
        height: 30px;
    }
    #cancelb{
        width: 100px;
        border-radius: 1mm; 
        margin: 10px; 
        float: right;
        margin-right: 30px;
        height: 30px;
    }
    .selectMem{
        height: 35px;
        width: 80px;
        border-radius: 1mm;
        margin: auto;
        background-color: rgb(187, 159, 202);
    }
    #proMemberList{
        margin-left: 30px;
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
            <form id="newProject" method="post" action="npro.pr">
            	<input type="hidden" name="empNo" value="${loginUser.empNo}">
                <table>
                    <tr >
                        <td style="width: 110px;">프로젝트명</td>
                        <td><input type="text" id="prTitle" name="prTitle"></td>
                    </tr>
                    <tr >
                        <td>담당자</td>
                        <td>
                             <div  id="proMember">  <span id="proMemberList"> </span> 
                             <button class="memaddb">
                                <a data-toggle="modal" data-target="#mem">
                                     사원 선택
                                </a>                        
                            </button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>만기일</td>
                        <td><input type="date" name="prEnddate" id="prEnddate"></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea name="prContent" id="prContent" cols="50" rows="10"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>로고</td>
                        <td>
                            <select name="prLogo" id="prLogo">
                                <option value="resources/images/projectlogo/adjust.png">adjust</option>
                                <option value="resources/images/projectlogo/ball.png">ball</option>
                                <option value="resources/images/projectlogo/book.png">book</option>
                                <option value="resources/images/projectlogo/bookmark.png">bookmark</option>
                                <option value="resources/images/projectlogo/building.png">building</option>
                                <option value="resources/images/projectlogo/callender.png">callender</option>
                                <option value="resources/images/projectlogo/cart.png">cart</option>
                                <option value="resources/images/projectlogo/drink.png">drink</option>
                                <option value="resources/images/projectlogo/exercise.png">exercise</option>
                                <option value="resources/images/projectlogo/film.png">film</option>
                                <option value="resources/images/projectlogo/global.png">global</option>
                                <option value="resources/images/projectlogo/home.png">home</option>
                               <option value="resources/images/projectlogo/hotel.png">hotel</option>                      	
                               <option value="resources/images/projectlogo/image.png">image</option>
                               <option value="resources/images/projectlogo/language.png">language</option>
                               <option value="resources/images/projectlogo/light.png">light</option>
                               <option value="resources/images/projectlogo/list.png">list</option>
                               <option value="resources/images/projectlogo/love.png">love</option>
                               <option value="resources/images/projectlogo/money.png">money</option>
                               <option value="resources/images/projectlogo/people.png">people</option>
                               <option value="resources/images/projectlogo/setting.png">setting</option>
                               <option value="resources/images/projectlogo/teaching.png">teaching</option>
                               <option value="resources/images/projectlogo/tour.png">tour</option>
                               <option value="resources/images/projectlogo/wallet.png">wallet</option>               
                           </select>
                        </td>
                    </tr>
                </table>

                <button style="background-color: rgb(202, 183, 211);" id="okb">확인</button>
                <button style="background-color: rgb(160, 156, 163);" id="cancelb">취소</button>
            </form>    
                <!--
                       <ul style="font-size: 14px;">
                    <li><p>
                   	     프로젝트명
                        <input type="text" id="prTitle" name="prTitle">
                    </p></li>
                    <li>
                        <div id="proMember">담당자 &emsp;&emsp;</div>
	                        <span id="proMemberList"> </span>
                        <button>
                        <a data-toggle="modal" data-target="#mem">
				         	사원 선택
				        </a>                        
                        </button>

                    </p></li>
                    <li><p>만기일 &emsp;&emsp;&emsp;&emsp; <input type="date" name="prEnddate" id="prEnddate">
                    </p></li>
                    <li><p>내용</p>
                        &emsp;&emsp;<textarea name="prContent" id="prContent" cols="50" rows="10"></textarea>
                    </li>
                    <li><p>로고 &emsp;&emsp;&emsp;&emsp;&emsp;
                        <select name="prLogo">
 			                <option value="resources/images/projectlogo/adjust.png">adjust</option>
 			                <option value="resources/images/projectlogo/ball.png">ball</option>
 			                <option value="resources/images/projectlogo/book.png">book</option>
 			                <option value="resources/images/projectlogo/bookmark.png">bookmark</option>
 			                <option value="resources/images/projectlogo/building.png">building</option>
 			                <option value="resources/images/projectlogo/callender.png">callender</option>
 			                <option value="resources/images/projectlogo/cart.png">cart</option>
 			                <option value="resources/images/projectlogo/drink.png">drink</option>
 			                <option value="resources/images/projectlogo/exercise.png">exercise</option>
 			                <option value="resources/images/projectlogo/film.png">film</option>
 			                <option value="resources/images/projectlogo/global.png">global</option>
 			                <option value="resources/images/projectlogo/home.png">home</option>
			                <option value="resources/images/projectlogo/hotel.png">hotel</option>                      	
							<option value="resources/images/projectlogo/image.png">image</option>
							<option value="resources/images/projectlogo/language.png">language</option>
							<option value="resources/images/projectlogo/light.png">light</option>
							<option value="resources/images/projectlogo/list.png">list</option>
							<option value="resources/images/projectlogo/love.png">love</option>
							<option value="resources/images/projectlogo/money.png">money</option>
							<option value="resources/images/projectlogo/people.png">people</option>
							<option value="resources/images/projectlogo/setting.png">setting</option>
							<option value="resources/images/projectlogo/teaching.png">teaching</option>
							<option value="resources/images/projectlogo/tour.png">tour</option>
							<option value="resources/images/projectlogo/wallet.png">wallet</option>               
                        </select>
                    </p></li>
                </ul>

                <button style="background-color: rgb(202, 183, 211);">확인</button>
                <button style="background-color: rgb(160, 156, 163);">취소</button>
            </form>

                -->
             
                <br><br>
        </div>
    </div>
    <br><br>
    </div></div></div>

	<!-- 부트스트랩에서 제공하고 있는 스타일 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
	    <!-- 사원 선택 -->
	<div id="mem" class="modal">
		<div class="modal-dialog" style="max-width: 350px;" >
		   <div class="modal-content">
		        <br>
				<div class="name">
			        <input type="text" class="search" val="" placeholder="이름을 입력하세요">
			        <button onclick="searchName();" id="searchButton">검색
			        </button>
			    </div>
	   
 		<div class="result" id="listResult">
	        <table class="memberList" id="memberList">
	            <tbody>
	            
	            </tbody>
	        </table>
 		  </div>
		<button class="selectMem">선택</button>
 		<div class="result2" id="listResult2">
	       <table class="memberList2" >
	           <tbody id="memberList2">
	            
	           </tbody>
	        </table>
 		 </div>
		    <button data-dismiss="modal"  onclick="cancelButton" class="cancleButton">취소</button>
		    <button class="okButton">확인</button>
		</div>
	</div>
	
	
<script>

function searchName(){
	
	$('.memberList > tbody').empty();
	
	  let search = $(".search").val();	    	
	  $.ajax({
	    type :'GET',
	    url:"addmem.pr",
	    data:{
	    	search:search
	    }, success : function(list){
	    	console.log(search);
			let arr="";
			for(let i in list){
                 arr +="<tr>"
			    	 + "<td>" + "<input type='checkbox' name='newMem'>" + "</td>"
			    	 + "<td name='empName'>"+ list[i].empName + "&nbsp</td>"  
			    	 + "<td name='teamName'>"+ list[i].teamName + "&nbsp</td>"
			    	 + "<td name='jobName'>"+ list[i].jobName + "&nbsp</td>"	
					 + "<input type='hidden' name='empNo' value='" + list[i].empNo + "'>"
		    		 + "</tr>";
		    	}
	   	  $('.memberList > tbody').html(arr);
	   	  $("#search").val('');
	    }, error:function(){
	    	console.log("멤버추가 ajax 통신 실패");
	    }
	 })
  }
  
	$(document).on("click", ".selectMem",function(){
	
		let checkValue = [];
		let $downRow;
	
		$("input[name='newMem']:checked").each(function(){
			checkM = $(this).parent().parent().html(); //체크된행
			checkValue.push(checkM);
			console.log(checkM);
		});
		
		let trHtml = '';
		for(let i in checkValue){
			trHtml += '<tr>'+ checkValue[i] +'</tr>';
		}
		$("#memberList2").html(trHtml);    		
	})
  
	
	$(document).on("click", ".okButton",function(){
	  
	  let value = "";
	  
	  $("#memberList2 tr").each(function(i, tr){
		  value 
		    += "<span>"+ $(tr).find("td[name=empName]").text() + " " + $(tr).find("td[name=job]").text() + "</span>"
	         + "<input type='hidden' name='newprMem[" + i + "].empNo' value='" +  $(tr).find("input[name=empNo]").val() + "'>" //name='appList[0,1,...].empNo' value='empNo' 
		})
		console.log(value);
		value = '<span id="proMemberList"> </span>' + value;
		$("#proMember").html(value);
		$(".searchwrap").hide();
  })
	
  function cancelButton(){
	  $(".searchwrap").hide();
  }
	
</script>

</body>
</html>