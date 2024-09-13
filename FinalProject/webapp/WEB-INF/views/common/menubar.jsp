<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			@font-face {
				font-family: 'GowunBatang-Regular';
				src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff') format('woff');
				font-weight: normal;
				font-style: normal;
			}

			body * {
				font-family: 'GowunBatang-Regular';
				font-weight: normal;
			}

			header {
				display: flex;
				width: 100vw;
				height: 50px;
				background-color: antiquewhite;
				align-items: center;
				position: relative;
				font-size: 20px;
			}

			.project_name {
				margin-left: 3%;
			}

			.menubar {
				display: flex;
				position: absolute;
				right: 10%;
				gap: 20px;
				transition: .4s;

				& div {
					display: flex;
					height: 50px;
					justify-content: center;
					align-items: center;
					transition: .4s;
				}

				& div:hover {
					background-color: bisque;
					cursor: pointer;
				}
			}
		</style>
	</head>

	<body>

		<header>
			<div class="project_name">Project Name</div>

			<div class="menubar">
				<div>프로젝트관리</div>
				<div>코드작성</div>
				<div>코딩테스트</div>
				<div>커뮤니티</div>
				<div>취업관련</div>
			</div>

			<div class="about_user">
				<!-- 여기 아이콘같은걸로 로그인/마이페이지 뭐 이런거 넣으시면 될듯 -->
			</div>
		</header>

	</body>

	</html>