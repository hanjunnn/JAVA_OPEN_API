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
        td {
            border-top: 1px solid #000;
            padding: 8px;
            color: black;
        }
        th {
            background-color: #f8f8f8;
        }
        h3 {
            text-align: center;
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
        a{
            color : black;
            text-decoration-line: none;
        }
    </style>
</head>
<body>
<h3>네이버 오픈 API를 활용한 뉴스 검색결과</h3>
<a href="/news">돌아가기</a>
<table>
    <tbody>
    <c:forEach items="${newss}" var="news">
        <tr>
            <td>
                <h2><a href="${news.link}" target="_blank">${news.title}</a></h2>
                <p class="description">${news.description}</p>
                <p class="pubDate">${news.pubDate}</p>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
