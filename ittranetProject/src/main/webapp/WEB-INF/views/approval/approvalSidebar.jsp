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
        #newDraft{ /*새기안 a태그*/
        	background-color: rgba(158, 214, 252, 0.44);
			height:70px;
            font-size: 20px;
        }
        #newDraft button{
        	width:220px;
        	height:70px;
        	color:black;
            font-weight: 800;
            background:none;
            text-align:center;
            border:none;
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
        	margin-bottom:150px; /*푸터바와의 간격*/
        }
        
        
        /*새기안 모달창 스타일*/
        .contentArea{
        
        height: 600px;
        text-align: center;
        margin:auto;
   		}
		#newFormtitle{
		    font-size: 20px;
		    margin:10px;
		    margin-left: 20px;
		    font-weight: 700;
		    color:rgb(94, 94, 94);
		}
		.content{
		    display: inline-block;
		    width:40%;
		    height:20%;
		    margin:10px;
		    padding:10px;
		    text-align: center;
		    box-shadow: 1px 1px 5px rgba(94, 94, 94, 0.8);
		    cursor:pointer;
		}
		#cTitle{
		    font-size: 17px;
		    font-weight: 600;        
		}
		#cEx{
		    font-size: 14px;
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
                <li id="newDraft">
                	<button onclick="fnModuleInfo('${test.id}')">
                	<!--  
                    <button class="approvalbtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#newFormModal">
                    -->
                    	+ 새 기안
                    </button>
                </li>
                <div id="border">
               <li class="menu1">
                  <a href="#">기안함</a>
                  <ul class="menu2">
                  	 <li><a href="#">대기 결재</a></li>
                     <li><a href="#">진행중 결재</a></li>
                     <li><a href="#">반려 결재</a></li>
                     <li><a href="#">완료 결재</a></li>
                  </ul>
               </li>
               <li class="menu1">
                  <a href="#">결재함</a>
                  <ul class="menu2">
                     <li><a href="#">미처리 결재</a></li>
                     <li><a href="#">완료 결재</a></li>
                  </ul>
               </li>
              
            </div>
            </ul>
         </div>
         
<!-- newFormModal-->
  <div class="modal fade" id="newFormModal" tabindex="-1" role="dialog" aria-labelledby="newFormModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
    </div>
  </div>
</div>
         
         

        <script>
        	// 사이드바 토글
            $('.menu1').click(function(){

            $('.menu2').slideUp();

            if ($(this).children('.menu2').is(':hidden')){
                $(this).children('.menu2').slideDown();
                
                $statsArrow .attr('src', src);

            } else{
                $(this).children('.menu2').slideUp();
            }
        });
        	
         /* 사이드바 스크롤 효과
            var floatPosition = parseInt($(".container").css('top'));
            $(window).scroll(function(){
                var currentTop = $(window).scrollTop();
                var bannerTop = currentTop + floatPosition + "px";

                $(".container").stop().animate({
                    "top" : bannerTop
                }, 1200);
            }).scroll();
		*/
		
		/*모달*/
		function fnModuleInfo(str){
		   $('#newFormModal .modal-content').load("newForm?id="+str);
		   $('#newFormModal').modal();

		}
		
        </script>
        

    </body>

</html>