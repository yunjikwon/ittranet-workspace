<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
       /*메뉴바 픽스 스타일*/
     	.attendance_mn{
     		color:#000000;
     	}
     	#innerouter{
            width:90%;
            height:90%;
            background-color: white;
            margin:auto;
            margin-top: 10px;
        }

        #detailTitle{
           font-size: 20px;
            font-weight: 700;
            margin-left: 50px;
            display: inline-block;

        }
        #listbtn{
        	text-decoration:none;
            display: inline-block;
            margin-left:700px;
            border:none;
            border-radius: 3px;
            width:90px;
            height: 35px;
            background-color: rgba(122, 39, 135, 0.26);
            color:black;
            text-align:center;
            padding-top: 5px;
        }       
        #contentArea{
            width:90%;
            min-height: 300px; 
            border-collapse: collapse;
            margin: auto;
            margin-top:20px;
            font-size: 16px;
        }
        #contentArea td,th{
            border:1px solid rgb(224, 224, 224);
            padding:10px 5px;
        }
        #detailContent{
			padding:15px 40px;
            height:200px;
        }
        #contentArea span{
            margin-top:10px;
            margin:7px;
        }
        .contentTitle{
            font-size: 15px;
            font-weight: 600;
            text-align: right;
            
        }

    </style>
</head>
<body>
<div class="back">
	<div class="innerBack">
		<!-- 헤더 -->
	    <jsp:include page="../../common/pageHeader.jsp"/>
	    <!-- 메뉴바 -->
	   	<jsp:include page="../../common/userMenu.jsp"/>
	   	
	   	
	   	<br clear="both">
	   	
	   	<div style="position:relative">
		   	<!-- 사이드바 -->
		   	<jsp:include page="../approvalSidebar.jsp" />
		   	
		    <div class="mainOuter">
		        <br>
		        <div id="detailTitle">
		            <c:choose>
				        <c:when test = "${ category eq 1 }">
				        	대기
			            </c:when>
			             <c:when test = "${ category eq 3 }">
				        	반려
			            </c:when>
			             <c:when test = "${ category eq 4 }">
				        	완료
			            </c:when>
		            </c:choose>	
					결재 상세
		        </div>
		        
		         <c:choose>
			        <c:when test = "${ category eq 1 }">
			        	<a id="listbtn" href="draftWait.dr">목록으로</a>
		            </c:when>
		             <c:when test = "${ category eq 3 }">
			        	<a id="listbtn" href="draftReject.dr">목록으로</a>
		            </c:when>
		             <c:when test = "${ category eq 4 }">
			        	<a id="listbtn" href="draftComplete.dr">목록으로</a>
		            </c:when>
	            </c:choose>
	            
	            <div id="innerouter" style="padding:5% 5%;">
		            <table id="contentArea" align="center">
		                <tr>
		                    <th colspan="2" 
		                    style="font-size: 18px; text-align:left; padding-left: 15px;">
		                       	${ b.drDivision }
		                    </th>
		                </tr>
		                <tr>
		                    <th>기안자</th>
		                    <td>${ b.empName }</td>
		                </tr>
		                <tr>
		                    <th>결재자</th>
		                    <td>
		                    	<c:forEach var="l" items="${ aline }">
		                        	<c:if test="${ l.drNo eq b.drNo }">
			                           		${ l.empName }&nbsp;${l.job } &nbsp;&nbsp;
		                           	 </c:if>
		                        </c:forEach>
		                    </td>
		                </tr>
		                <tr>
		                    <th>제목</th>
		                    <td>${ b.drTitle }</td>
		                </tr>
		                <tr>
		                    <th>첨부파일</th>
		                    <td>${ at.filePath }</td>
		                </tr>
		                <tr>
		                    <th>사유</th>
		                    <td>${ b.drReason }</td>
		                </tr>
		                <tr>
		                    <th>비용청구</th>
		                    <td>${ b.drMoney }</td>
		                </tr>
		                <tr>
		                    <td colspan="2" id="detailContent">
		                        ${ b.drContent }
		                    </td>
		                </tr>
		
		                   
		            </table> <br>        
        		</div> <br><br>
        	
        	</div>
	    <!-- 푸터 -->
	    <jsp:include page="../../common/footer.jsp"/>
	    
		</div>    
	</div> 
</div>
    
</body>
</html>