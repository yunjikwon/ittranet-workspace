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
        height: 650px;
    }
    .chartOuter ul, .chartOuter li{
        text-decoration: none;
        list-style: none;
        padding:0;
        margin-bottom: 20px;
    }
    .liBtn, .noneBtn{
        font-size: 15px;
		font-weight: 900;
        border:none;
        border-radius: 1.05ex;
        width: 100px;
    }
    .noneBtn{height: 40px; background: rgb(148, 148, 148);}
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
        font-size: 15px;
		font-weight: 900;
        border-radius: 1.05ex;
		background: rgb(228, 227, 227);
        cursor: pointer;
        width : 130px;
		height : 50px;	
    }
    .btnStyle:hover{opacity: 50%;}

  
	.company_mn{
		color: #000000;
	}
	/*모달 스타일*/
    #teamName-area{
        border-bottom: 3px black double;
        font-size: 25px;
    }
    .empNameBtn{
        border:none;
        cursor: pointer;
        width : 130px;
		height : 50px;	
        background-color: transparent;
    }
    #teamListModal tbody tr:hover{background-color:rgba(214, 207, 207, 0.822); cursor: pointer;}
    #teamListModal tbody tr{border-bottom: 1px solid rgb(212, 210, 210);}
    #profile-area>*, #profile-area *, .fa-user::before{width:90px; height:90px; margin:auto;}
    #employeeDetail, #employeeList{margin:auto;}
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
                        <h2 style="margin-left:50px; font-weight: 900;"><a class="aTag" href="">조직도</a></h2>
                    </span>
                    
                    <div class="chartOuter" align="center">
                        
                        <br><br>
                        <br ><br>
                        <!-- 조직도 상세내역-->
                        <ul>
                            <li>
                                <button class="liBtn">대표이사</button>
                            </li>
                        </ul>
                        <br>

                        <!-- 강제적용 위해 script 추가-->
                        <!-- jQuery 라이브러리 -->
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                        <!-- 부트스트랩에서 제공하고 있는 스타일 -->
                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
                        <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
                        
                       
                        
                        <ul id="department-area">
                            <c:forEach var="d" items="${dList}">
                                <li class="noneBtn">
                                    <input type="hidden" class="deptCode" name="deptCode" value="${d.deptCode}">
                                    ${d.deptName}
                                    <ul><br><br>
                                    	<c:forEach var="c" items="${ list }">
                                           	<c:if test="${d.deptCode eq c.deptCode }">
	                                        	<li><button type="button" class="liBtn teamNameBtn" data-toggle="modal" data-target="#employeeList">${c.teamName}</button>
                                                    <input type="hidden" class="teamCode" name="teamCode" value="${c.teamCode}">
                                                </li>
	                                        </c:if>
                                            <input type="hidden" class="teamName" name="teamName" value="${c.teamName}">
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:forEach>
                            
                        </ul>
                        <br clear="both"><br>
                    </div>
                    

                    <!-- 팀 클릭시 팀원 전체이름 조회용 모달-->
                    <!-- The Modal -->
                    
                    <div class="modal" id="employeeList" >
                        <div class="modal-dialog modal-dialog-scrollable modal-sm">
                        	<div class="modal-content" >
                    
	                            <!-- Modal Header -->
	                            <div class="modal-header">
	                            <h3 class="modal-title">사원 조회</h3>
	                            <button type="button" class="close" data-dismiss="modal">&times;</button>
	                            </div>
	                    
	                            <!-- Modal body -->
	                            <div class="modal-body">
                                    <form action="" id="teamListModal">
                                        <table width="250px" height="200px" >
                                            <thead>
                                                <tr>
                                                    <th colspan="2" width="250" id="teamName-area" >                                               
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                        </table>
                                    </form>
	                            </div>
	                    
	                            <!-- Modal footer -->
	                            <div class="modal-footer">
	                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	                            </div>
                    
                        	</div>
                        </div>
                    </div>
                    <script>
                        // 팀명 클릭시 필요한 value 값 담기 및 함수호출
                        $(document).on("click", ".teamNameBtn", function(){
                            let $teamCode = $(this).next().val();
                            //console.log($teamCode);
                            let $deptCode = $(this).parent().parent().prev().val();
                            //console.log($deptCode);
                            let $teamName = $(this).parent().next(".teamName").val();
                            //console.log($teamName);
                            selectEmployeeList($teamName, $teamCode);
                        })

                        function selectEmployeeList(teamName, teamCode){
                            
                            $.ajax({
                                url:"selectEmp.co",
                                data:{
                                    teamCode:teamCode
                                },success:function(list){
                                    value="";
                                    //console.log(list);
                                    for(let i in list){
                                        value += "<tr>"
                                                +   "<th width='50'>" + list[i].jobName + "</th>"
                                                +   "<td width='200'><button type='button' class='empNameBtn' data-toggle='modal' data-target='#employeeDetail'>" + list[i].empName +"</button>"
                                                +   "<input type='hidden' name='empNo' class='empNo' value='" + list[i].empNo + "'>" 
                                                + "</tr>";
                                    }
                                   
                                    $("#teamListModal tbody").html(value);
                                    $("#teamName-area").html(teamName);
                                },error:function(){
                                    console.log("팀원 조회용 ajax 통신 실패");
                                }
                            })
                        }
                    </script>

                    <!-- 모달 안의 모달, 사원 개인정보 조회-->
                    <div class="modal" id="employeeDetail" >
                        <div class="modal-dialog modal-dialog-scrollable modal-sm">
                            <div class="modal-content" >

                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h3 class="modal-title">사원 상세 조회</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                        
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <table width="250px" height="300px" align="center" id="employeeDetailModal">
                                        <thead>
                                            <tr>
                                                <th colspan="2" width="200" height="100" style="font-size:17px" id="profile-area">
                                                    <div id="profile-div"></div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                        
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>

                            </div>
                        </div>
                    </div>

                    <script>
                        // 팀명 클릭시 필요한 value 값 담기 및 함수호출
                        $(document).on("click", ".empNameBtn", function(){
                            let $empNo = $(this).next().val();
                            //console.log($empNo);
                            
                            selectEmployeeDatail($empNo);
                        })

                        function selectEmployeeDatail(empNo){
                            
                            $.ajax({
                                url:"detailEmp.co",
                                data:{
                                    empNo:empNo
                                },success:function(list){
                                    //console.log(list.profile);
                                   
                                    if(list.profile === "NULL"){
                                        //console.log('1');
                                        let img = "<i class='fas fa-solid fa-user fa-4x'></i>";
                                        $("#profile-div").html(img);
                                    }else{
                                        let img =  "<img width='90' height='90' src='" + list.profile + "'/>";
                                        $("#profile-div").html(img);
                                        //console.log('2');
                                    }

                                    let value = "";
                                    value += "<tr>"
                                            +   "<th width='100'>사원명</th>"
                                            +   "<td width='150'>" + list.empName + "</td>"
                                            +"</tr>"
                                            +"<tr>"
                                            +   "<th>부서</th>"
                                            +   "<td width='150'>" + list.teamName + "</td>"
                                            +"</tr>"
                                            +"<tr>"
                                            +   "<th>직책</th>"
                                            +   "<td width='150'>" + list.jobName + "</td>"
                                            +"</tr>"
                                            +"<tr>"
                                            +   "<th>휴대폰</th>"
                                            +   "<td width='150'>" + list.phone + "</td>"
                                            +"</tr>"
                                            +"<tr>"
                                            +   "<th>이메일</th>"
                                            +   "<td width='150'>" + list.email + "</td>"
                                            +"</tr>";

                                    $("#employeeDetailModal tbody").html(value);
                                },error:function(){
                                    console.log("팀원 조회용 ajax 통신 실패");
                                }
                            })
                        }
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