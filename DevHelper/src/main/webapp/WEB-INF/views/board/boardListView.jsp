<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.23.0/themes/prism.min.css" />
			<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.23.0/prism.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.23.0/prism-java.min.js"></script>
			<style>
				.outer {
					width: 100vw;
					height: 100vh;
					display: flex;
					flex-direction: column;
				}

				#sortingBar {
					height: 80px;
					display: flex;
					align-items: center;
					position: relative;

					& button {
						border-radius: 5px;
						font-size: 18px;
						background-color: white;
						height: 35px;
						line-height: 35px;
						margin-left: 3%;
						cursor: pointer;
					}

					& #languages {
						display: flex;
						font-size: 12px;
						position: absolute;
						right: 15%;
						flex-direction: column;
						color: gray;
						height: 100%;
						justify-content: center;
					}

					& #language {
						height: 25px;
						background-color: white;
						font-size: 18px;
					}

					& #radios {
						height: 100%;
						position: absolute;
						right: 5%;
						display: flex;
						flex-direction: column;
						color: gray;
						font-size: 12px;
						justify-content: center;

						& #answers {
							font-size: 16px;
							color: black;
						}
					}
				}

				#boardList {
					width: 100%;
					height: 70%;
				}

				#pagingArea {
					width: 100%;
					height: 10%;
				}
			</style>
		</head>

		<body>
			<!-- <code class="language-js">const hello = 'Hello, world!';</code> 이거 스니펫.. -->
			<jsp:include page="../common/menubar.jsp" />

			<div class="outer">

				<div id="sortingBar">
					<!-- 이거 나중에 not empty로 수정 -->
					<c:if test="${empty loginUser}">
						<button>게시글 작성</button>
					</c:if>

					<div id="languages"> 사용언어
						<select id="language">
							<option value="">JavaScript</option>
							<option value="">HTML</option>
							<option value="">JAVA</option>
						</select>
					</div>

					<div id="radios"> 답변여부
						<div id="answers">
							<label>
								<input type="radio" name="answered" value="a"> 답변됨
							</label>
							<label>
								<input type="radio" name="answered" value="n"> 답변안됨
							</label>
						</div>
					</div>

				</div>

				<div id="boardList">

					<div class="boards">
						<div class="thumbnail">



						</div>
						<div class="title"></div>
						<div class="count"></div>
						<div class="date"></div>
					</div>

				</div>

				<div id="pagingArea">
					<ul class="pagination">

						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
							</c:when>

							<c:otherwise>
								<li class="page-item"><a class="page-link"
										href="list.bo?cPage=${ pi.currentPage - 1 }">Previous</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item"><a class="page-link" href="list.bo?cPage=${ p }">${ p }</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${ pi.currentPage eq pi.endPage }">
								<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
							</c:when>

							<c:otherwise>
								<li class="page-item"><a class="page-link"
										href="list.bo?cPage=${ pi.currentPage + 1 }">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

			</div>

		</body>

		</html>