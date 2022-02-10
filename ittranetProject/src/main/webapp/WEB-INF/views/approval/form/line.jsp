<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .contentArea{
            height: 720px;
            text-align: center;
        }
        #title{
            font-size: 20px;
            margin:10px;
            margin-left: 20px;
            font-weight: 700;
            color:rgb(94, 94, 94);
        }
        #searchBox-1{
            border:2px solid lightgray;
            width: 90%;
            height:50px;
            text-align: center;
            margin:auto;
            padding: 5px 0px;
        }
        .stitle{
            display: inline-block;
            font-size: 18px;
            font-weight: 600;
            color:rgb(94, 94, 94);
            margin-right: 3px;
        }
        .searchBox{
            display: inline-block;
            width:240px;
            height:30px;
            border:1px solid lightgray;
            border-radius: 2px;
            vertical-align: middle;
            margin-top:-5px;
        }
        .sinput{
            font-size: 15px;
            width:170px;
            height:90%;
            padding:1px;
            border:0px;
            outline: none;
            float:left;
        }
        .sbtn{
            width:50px;
            height:100%;
            border:0px;
            background-color: rgba(19, 33, 142, 0.2);
            outline: none;
            float:right;
            border-radius: 2px;
        }
        
        .tablelayout{
            width:90%;
            height:200px;
            margin:auto;
            border-bottom: 2px solid rgba(94, 94, 94, 0.6);
        }
        .boardList{
            width:100%;
            table-layout: fixed;
            empty-cells:show;
            text-align: center;
        }
        .boardList tr{
            white-space:normal;
            word-break:break-all;
            height:30px;
        }
        .boardList th{
            background-color: rgba(94, 94, 94, 0.8);
            color:white;
            padding:8px;
        }

        .arrowbtn{
            background-color: white;
            border:none;
            border-radius: 5px;
            width:30px;
            height:30px;
            margin:20px 10px;

        }
        .arrowbtn img{
        	width:25px;
            height:25px;
            margin:auto;
        }        
        #savebtn{
            background-color: rgba(94, 94, 94, 0.8);
            color:white;
            width:80px;
            height: 40px;
            border:none;
            border-radius: 3px;
        }

        hr{
            border:1px solid gray;
            background-color: gray;
        }
        

        
    </style>
    <body>
    <!-- 결재선 모달창 -->    	
	<div class="modal-header">
	  <h5 class="modal-title" id="lineModalLabel">결재선 지정</h5>
	  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	    <span aria-hidden="true">x</span>
	  </button>
	</div>
	
	<!-- Modal body -->
	<div class="modal-body">
        <div class="contentArea">
    
            <br>
            <div id="searchBox-1">
                <div style="margin-top:5px;">
                    <label class="stitle">팀</label>
                    <div class="searchBox">
                        <input type="text" name="" class="sinput" placeholder="검색어 입력">
                        <button type="submit" class="sbtn">검색</button>
                    </div>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <label class="stitle">성명</label>
                    <div class="searchBox">
                        <input type="text" name="" class="sinput" placeholder="검색어 입력">
                        <button type="submit" class="sbtn">검색</button>
                    </div>
                </div>
            </div>
        <br>
            <div class="tablelayout">
	            <table class="boardList" align="center">
	                <thead>
	                  <tr>
	                    <th width="10%"></th>
	                    <th>팀</th>
	                    <th>직급</th>
	                    <th>직원코드</th>
	                    <th>직원명</th>
	                  </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td><input type="checkbox" name="" id=""></tdw>
	                        <td>개발팀</td>
	                        <td>팀장</td>
	                        <td>T004</td>
	                        <td>김팀장</td>
	                    </tr>
	                    <tr>
	                        <td><input type="checkbox" name="" id=""></td>
	                        <td>개발팀</td>
	                        <td>대리</td>
	                        <td>T003</td>
	                        <td>최대리</td>
	                    </tr>
	                    
	                </tbody>
	            </table>
	        </div>

            <button class="arrowbtn"><img src="resources/images/approval/down-arrow.png" alt=""></button>
            <button class="arrowbtn"><img src="resources/images/approval/up-arrow.png" alt=""></button>

            <div class="tablelayout">
	            <table class="boardList" align="center">
	                <thead>
	                  <tr>
	                    <th width="10%"></th>
	                    <th>팀</th>
	                    <th>직급</th>
	                    <th>직원코드</th>
	                    <th>직원명</th>
	                  </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td><input type="checkbox" name="" id=""></tdw>
	                        <td>개발팀</td>
	                        <td>팀장</td>
	                        <td>T004</td>
	                        <td>김팀장</td>
	                    </tr>
	                    <tr>
	                        <td><input type="checkbox" name="" id=""></td>
	                        <td>개발팀</td>
	                        <td>대리</td>
	                        <td>T003</td>
	                        <td>최대리</td>
	                    </tr>
	
	                </tbody>
	            </table>
	        </div>

            <br><br>
            <button id="savebtn" type="submit">저장하기</button>


        </div>    
       </div>
    </body>
    </html>