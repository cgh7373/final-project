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
      height: 2000px;
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
      width: 1300px;
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
      font-size: 18px;
      height: 45px;
    }

    thead th {
      vertical-align: middle;
      font-size: 20px;
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
    <table class="list-area" id = "result1">
      <thead>
        <tr>
          <th width="160px">공시기관</th>
          <th>제목</th>
          <th width="160px">마감일</th>
          <th width="180px">채용분야</th>
          <th width="150px">고용형태</th>
          <th width="150px">채용구분</th>
          <th width="75px">근무지</th>
          <th width="65px">스크랩</th>
        </tr>
      </thead>

      <tbody>
      </tbody>
    </table>
  </div>
  <script>
  let currentPage = 1;
  let pageSize = 15;
  $(function(){
	  loadData(currentPage);
  });
  
  function loadData(page){
		$.ajax({
			url:"work.wo",
			data:{pageNo:page, numOfRows:pageSize},
			success:function(data){
				console.log(data);
				
				let items = data.result;
				let html = "";
				
				$.each(items,function(index,job){
					 html += "<tr>";
			          html += "<td>" + job.instNm + "</td>";
			          html += "<td>" + job.recrutPbancTtl + "</td>";
			          html += "<td>" + job.pbancEndYmd + "</td>";
			          html += "<td>" + job.ncsCdNmLst + "</td>";
			          html += "<td>" + job.hireTypeNmLst + "</td>";
			          html += "<td>" + job.recrutSeNm + "</td>";
			          html += "<td>" + job.workRgnNmLst + "</td>";
			          html += "<td><span class='material-symbols-outlined favorite'>favorite</span></td>";
			          html += "</tr>";
				});
				
				$("#result1 tbody").html(html);	
			},
			error:function(){
				console.log("API AJAX에러")
			}
		})
	}
  
  $("#nextPage").click(function() {
	currenPage++;
	loadData(currentPage);
	});

$("#prevPage").click(function() {
    if (currentPage > 1) {
      currentPage--;
      loadData(currentPage);
    }
  });
  </script>

  
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

  <div id="pagination" style="text-align: center; margin-top: 20px;">
    <button id="prevPage">Prev</button>
    <button id="currentPage">1</button>
    <button id="nextPage">Next</button>
  </div>
</body>

</html>
