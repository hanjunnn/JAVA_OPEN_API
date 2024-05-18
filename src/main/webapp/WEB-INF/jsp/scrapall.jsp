<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>News Search</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th,
        td {
            border: 2px solid #aaa;
            padding: 8px;
        }
        th {
            background-color: #f8f8f8;
        }
        h2 {
            margin: 0;
        }
        .description {
            font-size: 16px;
            line-height: 1.6;
        }
        .pubDate {
            font-size: 14px;
        }
        .link {
            font-size: 14px;
        }
    </style>
</head>
<body>
<h3>스크랩한 기사</h3>
<c:if test="${not empty sessionScope.keyword}">
    <a href="/newssearch?keyword=${sessionScope.keyword}">돌아가기</a>
</c:if>
<c:if test="${empty sessionScope.keyword}">
    <a href="/news">돌아가기</a>
</c:if>
<table>
    <tbody>
    <c:forEach items="${newsList}" var="news">
        <tr>
            <td>
                <h2>${news.title}</h2>
                <p class="description">${news.description}</p>
                <p class="pubDate">${news.pubDate}</p>
                <p class="link"><a href="${news.link}" target="_blank">원문 보기</a></p>
                <a href="/delete/${news.id}">삭제</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
