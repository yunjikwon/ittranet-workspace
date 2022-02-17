<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
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
            left:130px;
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
        #ac .menu1 a:hover{
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
        	margin-left:400px;
        	margin-bottom:150px; /*푸터바와의 간격*/
        }
        </style>
    	<script src="https://kit.fontawesome.com/6aa80e3f77.js" crossorigin="anonymous">
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
                    <a href="alllist.ml">메일</a>
                </li>
                <div id="border">
		               <li class="menu1">
		                  <a href="#"><i class="fa-solid fa-envelope"></i>안읽은메일함</a>
		               </li>
		               <li class="menu1">
		                  <a href="alllist.ml"><i class="fa-solid fa-inbox"></i>받은메일함</a>
		               </li>
		               <li class="menu1">
		                  <a href="#"><i class="fa-solid fa-paper-plane"></i>보낸메일함</a>
		               </li>
		               <li class="menu1">
		                  <a href="#"><i class="fa-solid fa-star"></i>중요메일함</a>
		               </li>
                       <li class="menu1">
                          <a href="#"><i class="fa-solid fa-clock"></i>임시보관함</a>
                       </li>
                       <li class="menu1">
                          <a href="#"><i class="fa-solid fa-ban"></i>스팸메일함</a>
                        </li>
                        <li class="menu1">
                          <a href="binlist.ml"><i class="fa-solid fa-trash-can"></i>휴지통</a>
                        </li>
            	</div>
            </ul>
         </div>
    </body>
    </html>
</html>