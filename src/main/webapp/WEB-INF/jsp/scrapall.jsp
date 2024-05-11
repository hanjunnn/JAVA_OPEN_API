<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>News</title>
</head>
<body>
<h1>News List</h1>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Link</th>
        <th>Publication Date</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${newsList}" var="news">
        <tr>
            <td>${news.id}</td>
            <td>${news.title}</td>
            <td>${news.description}</td>
            <td>${news.link}</td>
            <td>${news.pubDate}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
