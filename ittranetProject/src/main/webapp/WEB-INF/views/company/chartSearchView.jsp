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
        font-size: 15px;
        margin-bottom: 70px;
    }
    .search-area{
        background-color: rgba(129, 70, 161, 0.26);
        width:800px;
        height: 100px;
        border-radius: 1.05ex;
        padding-top: 30px;
        padding-left: 10px;
    }
    .search-area *{margin:10px;}
    #result-area{
        width:800px;
        background-color: rgba(129, 70, 161, 0.26);
        border-radius: 1.05ex;
        padding-top: 30px;
        padding-left: 10px;
        padding-bottom: 30px;
    }
    
    /*button효과*/
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
		background: rgba(162, 171, 255, 0.822);
        cursor: pointer;
        width : 80px;
		height : 30px;	
    }
    .btnStyle:hover{opacity: 50%;}
	label{
        font-size: 20px;
        font-weight: 900;
        margin: 20px;
        padding: 0;
    }
    .spanTag{font-weight:900;}
	.company_mn{
		color: #000000;
	}
	#resultTable tbody{
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;
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
                    
                    <div class="chartOuter" >
                        
                        <br><br>
                        <div id="searchTap" align="left">
                            <input type="radio" name="radio" id="deptNameRadio" class="radio spanTag" checked>
                            <label for="deptNameRadio">부서명</label>
                            <input type="radio" name="radio" id="keywordRadio" class="radio spanTag">
                            <label for="keywordRadio">키워드검색</label>
                        </div>
                        <!-- 부서별 전체검색-->
                        <div id="deptName-area" class="search-area">
                            <span class="spanTag">
                                부서명
                            </span>
                            <select id="department" onchange="selectChange();">
                                <c:forEach var="d" items="${dList}">
                                    <option value="${d.deptCode}" class="deptName">${d.deptName}</option>
                                </c:forEach>
                            </select>
                                <span class="spanTag">
                                    팀명
                                </span>
                            <select name="team" id="team">
	                                
                            </select>
                            <button type="button" class="btnStyle" id="deptSearchBtn">검색</button>
                        </div>
                        <script>
                            $(function(){
                                selectChange();
                            })
                            // 부서 설정 시 팀 자동 설정되는 함수
                            function selectChange(){
                                let dCode = $("#department option:selected").val();

                                $.ajax({
                                    url:"selectTeamCode.co",
                                    data:{
                                        deptCode:dCode
                                    },success:function(list){
                                        //console.log(list);
                                        let value="";
                                        for(let i in list){
                                        	value += "<option value='"+ list[i].teamCode +"'>" 
                                        			+ list[i].teamName + "</option>";
                                        }
                                        
                                        $("#team").html(value);
                                        
                                    },error:function(){
                                        console.log("팀명 조회용 ajax 통신 실패");
                                    }
                                })
                            }

                            // 검색 실행
                            $("#deptSearchBtn").click(function(){
                                let $deptCode = $("#department option:selected").val();
                                let $teamCode = $("#team option:selected").val()
                                
                                $.ajax({
                                    url:"selectEmp.co",
                                    data:{
                                        teamCode:$teamCode
                                    },success:function(list){
                                        let value = "";
                                        if(list.empty){
                                            value += "<tr>"
                                                    +    "<th colspan='5' style='font-size:18px; border-top:1px solid black; padding:50px;'>검색결과 없음</th>"
                                                    + "</tr>";
                                        }else{
                                            for(let i in list){
                                                value += "<tr>"
                                                        +    "<th rowspan='3' width='100' height='80'>"; 
                                                if(list[i].profile === "NULL"){
                                                    //console.log('1');
                                                    value += "<i class='fas fa-solid fa-user fa-4x'></i>";
                                                }else{
                                                    //console.log('2');
                                                    value += "<img width='90' height='90' src='" + list[i].profile + "'/>";
                                                }
                                                value += "</th>"
                                                        +    "<th width='100'>사원명</th>"
                                                        +    "<td width='130'>" + list[i].empName + "</td>"
                                                        +    "<th width='100'>휴대폰번호</th>"
                                                        +    "<td width='200'>" + list[i].phone + "</td>"
                                                        +"</tr>"
                                                        +"<tr>"
                                                        +    "<th>소속</th>"
                                                        +    "<td>" + list[i].teamName + "</td>"
                                                        +    "<th>이메일주소</th>"
                                                        +    "<td>" + list[i].email + "</td>"
                                                        +"</tr>"
                                                        +"<tr style='border-bottom:1px dashed grey; margin-bottom:20px;'>"
                                                        +    "<th>직급</th>"
                                                        +    "<td>" + list[i].jobName + "</td>"
                                                        +"</tr>";
                                            }
                                        }
                                        $("#resultTable tbody").html(value);
                                    },error:function(){
                                        console.log("팀별 조회용 ajax 통신 실패");
                                    }
                                })
                            })
                        </script>
                       

                        <!-- 키워드 검색-->
                        <div id="keyword-area" style="display:none" class="search-area">
                            <select name="" id="keyword">
                                <option value="empName">사원명</option>
                                <option value="phone">휴대폰</option>
                                <option value="email">이메일</option>                                
                            </select>
                            <input type="text" id="searchKeyword">
                            <button type="button" class="btnStyle" id="keywordSearchBtn">검색</button>
                        </div>
                        <br clear="both"><br>
                        <script>
                            // 검색 실행
                            $("#keywordSearchBtn").click(function(){
                                let $value = $("#keyword option:selected").val();
                                let $keyword = $("#searchKeyword").val()
                                
                                //console.log($value);
                                //console.log($keyword);
                                $.ajax({
                                    url:"searchEmp.co",
                                    data:{
                                        type:$value,
                                        keyword:$keyword
                                    },success:function(list){
                                        let value = "";
                                        if(list.empty){
                                            value += "<tr>"
                                                    +    "<th colspan='5' style='font-size:18px; border-top:1px solid black; padding:50px;'>검색결과 없음</th>"
                                                    + "</tr>";
                                        }else{
                                            for(let i in list){
                                                value += "<tr>"
                                                        +    "<th rowspan='3' width='100' height='80'>"; 
                                                if(list[i].profile === "NULL"){
                                                	//console.log('1');
                                                    value += "<i class='fas fa-solid fa-user fa-4x'></i>";
                                                }else{
                                                	console.log('2');
                                                	//console.log(list[i].profile);
                                                    value += "<img width='90' height='90' src='" + list[i].profile + "'>";
                                                }
                                                value += "</th>"
                                                        +    "<th width='100'>사원명</th>"
                                                        +    "<td width='130'>" + list[i].empName + "</td>"
                                                        +    "<th width='100'>휴대폰번호</th>"
                                                        +    "<td width='200'>" + list[i].phone + "</td>"
                                                        +"</tr>"
                                                        +"<tr>"
                                                        +    "<th>소속</th>"
                                                        +    "<td>" + list[i].teamName + "</td>"
                                                        +    "<th>이메일주소</th>"
                                                        +    "<td>" + list[i].email + "</td>"
                                                        +"</tr>"
                                                        +"<tr style='border-bottom:1px dashed grey; margin-bottom:20px;'>"
                                                        +    "<th>직급</th>"
                                                        +    "<td>" + list[i].jobName + "</td>"
                                                        +"</tr>";
                                            }
                                        }
                                        $("#resultTable tbody").html(value);
                                    },error:function(){
                                        console.log("팀별 조회용 ajax 통신 실패");
                                    }
                                })
                            })
                        </script>
                        <!-- 검색 결과-->
                        <div id="result-area">
                            <table width="780" id="resultTable" >
                                <thead>
                                    <tr>
                                        <td colspan="5" height="70" style="font-size:25px; font-weight: 900;">
                                            검색결과
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <script>
                        // select값 넣기
                        $(function(){
                            let $value = $("#department option:selected").val();
                            console.log($value);
                            let $select = '${d.deptCode}';
                           $("#deptCode").attr("value", $value);
                           // $("#headerTitle").attr("value", $select);
                        })

                        // 라디오 버튼 클릭시 나타나는 div 변경
                        $("#deptNameRadio").click(function(){
                            $("#deptName-area").removeAttr("style", "display:none");
                            $("#keyword-area").attr("style", "display:none");
                        })
                        $("#keywordRadio").click(function(){
                            $("#deptName-area").attr("style", "display:none");
                            $("#keyword-area").removeAttr("style", "display:none");
                        })

                        
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