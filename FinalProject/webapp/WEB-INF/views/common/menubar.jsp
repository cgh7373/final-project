<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			
		<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet" />
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
		<script defer src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
				width: 99vw;
				height: 70px;
				background-color: antiquewhite;
				align-items: center;
				position: relative;
				font-size: 20px;
				margin: 10px auto;
				border-radius: 4px;
				line-height: 75px;
				transition: .4s;
			}

			.project_name {
				margin-left: 2%;
				width: 140px;
				height: 100%;
			}

			.menubar {
				display: flex;
				position: absolute;
				right: 20%;
				transition: .4s;
				height: 100%;
				width: 50%;
				overflow: hidden;

				& .menuEls {
					height: 70px;

					transition: .4s;
					cursor: pointer;
					width: 20%;
					text-align: center;
					z-index: 1;

					&:hover {
						font-size: 21px;
					}
				}

				& .menuSlide {
					height: 64px;
					position: absolute;
					background-color: rgb(250, 208, 93);
					width: 20%;
					transform: translateX(-100%);
					z-index: 0;
					transition: .4s;
					border-radius: 10px;
					margin-top: 3px;
				}

			}

			.outer {
				width: 100%;
				height: auto;
				border-radius: 4px;
				background-color: beige;
				margin: 10px auto;
			}

			.about_user {
				position: absolute;
				display: flex;
				right: 3%;
				height: 100%;
				width: 4%;
				border-radius: 10px;
			}

			.about_user:hover span {
				color: rgb(250, 208, 93);
				cursor: pointer;
				transition: .2s;
			}

			.about_user:hover>div {
				color: rgb(250, 208, 93);
				cursor: pointer;
				transition: .2s;
			}

			.about_user span {
				width: 40%;
				height: 100%;
				font-size: 35px;
				line-height: 200%;
			}

			.about_user div {
				font-size: large;
				width: 60%;
				height: 100%;
				text-align: center;
			}
		</style>
	</head>

	<body>

		<header>
			<img class="project_name" src="resources/image/logo-removebg-preview.png" />

			<div class="menubar">
				<div class="menuSlide"></div>
				<div class="menuEls" onclick="toGitConnect()">프로젝트관리</div>
				<div class="menuEls" onclick="toCodeTyping()">코드작성</div>
				<div class="menuEls">코딩테스트</div>
				<div class="menuEls">커뮤니티</div>
				<div class="menuEls">취업관련</div>
			</div>

			<div class="about_user" onclick="loginUser()">
				<span class="material-symbols-outlined">login</span>
				<div>login</div>
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
				menuSlide.style.transform = `translate(\${currentIndex * 100}%, 105%)`;
			});

			function toCodeTyping() {
			    //const newWindow = window.open('http://localhost:5173/', '_blank', 'width=800,height=1000');
			    const newWindow = window.open('http://localhost:8234/FinalProject/react-app/index.html', '_blank', 'width=800,height=1000');
			}
			
			function loginUser() {
				location.href = "../member/loginPage.jsp";
				console.log("로그인 페이지 이동");
			}
			function toGitConnect(){
				location.href="../git/gitMainPage.jsp"
			}



		</script>

	</body>

	</html>