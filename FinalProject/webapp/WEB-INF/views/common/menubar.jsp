<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet" />
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
		<script defer src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<!-- <script defer src="resources/js/newsApi.js"></script> 이거 나중에 spring으로 -->
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
			integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
			crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
			integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<style>
			@font-face {
				font-family: 'GangwonEdu_OTFBoldA';
				src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
				font-weight: normal;
				font-style: normal;
			}

			html {
				overflow-y: scroll;
				/* Forces vertical scrollbar */
			}

			body * {
				font-family: 'GangwonEdu_OTFBoldA';
				font-weight: normal;
			}

			header {
				display: flex;
				width: 98vw;
				height: 70px;
				background-color: antiquewhite;
				align-items: center;
				position: relative;
				top: 15px;
				font-size: 20px;
				margin: auto;
				z-index: 10;
				line-height: 75px;
				border-radius: 10px;
			}

			.project_name {
				margin-left: 2%;
				width: 140px;
				height: 100%;
				cursor: pointer;
			}

			.menubar {
				display: flex;
				position: absolute;
				right: 20%;
				transition: .4s;
				height: 100%;
				width: 50%;
				overflow: hidden;

			}

			.menuEls {
				height: 70px;
				transition: .4s;
				cursor: pointer;
				width: 20%;
				text-align: center;
				z-index: 1;
			}

			.menuEls:hover {
				font-size: 21px;
			}

			.menuSlide {
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

			.outer {
				position: relative;
				width: 98vw;
				height: auto;
				border-radius: 10px;
				margin: 10px auto;
				overflow: hidden;
				padding: 5px;
				display: flex;
				flex-direction: column;
				transition: .3s;
			}

			.outer::before {
				content: "";
				position: absolute;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				background-image: url(resources/image/Designer5.jpeg);
				background-size: cover;
				background-attachment: fixed;
				opacity: 0.2;
				z-index: -1;
			}

			.about_user {
				position: absolute;
				display: flex;
				right: 2%;
				height: 100%;
				width: 4%;
				border-radius: 10px;
				gap: 20px;
			}

			.about_user span {
				width: 40%;
				height: 100%;
				font-size: 35px;
				line-height: 200%;
				cursor: pointer;
				transition: .2s;
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
	
		<c:if test="${ not empty alertMsg }">
			<script>
				toastr.success("${alertMsg}");
			</script>
			<c:remove var="alertMsg"/>
		</c:if>	
		
		<c:if test="${ not empty errorMsg }">
			<script>
				toastr.error("${errorMsg}");
			</script>
			<c:remove var="errorMsg"/>
		</c:if>	
		<!-- info랑 warning도 있음 -->

		<header>
			<img class="project_name" src="resources/image/logo-removebg-preview.png" onclick="toMain()" />

			<div class="menubar">
				<div class="menuSlide"></div>
				<div class="menuEls" onclick="toCommunity()">HOME</div>
				<div class="menuEls" onclick="toProjectMain()">프로젝트관리</div>
				<div class="menuEls">코딩테스트</div>
				<div class="menuEls">취업관련</div>
				<div class="menuEls">게시판</div>
			</div>`

			<div class="about_user">
				<span class="material-icons" onclick="toCodeTyping()">description</span>
				<span class="material-symbols-outlined" onclick="loginUser()">login</span>
			</div>
		</header>

		<div class="outer">

		</div>

		<script>
			toastr.options = {
				"progressBar": true,
				"timeOut": "1800",
			}
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

			function toMain() {
				location.href = "toMain"
			}

			function toCommunity() {
				location.href = "searchNews"
			}

			function toCodeTyping() {
				const newWindow = window.open('http://localhost:8234/FinalProject/react-app/index.html', '_blank', 'width=800,height=1000');
			}

			function loginUser() {
				location.href = "login.me";
			}

			function toProjectMain() {
				location.href = "projectMain"
			}

			const icons = document.querySelectorAll('.about_user span');

			icons.forEach(icon => {

				icon.addEventListener('mouseenter', () => {
					icon.style.color = 'rgb(250, 208, 93)';
				});

				icon.addEventListener('mouseleave', () => {
					icon.style.color = '';
				});

			});


		</script>

	</body>

	</html>