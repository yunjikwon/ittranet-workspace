<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


    
        <style>
        
       	ol,ul,li{list-style: none;}
        *{padding:0; margin:0;}
        a{text-decoration: none;}
        a:hover { text-decoration:none !important }
        .cont{
            justify-content: center;
            align-items: center;
            width:220px;
            
            position:absolute;
            top:0;
            left:120px;
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
        #ac .sideMenu a{
            color: #000;
            font-size: 18px;
            font-weight: 600;
        }
        #ac .sideMenu.on{
            background-color:rgb(191, 134, 218);
        }
        #ac .subMenu{
            display:none;
        }
        #ac .subMenu a{
            color:black;
            font-size: 16px;
            font-weight: 500;
        }
        #ac .subMenu a:hover{
            background-color:rgb(224, 224, 224);
        }
        .division{
            background-color: rgba(19, 33, 142, 0.2);
            font-size: 20px;
            border-top-right-radius: 10px;
            border-top-left-radius: 10px;
            cursor:pointer !important;
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
        
        #newDraft{ /*새기안 a태그*/
        	background-color: rgba(158, 214, 252, 0.44);
			height:70px;
            font-size: 20px;
            cursor:pointer;
        }
        #newDraft a{
        	width:220px;
        	height:70px;
        	color:black;
            font-weight: 800;
            background:none;
            text-align:center;
            border:none;
        }
 
        
        
        </style>
        

    </head>
    
    <body>
        <div class="cont">
            <ul id="ac">
                <li class="division">
                    <a href="#">전자결재</a>
                </li>
                
                <li id="newDraft">                	  
                    <a class="approvalbtn" data-toggle="modal" data-target="#newFormModal" role="button" data-backdrop="static">
                      	+ 새 기안
                    </a>
                    
                </li>
                
                <div id="border">
	               <li class="sideMenu">
	                  <a href="#">기안함</a>
	                  <ul class="subMenu">
	                  	 <li><a href="draftWait.dr?category=1">대기 결재</a></li>
	                     <li><a href="#">진행중 결재</a></li>
	                     <li><a href="#">반려 결재</a></li>
	                     <li><a href="#">완료 결재</a></li>
	                  </ul>
	               </li>
	               <li class="sideMenu">
	                  <a href="#">결재함</a>
	                  <ul class="subMenu">
	                     <li><a href="#">미처리 결재</a></li>
	                     <li><a href="#">완료 결재</a></li>
	                  </ul>
	               </li>
            	</div>
            	
            </ul>
         </div>

		<!-- 새기안 모달창 -->
		<div id="newFormModal" class="modal fade" tabindex="-1" role="dialog" >
		    <div class="modal-dialog">
		        <div class="modal-content">
			   		<jsp:include page="newForm.jsp"/>
		        </div>
		    </div>
		</div>

		<script>
		/*스크롤 효과 */
	   		$(function(){
	   			$(window).scroll(function(){
	   				let scrollTop = $(this).scrollTop(); // 현재 스크롤위치
	   				let mainOuterTop = $(".mainOuter").offset().top;
	   				/*
	   				console.log("scroll : " + scrollTop);
	   				console.log("mainOuter : " + mainOuterTop);
	   				*/
	   				if(scrollTop > mainOuterTop - 70){
	   					$(".cont").addClass("fixed");
	   				}else{
	   					$(".cont").removeClass("fixed");
	   				}
	   			})
	   			
	   			
	   		})
		/*사이드바 토글 효과*/
            $('.sideMenu').click(function(){

	            $('.subMenu').slideUp();
	
	            if ($(this).children('.subMenu').is(':hidden')){
	                $(this).children('.subMenu').slideDown();	
	            } else{
	                $(this).children('.subMenu').slideUp();
	            }
	        });
		
		/*게시판 구분
       	$(function(){
       		$("#border>tbody>tr").click(function(){
       			location.href = 'detail.bo?bno=' + $(this).children(".bno").text();
       		});
       	})
	   */
	   
        </script>
        

    </body>

</html>