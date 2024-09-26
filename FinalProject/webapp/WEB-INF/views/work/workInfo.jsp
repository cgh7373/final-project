<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
    .material-symbols-outlined {
      font-variation-settings:
      'FILL' 0,
      'wght' 400,
      'GRAD' 0,
      'opsz' 24
    }
    .title{
        font-size: 40px;
        font-weight: bold;
        padding-top: 80px;
        padding-bottom: 40px;
    }
    .filter{
        font-size: 20px;
        position: absolute;
        right: 365px;
    }
    .workInfo{
        padding: 30px;
        margin-top: 20px;
    }

    .list-area{ width: 70%;}

    thead {
        background-color: antiquewhite;
        border: none;
        height: 60px; 
    }
    tbody td {
        text-align: center;
        vertical-align: middle;
        font-size: 20px;
        height: 40px;
    }
    
    thead th{
        vertical-align: middle;
        font-size: 22px;
       
    }
    tbody tr {
        border-top: 1px solid lightgray; 
    }
    tbody tr:hover{
        cursor: pointer;
        background-color: rgb(250, 246, 240)
    }
    .material-symbols-outlined:hover{
        color: red;
    }

    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>

<div class="title" align="center">채용 공고 확인하기</div>
<div class="filter" align="right">상세조건</div>

<div class="workInfo" align="center">
    <table class="list-area">
        <thead>
            <tr>
                <th>공시기관</th>
                <th>공고</th>
                <th>채용구분</th>
                <th>고용형태</th>
                <th>스크랩</th>
            </tr>
        </thead>

        <tbody>
            <tr>
                <td>공기업</td>
                <td>개발자구함</td>
                <td>신입+경력</td>
                <td>정규직 서울</td>
                <td>       
                    <i class="fas fa-solid fa-heart"></i>
                </td>
            </tr>

            <tr>
                <td>사기업</td>
                <td>노예구함</td>
                <td>신입+경력</td>
                <td>비정규직</td>
                <td><span class="material-symbols-outlined">favorite</span></td>
            </tr>


            <tr>
                <td>공무원</td>
                <td>선비구함</td>
                <td>경력</td>
                <td>정규직 제주도</td>
                <td>
                    <span class="material-symbols-outlined">favorite</span>
                </td>
            </tr>
        </tbody>


    
    </table>
</div>

</body>
</html>