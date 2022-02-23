<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap{
        width: 900px;
    }
    #mainOuter{
           width:1200px;
           height:800px;
          }
    .outer div{float:left;}
    .top{
         width:1200px;
         height:200px;
    }
    .sidebar{
         width:300px;
         height:600px;
        }
	.middle{
            width:800px;
            height:700px;
            font-family: 'IBM Plex Sans KR', sans-serif;
    }
    .info{
          font-size:20px;
          width:550px;
          height:600px;
    }
    #profileimg{
                border-radius:70%;
    }
    .buttonbar{
           font-family: 'IBM Plex Sans KR', sans-serif;
    }
    .btn1{
        background-color: rgb(193, 116, 195);
    }
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>
<body>
	<!-- 공용 -->
    <div class="back">
    
    	<!-- 상단: 페이지헤더, 메뉴바 -->
        <div class="innerBack">
			<jsp:include page="../common/pageHeader.jsp" />
 			<jsp:include page="../common/adminMenu.jsp" />

		<!-- 왼쪽 : 사이드바 -->
 		<br clear="both">
 		<div style="position:relative">
			<jsp:include page="../common/sidebar.jsp" />
			<div class="cont">
            <ul id="ac">
                <li class="division">
                    <a href="#">마이페이지</a>
                </li>
                <div id="border">
		               <li class="menu1">
		                  <a href="#">내정보</a>
		               </li>
		        </div>
		     </ul>
		     </div>
		  </div>
		  
		<!-- 내용 -->
        <div class="mainOuter" id="mainOuter" style="font-family: 'Gowun Dodum', sans-serif;">
			
        <br><br>
            
        <form id="" action="" method="post">

    	<div class="middle">
        <br>
        <h1 align="center">내 정보</h1>
        <br><br>

            <table class="info" align="center">
                <tr>
                    <th>프로필 사진 :</th>
                    <td><img id="profileimg" src="/2_mypage/tumblr_acb5f658a402edb4f61e2d81c99c205c_553612c8_400.jpg"></td>
                </tr>
                
                <tr>
                    <th></th>
                    <td>
                        <input type="file">
                    </td>
                </tr>
                
                <tr>
                    <th>
						이름 : 
                    </th>
                    <td>
                        <input type="text" placeholder="이름을 입력해주세요." required>
                    </td>
                </tr>
                
                <tr>
                    <th>
						이메일 : 
                    </th>
                    <td>
                        <input type="text" placeholder="이메일을 입력해주세요." required>
                    </td>
                </tr>
                
                <tr>
                    <th>
						아이디 : 
                    </th>
                    <td>
                        <input type="text" placeholder="아이디를 입력해주세요." required>
                    </td>
                </tr>
                
                <tr>
                    <th>
						비밀번호 : 
                    </th>
                    <td>
                        <input type="text" placeholder="비밀번호를 입력해주세요." required>
                    </td>
                </tr>
                
                <tr>
                    <th>
						비밀번호 확인 : 
                    </th>
                    <td>
                        <input type="text" placeholder="비밀번호를 한번 더 입력해주세요." required>
                    </td>
                </tr>
                
                <tr>
                    <th>
						전화번호 : 
                    </th>
                    <td>
                        <input type="text" placeholder="전화번호를 입력해주세요." required>
                    </td>
                </tr>
                
                <tr>
                    <th>
						주소 : 
                    </th>
                    <td>
                        <input type="button" value="우편번호찾기" onclick="kakaopost()">
                    </td>
                </tr>
                
                <tr>
                    <th></th>
                    <td>
                        <input type="text" placeholder="주소를 입력해주세요." required>
                    </td>
                </tr>
            </table>

			<br><br>

        	<div class="buttonbar" align="center">

                <!-- Button to Open the Modal -->
                <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                  	수정
                </button>
              
                <!-- The Modal -->
                <div class="modal fade" id="myModal">
                  <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                    
                      <!-- Modal Header -->
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>
                      
                      <!-- Modal body -->
                      <div class="modal-body">
						정말로 수정하시겠습니까?
                      </div>
                      
                      <!-- Modal footer -->
                      <div class="modal-footer">
                        <button type="button" class="btn1" data-dismiss="modal">수정</button>
                        <button type="button" class="btn2" data-dismiss="modal">취소</button>
                      </div>
                      
                    </div>
                  </div>
                </div>
                
                <!-- Button to Open the Modal -->
                <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
					탈퇴
                </button>
                
                  <!-- The Modal -->
                  <div class="modal fade" id="myModal">
                    <div class="modal-dialog modal-sm">
                      <div class="modal-content">
                      
                        <!-- Modal Header -->
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body">
							정말로 탈퇴하시겠습니까?
                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                          <button type="button" class="btn1" data-dismiss="modal">탈퇴</button>
                          <button type="button" class="btn2" data-dismiss="modal">취소</button>
                        </div>
                        
                      </div>
                    </div>
                  </div>
                
              </div>
              
        </div>
    </div>
</body>
</html>