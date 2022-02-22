<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap{
        border: 1px solid red;
        width: 900px;
    }
    .todostatus{
        border: 1px solid rgb(190, 190, 190);;
        border-radius: 5mm;
        padding: 15px;
        background-color: rgba(209, 189, 220, 0.5);
        width: 830px;
        height: 140px;
        margin: 20px;
    }
    .percent{
        display: inline-block;
        border: 1px solid;
        width: 150px;
        height: 70px;
        margin-left: 90px;
    }
    .statusitems{
        border: 1px solid;
        width: 500px;
        height: 70px;
        float: right;
        margin-right: 25px;
        padding-top: 3%;
    }

    tr{
        height: 45px;
        background-color: rgba(255, 255, 255, 0.57);
        border-bottom: 1px solid silver;
        font-size: 13.5px;
    }

    .statuslist{
        margin-left: 45px;
        margin-top: 50px;
    }
    .todolist{
        margin-left: 45px;
        margin-top: 50px;
    }
</style>
</head>
<body>
    <div class="wrap">  
        <h4 style="font-weight:bold;">내 업무</h4>
        
        <!--업무 현황-->
        <div class="todostatus">
            <h6 class="statusmenu" style="font-weight: bold;">업무 현황</h6>
            <h1 class="percent" style="font-weight: bold;"><h style="font-size: 60px;">60 </h>%</h1>
            <div class="statusitems" style="text-align: center;">
                대기
                진행중
                완료
                지연
            </div>
        </div>
   
        <!-- 프로젝트별 현황 -->
       
        <div  class="statuslist">
            <h6 style="font-weight: bold;">프로젝트별 현황</h6>

            <table style="text-align: center; margin-top: 20px;" width="770px">
                <thead style="background-color:rgba(209, 189, 220, 0.7); border: none; font-size: 14px;" >
                    <tr>
                        <th width="220px">프로젝트명</th>
                        <th width="110px" style="color: rgb(248, 180, 32);">대기</th>
                        <th width="110px" style="color: rgb(91, 201, 139);">진행중</th>
                        <th width="110px" style="color: rgb(102, 172, 219);">완료</th>
                        <th width="110px" style="color: rgb(243, 130, 55);">지연</th>
                        <th width="110px">진행률</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>IT!tranet</th>
                        <td>2</td>
                        <td>2</td>
                        <td>2</td>
                        <td>1</td>
                        <td>57%</td>
                    </tr>
                    <tr>
                        <th>new project</th>
                        <td>1</td>
                        <td>1</td>
                        <td>2</td>
                        <td>1</td>
                        <td>50%</td>
                    </tr>
                    <tr>
                        <th>moa bank</th>
                        <td>1</td>
                        <td>0</td>
                        <td>3</td>
                        <td>0</td>
                        <td>75%</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 업무 현황 -->
        <div class="todolist">
            <table>
                <h6 style="font-weight: bold;">업무</h6>

                <table style="text-align: center; margin-top: 20px;" width="770px">
                    <thead style="background-color:rgba(209, 189, 220, 0.7); border: none; font-size: 14px;" >
                        <tr>
                            <th width="190px">프로젝트명</th>
                            <th width="280px">업무</th>
                            <th width="155px">상태</th>
                            <th width="155px">만기일</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>IT!tranet</td>
                            <td>DB 수정</td>
                            <td>대기</td>
                            <td>22.01.15</td>
                        </tr>
                        <tr>
                            <td>new project</td>
                            <td>최종 보고서 제출, 발표</td>
                            <td>진행중</td>
                            <td>22.01.13</td>
                        </tr>
                        <tr>
                            <td>IT!tranet</td>
                            <td>프로젝트 멤버 초대</td>
                            <td>대기</td>
                            <td>22.01.10</td>
                        </tr>
                        <tr>
                            <td>IT!tranet</td>
                            <td>기획보고서 제출</td>
                            <td>완료</td>
                            <td>22.01.10</td>
                        </tr>
                    </tbody>
                </table>
            </table>

        </div>
   
    </div>

</body>
</html>