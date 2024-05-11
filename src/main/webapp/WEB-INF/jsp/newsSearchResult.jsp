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
<h3>네이버 오픈 API를 활용한 뉴스 검색결과</h3>
<a href="/news">돌아가기</a>
<table>
    <tbody>
    <c:forEach items="${newss}" var="news">
        <tr>
            <td>
                <h2>${news.title}</h2>
                <p class="description">${news.description}</p>
                <p class="pubDate">${news.pubDate}</p>
                <p class="link"><a href="${news.link}" target="_blank">원문 보기</a></p>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
