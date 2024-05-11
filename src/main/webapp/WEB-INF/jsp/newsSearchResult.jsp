<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>News Search</title>
</head>
<body>
<style>
    table {
        border-collapse: collapse;
        border: 0;
    }
    th,
    td {
        border: 2px solid #aaa;
    }
    th {
        background-color: #f8f8f8;
    }
</style>
<h3>네이버 오픈 API를 활용한 뉴스 검색결과</h3>
<a href="/news">돌아가기</a>
<table>
    <thead>
    <tr>
        <th scope="col">제목</th>
        <th scope="col">원본 링크</th>
        <th scope="col">링크</th>
        <th scope="col">설명</th>
        <th scope="col">발행일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${newss}" var="news">
        <tr>
            <td><c:out value="${news.title}"/> </td>
            <td><c:out value="${news.originallink}"/> </td>
            <td><a href="<c:out value='${news.link}'/>" target="_blank">원문 보기</a></td>
            <td><c:out value="${news.description}"/> </td>
            <td><c:out value="${news.pubDate}"/> </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
