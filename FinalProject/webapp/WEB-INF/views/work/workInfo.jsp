<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>

<div class="title" align="center">채용 공고 확인</div>
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
                <th>
                    <i class="fa-regular fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                </th>
            </tr>

            <tr>
                <td>사기업</td>
                <td>노예구함</td>
                <td>신입+경력</td>
                <td>비정규직</td>
                <th><i class="fas fa-regular fa-star"></i></th>
            </tr>


            <tr>
                <td>공무원</td>
                <td>선비구함</td>
                <td>경력</td>
                <td>정규직 제주도</td>
                <th><i class="fas fa-regular fa-star"></i></th>
            </tr>
        </tbody>


    
    </table>
</div>

</body>
</html>