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
        .container{
            display:flex;
            justify-content: center;
            align-items: center;
            height:100vh;
        }
        #ac{
            width: 220px;
            border-radius: 10px;
        }
        #ac li a{
            display:block;
            width: 100%;
            text-align: center;
            height:50px;
            line-height: 50px;
        }
        #ac .menu1 a{
            color: #000;
            font-size: 18px;
            font-weight: 600;
        }
        #ac .menu1 a:hover{
            background-color:rgb(224, 224, 224);
        }
        .mail{
            background-color: rgba(19, 33, 142, 0.2);
            font-size: 20px;
            border-top-right-radius: 10px;
            border-top-left-radius: 10px;
        }
        .mail a{
            color:rgb(255, 255, 255);
            font-weight: 800;
        }
        #border{
            background-color: white;
            border-bottom-right-radius: 10px; 
            border-bottom-left-radius: 10px;
        }


        
        .container>ul>li i{
            width:30px;
            height:30px;
            margin-left:30px;
            margin-top:10px;
        }
        .container>ul>li>a{
            height:100%;
            width:100%;
        }
        .container>ul>li *{
            float:left;
        }
        .container>ul>li>a p{
            width:130px;
            height:100%;
        }
    </style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <ul id="ac">
                <li class="mail">
                    <a href="#">메일</a>
                </li>
               <li class="unread">
                  <a href="#">
                  	<i class="fa-solid fa-envelope"></i>안읽은메일함
                  </a>
               </li>
               <li class="mailreceive">
                  <a href="#">
                  	<i class="fa-solid fa-reply"></i>받은메일함
                  </a>
               </li>
               <li class="mailsend">
                  <a href="#">
                  	<i class="fa-solid fa-share"></i>보낸메일함
                  </a>
               </li>
               <li class="mailimpo">
                  <a href="#">
                  	<i class="fa-solid fa-star"></i>중요메일함
                  </a>
               </li>
               <li class="mailtem">
               		<a href="#">
               			<i class="fa-solid fa-timer"></i>임시보관함
               		</a>
               </li>
               <li class="mailspam">
               		<a href="#">
               			<i class="fa-solid fa-ban"></i>스팸메일함
               		</a>
               </li>
               <li class="mailbin">
               		<a href="#">
               			<i class="fa-solid fa-trash-can"></i>휴지통
               		</a>
               </li>
            </ul>
         </div>

    </body>
</html>
