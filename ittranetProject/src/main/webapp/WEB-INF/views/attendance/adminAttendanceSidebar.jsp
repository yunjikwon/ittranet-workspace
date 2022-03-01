<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- jQuery 라이브러리 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <style>
       	ol,ul,li{list-style: none;}
        *{padding:0; margin:0;}
        a{text-decoration: none;}
        .cont{
            justify-content: center;
            align-items: center;
            width:220px;
            
            position:absolute;
            top:0;
            left:160px;
        }
        .fixed{
        	position: fixed !important;
        	left:230px !important;
        	top:70px !important;
        }
        #ac{
            width: 220px;
            border-radius: 10px;
        }
        #ac li a{
            display:block;
            width: 100%;
            text-align: center;
            height:70px;
            line-height: 70px;
            text-decoration: none !important;
        }
        #ac .menu1 a{
            color: #000;
            font-size: 18px;
            font-weight: 600;
        }
        #ac .menu1.on{
            background-color:rgb(191, 134, 218);
        }
        #ac .menu2{
            display:none;
        }
        #ac .menu2 a{
            color:black;
            font-size: 16px;
            font-weight: 500;
        }
        #ac .menu2 a:hover{
            background-color:rgb(224, 224, 224);
        }
        .division{
            background-color: rgba(19, 33, 142, 0.2);
            font-size: 20px;
            border-top-right-radius: 10px;
            border-top-left-radius: 10px;
        }
        .division a{
            color:rgb(255, 255, 255);
            font-weight: 800;
        }
        #border{
            background-color: white;
            border-bottom-right-radius: 10px; 
            border-bottom-left-radius: 10px;
        }
        .mainOuter{
        	display:inline-block !important;
        	background-color:rgb(224, 224, 224);
        	width:65%;
        	height:auto;
        	margin-left:450px;
        	margin-bottom:150px;
        }
        /*근태 공용 스타일*/
        /*근태 공용 스타일*/
        /*버튼*/
        .att-btn{
            border: 2px solid rgb(131, 26, 163);
            background: none;
            color: rgb(131, 26, 163);
            font-weight: 800;
            border-radius: 5px;
            width: 100px;
            height: 35px;
            margin-left: 29px;
            margin-top:10px;
        }
        .att-btn:hover{
            background: rgb(131, 26, 163);
            color: #ffffff;
        }
        /*input, select*/
        #att-search input, select{
            height: 36px;
            width: 180px;
            border: 1px solid lightgray;
            border-radius: 5px;
        }
        /*outer*/
        .vc-box{
            background: white;
            width: 950px;
            border-radius: 25px;
            padding: 50px;
            margin-left: 15px;
            font-size: 17px;
            margin-bottom: 50px;
            box-shadow: 0 8px 20px 0 rgba(23, 23, 24, 0.096);
        }
        </style>
       	<script>
	   		$(function(){
	   			$(window).scroll(function(){
	   				let scrollTop = $(this).scrollTop(); // 현재 스크롤위치
	   				let mainOuterTop = $(".mainOuter").offset().top;
	   				
	   				if(scrollTop > mainOuterTop - 70){
	   					$(".cont").addClass("fixed");
	   				}else{
	   					$(".cont").removeClass("fixed");
	   				}
	   			})
	   		})
   	</script>

    </head>
    <body>
        <div class="cont">
            <ul id="ac">
                <li class="division">
                    <a href="dayat.ad">근태관리</a>
                </li>
                <div id="border">
               <li class="menu1">
                  <a href="#">근무 관리</a>
                  <ul class="menu2">
                     <li><a href="dayat.ad">일일근태 관리</a></li>
                     <li><a href="atstats.ad">근무 통계</a></li>
                  </ul>
               </li>
               <li class="menu1">
                  <a href="#">휴가 관리</a>
                  <ul class="menu2">
                     <li><a href="yvclist.ad">미처리 휴가</a></li>
                     <li><a href="fvclist.ad">처리완료 휴가</a></li>
                  </ul>
               </li>
            </div>
            </ul>
         </div>

        <script>
            $('.menu1').click(function(){

            $('.menu2').slideUp();

            if ($(this).children('.menu2').is(':hidden')){
                $(this).children('.menu2').slideDown();
                
                $statsArrow .attr('src', src);

            } else{
                $(this).children('.menu2').slideUp();
            }
        });
        </script>

    </body>
    </html>
</html>