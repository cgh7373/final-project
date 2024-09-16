<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			@font-face {
				font-family: 'GangwonEdu_OTFBoldA';
				src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
				font-weight: normal;
				font-style: normal;
			}

			body * {
				font-family: 'GangwonEdu_OTFBoldA';
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
				margin: 20px auto;
				border-radius: 4px;
			}

			.project_name {
				margin-left: 3%;
			}

			.menubar {
				display: flex;
				position: absolute;
				right: 10%;
				transition: .4s;
				height: 100%;
				width: 50%;
				overflow: hidden;
				
				& .menuEls {
					height: 50px;
					line-height: 50px;
					transition: .4s;
					cursor: pointer;
					width: 20%;
					text-align: center;
					z-index: 1;
				}

				& .menuSlide {
					height: 50px;
					position: absolute;
					background-color: rgb(241, 156, 125);
					width: 20%;
					transform: translateX(-100%);
					z-index: 0;
					transition: .4s;
					border-radius: 5px;
				}

			}

			.outer {
				width: 100%;
				height: auto;
				border-radius: 4px;
				background-color: beige;
				margin: 10px auto;
			}

		</style>
	</head>

	<body>

		<header>
			<div class="project_name">Project Name</div>

			<div class="menubar">
				<div class="menuSlide"></div>
				<div class="menuEls">프로젝트관리</div>
				<div class="menuEls" onclick="toCodeTyping()">코드작성</div>
				<div class="menuEls">코딩테스트</div>
				<div class="menuEls">커뮤니티</div>
				<div class="menuEls">취업관련</div>
			</div>

			<div class="about_user">
				<!-- 여기 아이콘같은걸로 로그인/마이페이지 뭐 이런거 넣으시면 될듯 -->
			</div>
		</header>

		<div class="outer">

		</div>






		<script>

			const menuEls = document.querySelectorAll('.menuEls');
			const menuSlide = document.querySelector('.menuSlide');
			let currentIndex = 0;

			menuEls.forEach((el, index) => {
				el.addEventListener('mouseover', () => {
					menuSlide.style.transform = `translateX(\${index * 100}%)`;
					currentIndex = index;
				});
			});

			document.querySelector('.menubar').addEventListener('mouseleave', () => {
				menuSlide.style.transform = `translate(\${currentIndex * 100}%, 100%)`;
			});

			function toCodeTyping() {
				location.href = "codeTyping.co"
			}

		</script>

	</body>

	</html>