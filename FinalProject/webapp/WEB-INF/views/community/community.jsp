<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>뉴스 검색</title>
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />

    <form action="searchNews" method="get">
        <input type="text" name="query" value="뉴스" placeholder="검색어를 입력하세요." />
        <input type="submit" value="검색" />
    </form>

    <ul id="newsList"></ul>

    <div class="news"></div>
    <div class="hotTopic"></div>
    <div class="awaitTopic"></div>
    <div class="myTopic"></div>

	<ul id="newsList">
    <c:forEach var="item" items="${items}">
	        <li>
	            <a href="${item.link}">${item.title}</a>
	            <p>${item.description}</p>
	            <small>Published on: ${item.pubDate}</small>
	        </li>
	    </c:forEach>
	</ul>
	
</body>
</html>