<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content-area{
        width: 1000px; 
        padding:0 10px; 
        margin-left: 45px; 
        font-size: 18px; 
        font-weight: 600;
    }
	.vc-box{
        height: 1000px;
    }
    #att-search{
        font-size: 15px;
    }

    .input, .output{
        float: left;
    }
    #search-btn{
        height: 100px;
        width: 850px;
        padding-top: 30px;
    }

    #att-output{
        text-align: center;
        border-top: 1px solid #444444d5;
        border-bottom: 1px solid #444444d5;
        border-collapse: collapse;
    }
    #att-tbody tr{
        font-weight: 300;
    }
    #att-output th, #att-output td {
    border-bottom: 1px solid #bbbbbb;
    padding: 10px;
    font-size: 15px;
    }
</style>
</head>
<body>
    <div class="back">
        <div class="innerBack">
            <!-- 헤더, 메뉴바 -->
            <jsp:include page="../common/pageHeader.jsp" />
            <jsp:include page="../common/userMenu.jsp" />
            
            <br clear="both">
            <div style="position:relative">
                <jsp:include page="attendanceSidebar.jsp" />
                <div class="mainOuter">
                    <!--제목영역-->
                    <div style="width:100%; height:200px; float:right; padding:40px; font-size: 22px; font-weight: 600;">
                        근태 현황
                        <br><br>
                        <hr>
                    </div>
                    <div class="content-area">                       
                        <br><br><br><br><br><br><br>
                        <div class="vc-box">
                           	<form name="search-form" method="post" autocomplete="off">
	                            <div class="input" id="att-search">
                                    <fmt:parseNumber value = "${ loginUser.empNo }" var="empNo" />
                                    <input class="att-input" type="hidden" name="empNo" value="${ empNo }">
	                                <table>
	                                    <tr>
	                                        <td width="150" height="80">기간 선택</td>
	                                        <td width="210"><input type="date" name="atStart"> &nbsp;~&nbsp;</td>
	                                        <td width="300"><input type="date" name="atEnd"></td>
	                                    </tr>
	                                    <tr>
	                                        <td>근태</td>
	                                        <td>
	                                            <select name="attStatus" id="attStatus" class="att-select">
	                                                <option value="정상">정상</option>
	                                                <option value="지각">지각</option>
	                                                <option value="조퇴">조퇴</option>
	                                            </select>
	                                        </td>
	                                    </tr>
	                                </table>
                                    <div id="search-btn" align="center">
	                                    <button type="button" onclick="searchAttendance();" class="att-btn">조회</button>
                                    </div>    
                                </div>
                            </form>
                            <div class="output">
                             조회결과: <span id="searchCount">0</span>건
							 <br><br>
                                <table id="att-output">
                                    <thead>
                                        <tr>
                                            <th width="200">근무일자</th>
                                            <th width="150">출근</th>
                                            <th width="150">외출</th>
                                            <th width="150">외근</th>
                                            <th width="150">퇴근</th>
                                            <th width="150">근태</th>
                                        </tr>
                                    </thead>
                                    <tbody id="att-tbody">
                                        
                                    </tbody>  
                                </table>
                            </div>
                            <script>
                            $(function(){
                                selectAttendance();
                            })
                            function selectAttendance(){ // 근태 전체조회용
								$.ajax({
									url: "selectat.at",
									type: "post",
									data :{ 
										empNo: ${empNo}
									},
									success : function(list){
										//테이블 초기화
										$('#att-tbody').empty();
										$('#searchCount').empty();
										let value="";
										let result="";
										if(list.length<1){
											value += "<tr>"
			                                    + "<td>" +  조회결과업슴  + "</td>"
			                                    + "<tr>";
										}else{
											for(let i in list){
												result = list.length;
												value += "<tr>"
						                                    + "<td>" +  list[i].attDate  + "</td>"
						                                    + "<td>" +  list[i].arriveTime  + "</td>"
						                                    +"<td>" +  list[i].stepoutTime  + "</td>"
						                                    +"<td>" +  list[i].outworkTime  + "</td>"
						                                    +"<td>" +  list[i].leaveTime  + "</td>"
						                                    +"<td>" +  list[i].attStatus  + "</td>" 
				                                    	+"</tr>";
							        		}				 
											$('#att-tbody').append(value);
											$('#searchCount').append(result);
										}
									}, error:function(){
                        				console.log("근태 조회용 ajax 통신 실패");
                        			}
								})
							}
	                        function searchAttendance(){ // 근태 검색용
								$.ajax({
									url: "searchlist.at",
									type: "post",
									data : $("form[name=search-form]").serialize(),
									success : function(list){
										//테이블 초기화
										$('#att-tbody').empty();
										$('#searchCount').empty();
										let value="";
										let result="";
										if(list.length<1){
											value += "<tr>"
			                                    + "<td>" +  조회결과업슴  + "</td>"
			                                    + "<tr>";
										}else{
											for(let i in list){
												result = list.length;
												value += "<tr>"
						                                    + "<td>" +  list[i].attDate  + "</td>"
						                                    + "<td>" +  list[i].arriveTime  + "</td>"
						                                    +"<td>" +  list[i].stepoutTime  + "</td>"
						                                    +"<td>" +  list[i].outworkTime  + "</td>"
						                                    +"<td>" +  list[i].leaveTime  + "</td>"
						                                    +"<td>" +  list[i].attStatus  + "</td>" 
				                                    	+"</tr>";
							        		}				 
											$('#att-tbody').append(value);
											$('#searchCount').append(result);
										}
									}, error:function(){
                        				console.log("근태 검색용 ajax 통신 실패");
                        			}
								})
							}
                        	</script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>