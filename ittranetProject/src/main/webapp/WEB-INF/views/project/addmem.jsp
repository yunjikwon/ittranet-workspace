<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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
        width: 200px;;
    }
    button{
        width: 80px;
        height: 29px;
        border: none;
        border-radius: 1mm;
        color: white;
    }
    #searchButton{
        float: right;
        background-color: rgb(187, 159, 202);
    }
    .cancelButton{
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

    .updateFeed{
        width: 600px;
        height: 130px;
        border: 1px solid rgb(202, 202, 202);
        border-radius: 2mm;
        background-color: rgb(231, 217, 238);
        padding: 15px;
    }
    #nfContent{
        width: 590px;
        border-radius: 2mm;
        height: 80px;
        border: 1px solid rgb(202, 202, 202);
    }
    .checkProject{
        border: 1px solid rgb(202, 202, 202);
        border-radius: 2mm;
        width: 500px;
        height: 400px;
        background-color: rgb(231, 217, 238);
        padding: 15px;
    }
    .projectTable{
        background-color: white;
        border-radius: 2mm;
        width: 495px;
        height: 360px;
    }
    th,td,tr >.projectTable{
        border-bottom: 1px dotted rgb(202, 202, 202);
    }
</style>
<body>
<div class="searchwrap">
    <div class="name">
        <input type="text" id="search" val="" placeholder="이름을 입력하세요">
        <button onclick="searchName()" id="searchButton">검색</button>
    </div>
    <div class="result">
        <table>
            <tbody>

            </tbody>
        </table>
    </div>
    <button class="okButton">확인</button>
    <button data-dismiss="modal" class="cancelButton">취소</button>
</div>
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
	   	  $('.result > tbody').html(str);
	   	  $("#search").val('');
	    }, error:function(){
	    	console.log("멤버추가 ajax 통신 실패");
	    }
	 })
  }
</script>

<div class="updateFeed">
    <div class="update">
        <textarea id="nfContent" name="nfContent"></textarea>
        <input id="upfile" type="file" name="upfile">
        <button class="okButton">확인</button>
        <button data-dismiss="modal" class="cancelButton">취소</button>
    </div>   
</div>

<div class="checkProject">
    <div class="checkPr">
        <table class="projectTable">
            <tr>
                <th style="width: 100px;">프로젝트명</th>
                <td>잇트라넷</td>
            </tr>
            <tr>
                <th>담당자</th>
                <td></td>
            </tr>
            <tr>
                <th>기간</th>
                <td></td>
            </tr>
            <tr style="height: 200px;">
                <th>내용</th>
                <td></td>
            </tr>
        </table>
        <button class="okButton">확인</button>
    </div>   
</div>
</body>
</html>