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
        </style>

    </head>
    <body>
        <div class="container">
            <ul id="ac">
                <li class="division">
                    <a href="#">전자결재</a>
                </li>
                <div id="border">
               <li class="menu1">
                  <a href="#">Menu1</a>
               </li>
               <li class="menu1">
                  <a href="#">Menu2</a>
               </li>
               <li class="menu1">
                  <a href="#">Menu3</a>
                  
               </li>
               <li class="menu1">
                  <a href="#">Menu4</a>
               </li>
            </ul>
            </div>
         </div>

    </body>
    </html>
</html>