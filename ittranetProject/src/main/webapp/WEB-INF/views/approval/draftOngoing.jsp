<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        #draftTitle{
            font-size: 20px;
            font-weight: 700;
            margin-left: 50px;
            display: inline-block;

        }
        .search{
            display: inline-block;
            font-size:14px;
            vertical-align: middle;
            width: 180px;
            position: relative;
            left:430px;
            top:-10px;
        }
        .divisionSelect{
           width: 100px;
            height: 30px;
            background-color: rgba(19, 33, 142, 0.2);
            border-radius: 4px;
            border: 2px solid lightgray;
            border: 0 none;
            outline: 0 none;
            padding: 0 5px;
            z-index: -3; 
        }
        #innerouter{
            width:90%;
            height:90%;
            background-color: white;
            margin:auto;
            margin-top: 10px;
        }
        #boardList{
            text-align: center;
            margin: auto;
        }
        #boardList>tbody>tr:hover{cursor:pointer;}

        #pagingArea{width:fit-content;margin:auto;}

    </style>
</head>
<body>
<div class="back">
	<div class="innerBack">
		<!-- 헤더 -->
	    <jsp:include page="../common/pageHeader.jsp"/>
	    <!-- 메뉴바 -->
	   	<jsp:include page="../common/userMenu.jsp"/>
	   	
	   	
	   	<br clear="both">
	   	
	   	<div style="position:relative">
		   	<!-- 사이드바 -->
		   	<jsp:include page="approvalSidebar.jsp" />
		   	
		    <div class="mainOuter">
		        <br>
		        <div id="draftTitle">
		           	 기안함 > 진행중 결재
		        </div>
		        
		        <form action="" method="post" onsubmit="">
		            <div id="innerouter" style="padding:5% 10%;">
			            <div class="search" id="search1">
				           	 결재분류
				            <select class="divisionSelect" name="" id="">
				                <option value="">(결재분류)</option>
				                <option value="">사업계획서</option>
				                <option value="">시말서</option>
				                <option value="">연장근무신청</option>
				                <option value="">지출결의서</option>
				                <option value="">추가예산신청</option>
				                <option value="">회의록</option>
				            </select>
				        </div>
				        <div class="search" id="search2">
				           	 기안일
				            <select class="divisionSelect" name="" id="">
				                <option value="">(기안일)</option>
				                <option value="">1주일</option>
				                <option value="">1개월</option>
				                <option value="">3개월</option>
				
				            </select>
				        </div>
		            <table id="boardList" class="table table-hover" align="center">		
		                    <tr>
		                        <th>추가예산신청</th>
		                        <td>xx프로젝트 추가예산 신청합니다.</td>
		                        <td>22.01.10</td>
		                        <td>
		                            <img src="" alt=""> <!--프로필 이미지-->
		                           	 인사팀
		                        </td>
		                        <td>결재대기</td>
		                    </tr>
		                    <tr>
		                        <th>회의록</th>
		                        <td>IT!tranet 3번째 회의</td>
		                        <td>22.01.10</td>
		                        <td>인사팀</td>
		                        <td>결재대기</td>
		                    </tr>
		                    <tr>
		                        <th>품의서</th>
		                        <td>개발팀 품의서</td>
		                        <td>22.01.03</td>
		                        <td>인사팀</td>
		                        <td>결재대기</td>
		                    </tr>
		                    <tr>
		                        <th>지출결의서</th>
		                        <td>12월 지출 결의서</td>
		                        <td>21.12.30</td>
		                        <td>김땡땡대리</td>
		                        <td>결재대기</td>
		                    </tr>
		                    <tr>
		                        <th>사업계획서</th>
		                        <td>xx프로젝트 제안서 제출합니다.</td>
		                        <td>21.12.30</td>
		                        <td>권땡땡 팀장</td>
		                        <td>결재대기</td>
		                    </tr>
		
		            </table>
		            <br>
		
		            
		            
		        </div>
		        <br><br>
		        <div id="pagingArea">
		            <ul class="pagination">
		                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		                <li class="page-item"><a class="page-link" href="#">1</a></li>
		                <li class="page-item"><a class="page-link" href="#">2</a></li>
		                <li class="page-item"><a class="page-link" href="#">3</a></li>
		                <li class="page-item"><a class="page-link" href="#">4</a></li>
		                <li class="page-item"><a class="page-link" href="#">5</a></li>
		                <li class="page-item"><a class="page-link" href="#">Next</a></li>
		            </ul>
		        </div>
		       
		        <br clear="both"><br>
		        </form>
		    </div>
	    <!-- 푸터 -->
	    <jsp:include page="../common/footer.jsp"/>
	    
	</div>    
</div>    
</body>
</html>