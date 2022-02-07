<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		body{
			margin:0;
			padding:0;
		}
		div{box-sizing: border-box;}
        .mainouter{
            width:100vw;
            height:100vh;
        }
        .innerOuter{
        	width:100%;
        	height:100%;
            margin:auto;
        }
        
        .one{
            width:20%;
            height: 100%;
            float:left;
            background: rgb(142,207,246);
            background: linear-gradient(157deg, rgba(142,207,246,1) 0%, rgba(134,189,251,1) 15%, rgba(169,160,255,1) 52%, rgba(237,198,241,1) 87%, rgba(252,225,255,1) 100%);
            text-align: center;
        }
        .two{
            width:79%;
            height: 100%;
            float:left;
            background-color: #efefef;
        }

        #person{
            border:none;
            background-color: rgb(224, 224, 224);
            width:80%;
            height:300px;
            border-radius: 20px;
            margin:auto;
        }
        #profile{
            margin:auto;
        }
        #picture{
            border: 1px solid black;
            width:150px;
            height:150px;
            border-radius: 80px;
            margin:auto;
            margin-bottom: 10px;
        }
        .profilebtn{
            margin:auto;
            height:30px;
            margin-top:25px;
            border:none;
            background-color: rgba(100, 175, 157, 0.45);
            color:rgb(64, 64, 64);
            font-weight: 600;
        }


        #personCount{
            background-color: white;
            width:80%;
            height:300px;
            border-radius: 20px;
            margin:auto;
            padding-top:15px;
        }
        #pcTitle{
            font-weight: 800;
            font-size:18px;
            color:rgb(64, 64, 64);
        }

        #box{
            text-align: center;
            margin-top:30px;
        }
        /*조직현황표*/
        #box1{
            background-color: rgb(224, 224, 224);
            margin:0 auto;
            width:550px;
            height:630px;
            display: inline-block;
            border-radius: 20px;
            overflow: hidden;
        }
        /*일정관리*/
        #box2{
            background-color: rgb(224, 224, 224);
            margin:0 auto;
            width:450px;
            height:630px;
            display: inline-block;
            margin-left:50px;            
            border-radius: 20px;
            overflow: hidden;
        }
        .boxTitle{
            width:100%;
            height:40px;
            background-color: rgba(196, 158, 212, 0.8);
            margin:0px;
            
        }
        .btitle{
            display: inline-block;
            font-weight: 600;
            font-size: 18px;
            float:left;
            margin-left:15px;
            margin-top: 8px;
        }
        .plus{
            display: inline-block;
            font-weight: 600;
            font-size: 20px;
            float:right;
            margin-right:5%;
            margin-top: 3px;
        }




        #logo>img{
            width:80%;
            height:100px;
            margin:auto;
            margin-top: 20px;
            display: inline-block;
        }
    </style>
</head>
<body>

    <!-- 메뉴바 -->
    <jsp:include page="common/menu.jsp"/>
    
    <div class="mainouter">
		<div class="innerOuter">
		
        <div class="one">
            <!--로고-->
            <div id="logo"><img src="resources/images/logo.png"  alt="logo	" /></div>
            <br><br>
            <div id="person">
				<br>
                <div id="profile">
                    <div id="picture">
                        <img src="" alt="">
                    </div>

                    <div align="center" style="font-weight: 600;">관리자</div>
                </div>

                <div>
                    <button class="profilebtn">마이페이지</button>
                    <button class="profilebtn">로그아웃</button>
                </div>
            </div>
            <br><br><br>


            <div id="personCount">
                <div id="pcTitle" style="">전체사원수</div> 
                <hr style="width:80%; ">
            </div>


        </div>
        <div class="two">
        <!-- 헤더 -->
        <jsp:include page="header.jsp"/>
        <!-- 메뉴바 -->
    	<jsp:include page="adminMenu.jsp"/>
            <!--조직인원현황표-->
            <div id="box">
                <div id="box1">
                    <div class="boxTitle">
                        <div class="btitle">조직 인원 현황 표</div>
                        <div class="plus">+</div>
                    </div>
                </div>

                <!--일정관리-->
                <div id="box2">
                    <div class="boxTitle">
                        <div class="btitle">일정관리</div>
                        <div class="plus">+</div>
                    </div>
                </div>
            </div>


        </div>
		

    </div>
    </div>
    
    <!-- 푸터바 -->
    <jsp:include page="common/footer.jsp" />
</body>
</html>