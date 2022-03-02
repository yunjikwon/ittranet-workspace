<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        #ac .menu1 a{
            color: #000;
            font-size: 18px;
            font-weight: 600;
        }
        #ac .menu1 a:hover{
            background-color:rgb(224, 224, 224);
        }
        .division{
            background: rgb(204, 224, 240);;
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
        .modal-body>div{float:left; margin:10px; border-radius: 1.05ex; background-color: rgb(181, 211, 236);}
        #left-area input{width:150px}
        #nameListArea{
            background-color: white;
            border:none;
            border-radius: 1.05ex;
            width: 150px;
        }
        .aTag, .aTag:hover{
		text-decoration: none;
		color: black;
		cursor: pointer;
        }
        .aTag:hover{opacity: 50%;}
        .xBtn{
            width:20px;
            height:20px;
            font-size: 12px;
            font-weight: 900;
            vertical-align: middle;
            text-align: center;
            border: none;
            border-radius: 1.5ex;
            background: rgba(195, 200, 247, 0.822);
        }
        .nameBtn{
            width:70px;
            height:20px;
            border-radius: 1.2ex;
            background-color: white;
            font-size: 12px;
            font-weight: 900;
            vertical-align: middle;
            text-align: center;
        }
        </style>
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
        </script>
    </head>
    <body>
       
        <div class="cont">
            <ul id="ac">
                <li class="division">
                    <a href="#">쪽지</a>
                </li>
                <div id="border">
                        <li class="menu1">
                            <a href="#" data-toggle="modal" data-target="#newMsg">+ 쪽지보내기</a>
                        </li>
                        <li class="menu1">
                            <a href="list.ms">받은 쪽지함</a>
                        </li>
                        <li class="menu1">
                            <a href="">중요 쪽지함</a>
                        </li>
                        <li class="menu1">
                            <a href="slist.ms">보낸 쪽지함</a>
                        </li>
                        
                </div>
            </ul>
        </div>
        
		<!-- 새 쪽지 모달창 -->
		<!-- The Modal -->
        <div class="modal" id="newMsg" >
            <div class="modal-dialog modal-lg">
                <div class="modal-content" >
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h3 class="modal-title">쪽지 보내기</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <form action="sendMsg.ms" id="addMsgForm" type="post" height="600px">
                        <div class="modal-body">
                            <div id="left-area" >
                                <table width="250px" height="400px" id="searchTable">
                                    <tr align="center">
                                        <th width="70px;" height="100px;">수신인</th>
                                        <td >
                                            <input type="text" name="nameInput">
                                            <div id="nameListArea"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="150px;" align="right">
                                            
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="right-area">
                            
                                    <table width="450px" height="400px">
                                        <tr style="border-bottom:1px solid grey">
                                            <th width="100" id="receiverNo" height="100px" >  
                                                수신인                                             
                                            </th>
                                            <td colspan="2" id="receiverName">
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <th colspan="3">
                                                내용
                                            </th>
                                        </tr>
                                        <tr>
                                            <td colspan="3" align="center">
                                                <textarea name="content" id="content" cols="50" rows="10" required></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                    <input type="hidden" id="sEmpNo" name="sEmpNo" value="${loginUser.empNo }">
                                    <input type="hidden" id="rEmpArr" name="rEmpArr[]" value="">
                            </div>
                        </div>
                        <br clear="both">
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btnStyle" id="sendMsgBtn" >전송</button>
                            <button type="button" class="btnStyle" data-dismiss="modal">닫기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            // 모달창에서 사원 검색용 ajax
            $(function(){
                const $nameInput = $("#searchTable input[name=nameInput]");

                $nameInput.keyup(function(){
                   // console.log($nameInput.val());

                    if($nameInput.val().length >= 1){
                        $.ajax({
                            url:"searchEmp.ms",
                            data:{keyword:$nameInput.val()},
                            success:function(list){
                                let value = "";

                                for(let i in list){
                                    value += "<a class='aTag selected' style='font-size:12px;'>" + list[i].teamName + " | " + list[i].empName 
                                            + "<input type='hidden' class='empNo' value='" + list[i].empNo + "'>"
                                            + "<input type='hidden' class='empName' value='" + list[i].empName + "'></a><br>";

                                }
                                $("#nameListArea").html(value);

                            },error:function(){
                                console.log("사원 검색용 ajax 통신 실패");
                            }
                        
                        })
                    }
                })
            })
            
            
            let empArr = new Array();
            $(document).on("click", ".selected", function(){
                let $empNo = $(this).children(".empNo").val();
                let $empName = $(this).children(".empName").val();
                console.log($empNo);
                console.log($empName);
                let $value = "<button type='button' class='nameBtn'>" 
                            + $empName + "</button><input type='hidden' class='rEmpNo' name='rEmpNo' value='"
                            + $empNo + "'><button class='xBtn'>X</button>";
                
                $("#receiverName").append($value);
                $(this).each(function(){
                    empArr.push($empNo);
                })
                $("#rEmpArr").attr("value", empArr);
                console.log(empArr);
                console.log($("#rEmpArr").val());
            })

            $(document).on("click", ".xBtn", function(){
                let $empNo = $(this).prev(".rEmpNo").val();
                $(this).prev().prev(".nameBtn").remove();
                $(this).remove();

                empArr = empArr.filter((element) => element !== $empNo);
                
            })

            function sendMsg(){
                let $rEmpNo = $("#receiverName input[name=rEmpNo]").val();
                let $sEmpNo = '${loginUser.empNo}';
                let $content = $("#content").val();
               
                $("#sEmpNo").attr("value", $sEmpNo);

                $("#addMsgForm").attr("action", "sendMsg.ms").submit();
            }
        </script>
		
        

    </body>

</html>