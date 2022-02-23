<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
-->
<style>
    .noticeListOuter{
        margin:auto;
        width: 900px;
        box-sizing: border-box;
        font-size: 14px;
        /*margin-left: 500px;*/
        
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
    }
    .btnStyle:hover{opacity: 50%;}
    #addBtn, #searchBtn, #delBtn{
        width : 70px;
        height : 30px;
    }
    #paging-area{
        text-align: center;
    }
    #searchType-area, #header-area, #input-area{
        display: inline-block;
    }
    .pageBtn{
        width : 25px;
        height : 30px;
        font-size: 14px;
        font-weight: 900;
        border: none;
        border-radius: 1.05ex;
        background: rgba(195, 200, 247, 0.822);
    }
    .pageBtn:hover{
        opacity: 50%;
    }
    .aTag, .aTag:hover{
        text-decoration: none;
        color: black;
        cursor: pointer;
    }
    .noticeTitle{
        cursor: pointer;
    }
    .board_mn{
		color: #000000;
	}   
</style>
</head>
<body>	
	 
    <div class="back">
        <div class="innerBack">
            <!--헤더-->
            <jsp:include page="../common/pageHeader.jsp" />
            <!-- 글 삭제시 나타나는 alert창 위한 구문 -->
			<c:if test="${ not empty alertMsg }">
				<script>
					Swal.fire({
					  position: 'middle',
					  icon: 'success',
					  text: '${ alertMsg }',
					  showConfirmButton: false,
					  timer: 1500
					})
				</script>
				<c:remove var="alertMsg"  />
				
			</c:if>
            <!--메뉴바-->
            <jsp:include page="../common/adminMenu.jsp" />
            <br clear="both">
            <div style="position:relative">
                 <!--사이드바-->
                <jsp:include page="../common/sidebar.jsp" />
                <!-- 각 메뉴에 맞게 수정 -->    	
		        <div class="cont">
		            <ul id="ac">
		                <li class="division">
		                    <a href="#">게시판 관리</a>
		                </li>
		                <div id="border">
				               <li class="menu1">
				                  <a href="listAdmin.no">공지사항 관리</a>
				               </li>
				               <li class="menu1">
				                  <a href="listAdmin.bo">자유게시판 관리</a>
				               </li>
				              
		            	</div>
		            </ul>
		         </div>
                <!--구현시작!-->
             
                <div class="mainOuter">
                    <br>
                    <span style="margin: 10px;">
                        <h2 style="margin-left:50px; font-weight: 900;"><a class="aTag" href="listAdmin.no">공지사항 관리</a></h2>
                    </span>
                    <!-- 게시글 전체 영역-->
                    <div class="noticeListOuter" align="center">
                        <c:if test="${ loginUser.admin eq 'Y' }">
                        	<button id="addBtn" class="btnStyle" style="float:right"><a class="aTag" href="insertForm.no">새글등록</a></button>
                            <button id="delBtn" class="btnStyle" style="float:right"><a class="aTag" onclick="delBoard();">글 삭제</a></button>
                        </c:if>
                        <br clear="both">
                        <!-- 게시글 전체보기 리스트 영역-->
                        <table id="noticeListTable" class="table thead-light table-hover">
                            <thead>
                                <tr align="center">
                                    <th ><input type="checkbox" id="checkAll"></th>
                                    <th width="50px">No.</th>
                                    <th width="100px">말머리</th>
                                    <th width="370px">글제목</th>
                                    <th width="115px">작성자</th>
                                    <th width="115px">작성일</th>
                                    <th width="80px">조회수</th>
                                </tr>
                            </thead>
                            <tbody id="noticeListTbody">
                                <c:forEach var="n" items="${ list }">
                                    <tr align="center">
                                        <td ><input type="checkbox" name="check" class="checkOne"></td>
                                        <td class="nno">${ n.noticeNo }</td>
                                        <td class="headerTitle">${ n.headerTitle}</td>
                                        <td class="noticeTitle">${ n.noticeTitle }
                                            <c:if test="${ !empty atList }">
                                            	&nbsp;&nbsp;<i class="fa-solid fa-paperclip"></i>
                                            </c:if>
                                        </td>
                                        <td>${ n.empName }</td>
                                        <td>${ n.createDate }</td>
                                        <td>${ n.count }</td>
                                    </tr>
                                    <form id="postForm" action="" method="post">
                                        <input type="hidden" name="nno" value="${ n.noticeNo }">
                                        <input type="hidden" name="filePath" value="${ at.changeName }">
                                        <input type="hidden" id="noticeNoDel" name="noticeNoDel[]" value="">
                                    </form>
                                </c:forEach>
                            </tbody> 
                        </table>
                        <br>
                        
                        <script>
                            $(function(){
                                 // 전체 체크버튼 클릭시 전체 체크박스 선택
                                // 전체선택 클릭시 전부 선택
                                $("#checkAll").on('click', function(){
                                    
                                    if($("#checkAll").is(':checked')) {
                                        $("input[type=checkbox]").prop("checked", true);
                                    }else {
                                        $("input[type=checkbox]").prop("checked", false);
                                    }
                                    
                                })
                                
                                // 전부 선택시 전체선택 checked
                                $("input[type=checkbox]").on('click', function(){
                                    var total = $(".checkOne").length;
                                    var checked = $(".checkOne:checked").length;
                                    
                                    if(total != checked) {
                                        $("#checkAll").prop("checked", false);
                                    }else {
                                        $("#checkAll").prop("checked", true);
                                    }
                                })   
                            })
                            //글 삭제하기 알러트
                            function delBoard(){
                                
                                Swal.fire({
                                title: '삭제하시겠습니까?',
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: '삭제하기',
                                cancelButtonText : '취소'
                                }).then((result) => {
                                if (result.isConfirmed) {

                                    delFormSubmit();  
                                
                                }
                                })
                            }
                            
                            // 글 삭제하기
                            function delFormSubmit(){
                                let count = $("input[name='check']:checked").length;
                                let checkArr = new Array();
                                $("input[name='check']:checked").each(function(){
                                    checkArr.push($(this).parent().siblings(".nno").text())
                                    
                                }); 
                                $("#noticeNoDel").attr("value", checkArr);
                                //console.log(checkArr);
                                //console.log(count);
                                
                                $("#postForm").attr("action", "delete.no").submit();  
								   
                                
                            }
                    
                        </script>
                       
                        <!-- 페이징 바 영역-->
                        <div id="paging-area">
                            <c:choose>
                                <c:when test="${ pi.currentPage eq 1 }">
                                    <button class="pageBtn" disabled>&lt;</button>
                                </c:when>
                                <c:otherwise>
                                    <button class="pageBtn"><a class="aTag" href="list.no?cpage=${ pi.currentPage-1 }">&lt;</a></button>
                                </c:otherwise>
                            </c:choose>
                            
                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                <button class="pageBtn"><a class="aTag" href="list.no?cpage=${ p }">${ p }</a></button>
                            </c:forEach>
                        
                            <c:choose>
                                <c:when test="${ pi.currentPage eq pi.maxPage }">
                                    <button class="pageBtn" disabled>&gt;</button>
                                </c:when>
                                <c:otherwise>
                                    <button class="pageBtn"><a class="aTag" href="list.no?cpage=${ pi.currentPage+1 }">&gt;</a></button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <br>
                        
                        <div id="search-area" align="center">     
                        	<form id="searchArea" name="searchArea">
	                            <select name="search" id="searchSelect" onchange="changeSelect();">
	                                <option value="noticeTitle">글제목</option>
	                                <option value="noticeContent">글내용</option>
	                                <option value="noticeHeader">말머리</option>
	                            </select>
                               
                                <div id="searchType-area">
                                    <div id="input-area">
                                        <input type="text" id="keyword" class="keyword" name="keyword">
                                    </div>
                                    <div id="header-area" style="display:none">
                                        <select name="headerType" id="headerType" onchange="changeHeader();">
                                            <c:forEach var="h" items="${headerList}">
                                                <option value="${h.headerNo}" class="keyword">${h.headerTitle}</option>
                                            </c:forEach>
                                        </select>
                                        <input type="hidden" id="headerNo" name="headerNo" value="">
                                    </div>
                                </div>
                               
                                
	                            <button type="button"id="searchBtn" class="btnStyle" onclick="getSearchList();"><a class="aTag">검색</a></button>
                        	</form>
                        </div>
                        
                        <script>
                            $(function(){
                                changeSelect();
                                changeHeader();
                            })
                            function changeHeader(){
                                // select값 넣기
                				let $type = $("#headerType option:selected").val();
	                   			$("#headerNo").attr("value", $type);
                                
                            }
                            function changeSelect(){
                                let value = $("#searchSelect option:selected").val();
                                //console.log(value);
                                if(value === 'noticeHeader'){
                                    $("#header-area").removeAttr("style", "display:none");
                                    $("#input-area").attr("style", "display:none");
                                }else{
                                    $("#header-area").attr("style", "display:none");
                                    $("#input-area").removeAttr("style", "display:none");
                                }
                            }
                        	function getSearchList(){
                        		
                                let $headerNo = $("#headerNo").val();
                        		let $keyword = $("#keyword").val();
                        		let $type = $("#searchArea option:selected").val();

                        		if($type != 'noticeHeader' && $keyword === ""){
                        			Swal.fire({
                        				text: '키워드를 입력해주세요'
                        			});
                        			
                        			return false;
                        		}
                                
                        		$.ajax({
                        			url : "search.no",
                        			data:{
                        				keyword: $keyword,
                                        headerNo:$headerNo,
                        				type: $type
                        			},
                        			success:function(list){
                        				
                        				$("#noticeListTbody").empty();
                        				$("#paging-area").hide();
                        				
                                          let value = "";
                        				if(list.length<1){
                        					value = "<tr align='center' class='noResult' ><th colspan='5' rowspan='3' height='150'><br><br><br>검색된 글이 없습니다.</th></tr>";
                        					$("#noticeListTbody").html(value);
                        					
                        				}else{
                                            for(let i in list){
                                            
                                                value += "<tr align='center'>"
                                                        + "<td><input type='checkbox' class='checkOne'></td>"
                                                        + "<td class='nno'>" + list[i].noticeNo + "</td>"
                                                        + "<td class='headerTitle'>" + list[i].headerTitle + "</td>"
                                                        + "<td class='noticeTitle'>" + list[i].noticeTitle + "</td>"
                                                       
                                                        + "<td>" + list[i].empName + "</td>"
                                                        + "<td>" + list[i].createDate + "</td>"
                                                        + "<td>" + list[i].count + "</td>"
                                                        + "</tr>";
                                            }
                                            
                                            $("#noticeListTbody").html(value);
                        				}
                        			},error:function(){
                        				console.log("게시글 검색용 ajax 통신 실패");
                        			}
                        		})
                        	}
                        	
                        	$(function(){
                                
                                $(document).on("click", ".noticeTitle", function(){
                                	if($(this).hasClass("noResult")){
                                		return false;
                                	}else{
                                    	location.href = 'detail.no?nno=' + $(this).siblings(".nno").text();
                                	}
                                })
                                
                            })
                        </script>
                        <br>
                    </div>

                </div>
            </div>
           
            <!--푸터-->
            <jsp:include page="../common/footer.jsp" />
        </div>
    </div>

  
</body>
</html>