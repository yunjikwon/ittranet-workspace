<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        /*div{border:1px solid red;} */
        #footer{
            width:100%;
            height:200px;
            margin:auto;
            margin-top:1px;
            background-color: #efefef;
        }
        #footer-1{
            width:80%;
            height:20%;
            border-top:1px solid lightgray;
            border-bottom:1px solid lightgray;
        }
        #footer-2{width:100%;height:80%;}
        #footer-1, #footer-2{padding-left:50px}
        #footer-1 > a{
            text-decoration:none;
            font-weight: 600;
            margin:10px;
            line-height: 40px;
            color: black;
        }
        #footer-2>p{
            margin: 0;
            padding:10px;
            font-size: 13px;
        }
        #p2{text-align:center;}
    </style>
</head>
<body>
    <div id="footer">
        <div id="footer-1">
            <a href="#">회사소개</a> |
            <a href="#">이용약관</a> | 
            <a href="#">개인정보취급방침</a>
            
        </div>

        <div id="footer-2">
            <p id="p1">
                인터넷 및 모바일 환경에 대응하기 위해 온라인 및 모바일 마케팅에 최적화된 홈페이지 및 어플리케이션 구축부터 제품 디자인, 기구 설계, <br>
                하드웨어 개발, 시제품 및 금형 개발, 제품 양산에 이르기 까지 소프트웨어 및 하드웨어의 전체 개발 과정에 대한 전문 지식과 노하우로 <br>
                고객 맞춤형 원스탑 시스템을 구축하고 있습니다.
                <br>
                PHONE : 070-111-2222 <br>
                ADDRESS : 서울시 XXX XXXX <br> 
            </p>
            <p id="p2">Copyright ⓒ 2021-2022 IT!tranet</p>     
        </div>
    </div>
</body>
</html>
