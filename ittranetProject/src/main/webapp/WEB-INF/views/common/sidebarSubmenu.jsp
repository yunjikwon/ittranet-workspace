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
        	display:inline-block; !important;
        	background-color:rgb(224, 224, 224);
        	width:65%;
        	height:auto;
        	margin-left:450px;
        	margin-bottom:150px;
        }
        </style>
       	<script>
	   		$(function(){
	   			$(window).scroll(function(){
	   				let scrollTop = $(this).scrollTop(); // 현재 스크롤위치
	   				let mainOuterTop = $(".mainOuter").offset().top;
	   				
	   				console.log("scroll : " + scrollTop);
	   				console.log("mainOuter : " + mainOuterTop);
	   				
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
                    <a href="#">전자결재</a>
                </li>
                <div id="border">
               <li class="menu1">
                  <a href="#">Menu1</a>
                  <ul class="menu2">
                     <li><a href="#">Sub-Menu1</a></li>
                     <li><a href="#">Sub-Menu2</a></li>
                     <li><a href="#">Sub-Menu3</a></li>
                  </ul>
               </li>
               <li class="menu1">
                  <a href="#">Menu2</a>
                  <ul class="menu2">
                     <li><a href="#">Sub-Menu1</a></li>
                     <li><a href="#">Sub-Menu2</a></li>
                     <li><a href="#">Sub-Menu3</a></li>
                  </ul>
               </li>
               <li class="menu1">
                  <a href="#">Menu3</a>
                  <ul class="menu2">
                     <li><a href="#">Sub-Menu1</a></li>
                     <li><a href="#">Sub-Menu2</a></li>
                     <li><a href="#">Sub-Menu3</a></li>
                  </ul>
               </li>
               <li class="menu1" style="border-radius: 10px;">
                  <a href="#">Menu4</a>
                  <ul class="menu2">
                     <li><a href="#">Sub-Menu1</a></li>
                     <li><a href="#">Sub-Menu2</a></li>
                     <li><a href="#">Sub-Menu3</a></li>
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