<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <!-- jQuery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <style>
    body {
      height: 1500px;
    }

    .material-symbols-outlined {
      font-variation-settings:
        'FILL' 0,
        'wght' 400,
        'GRAD' 0,
        'opsz' 24;
    }

    .title {
      font-size: 40px;
      font-weight: bold;
      padding-top: 80px;
      padding-bottom: 40px;
    }

    .search-bar-container {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-bottom: 20px;
    }

    .search-bar {
      font-size: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 10px;
      display: none;
      /* Initially hidden */
    }

    .search-bar input {
      padding: 10px;
      font-size: 20px;
      width: 350px;
    }

    .search-bar button {
      padding: 10px 20px;
      font-size: 20px;
      cursor: pointer;
    }

    .workInfo {
      padding: 30px;
      margin-top: 20px;
      text-align: center;
    }

    .list-area {
      width: 70%;
      margin: 0 auto;
    }

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

    thead th {
      vertical-align: middle;
      font-size: 22px;
    }

    tbody tr {
      border-top: 1px solid lightgray;
    }

    tbody tr:hover {
      cursor: pointer;
      background-color: rgb(250, 246, 240);
    }

    .favorite:hover {
      color: red;
    }

    .search-icon-only {
      display: flex;
      cursor: pointer;
    }

    input[name="place"]:focus,
    input[name="job"]:focus {
      caret-color: transparent;
    }

    /* Back to Top button styling */
    #back-to-top {
      position: fixed;
      bottom: 40px;
      right: 40px;
      font-size: 18px;
      padding: 10px 20px;
      background-color: #000;
      color: #fff;
      border: none;
      cursor: pointer;
      border-radius: 5px;
    }

    #back-to-top:hover { background-color: #555;}
  </style>
</head>

<body>
  <jsp:include page="../common/menubar.jsp" />

  <div class="title" align="center">채용 공고 확인하기</div>

  <div class="search-bar-container">
    <div class="search-bar" id="search-bar">
      <span class="material-symbols-outlined">search</span>
      <input type="text" name="keyword" placeholder="검색어를 입력하세요">
      <input type="text" name="place" placeholder="지역을 선택해주세요">
      <input type="text" name="job" placeholder="직무를 선택해주세요">
      <button>찾기</button>
      <span class="material-symbols-outlined" id="close-btn">close</span>
    </div>

    <div class="search-icon-only" id="search-icon-only">
      <span class="material-symbols-outlined">search</span>
    </div>
  </div>

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
          <td><i class="fas fa-solid fa-heart"></i></td>
        </tr>

        <tr>
          <td>사기업</td>
          <td>노예구함</td>
          <td>신입+경력</td>
          <td>비정규직</td>
          <td><span class="material-symbols-outlined favorite">favorite</span></td>
        </tr>

        <tr>
          <td>공무원</td>
          <td>선비구함</td>
          <td>경력</td>
          <td>정규직 제주도</td>
          <td><span class="material-symbols-outlined">favorite</span></td>
        </tr>
      </tbody>
    </table>
  </div>

  
  <button id="back-to-top"><span class="material-symbols-outlined">arrow_upward</span></button>

  <script>
    $(document).ready(function () {
      
      $('#search-icon-only').click(function () {
        $('#search-bar').show();
        $('#search-icon-only').hide();
      });

      $('#close-btn').click(function () {
        $('#search-bar').hide();
        $('#search-icon-only').show();
      });

        $('#back-to-top').click(function () {
          $('html, body').animate({ scrollTop: 0 }, 'slow');
          return false;
        });
      });
  </script>
</body>

</html>
