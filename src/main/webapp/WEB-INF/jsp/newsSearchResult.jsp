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
            border-top: 2px solid #2e9afe;
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
        a {
            color: darkblue;
            text-decoration-line: none;
        }
        .button-container {
            display: flex;
            justify-content: space-between; /* 버튼을 오른쪽으로 정렬 */
            margin-bottom: 10px; /* 버튼과 테이블 사이의 간격 조정 */
        }
        .scrap {
            margin-left: auto; /* 스크랩 버튼을 오른쪽 끝으로 이동 */
        }
        .before {
            font-size: 18px;
            margin-top: 5%;
            border-radius: 10px;
            border: 3px solid #2e9afe;
            color: #6e6e6e;
            width: 150px;
            height: 50px;
            background-color: white;
        }
        .scrap {
            font-size: 16px;
            margin-top: 5%;
            border-radius: 10px;
            border: 3px solid #2e9afe;
            color: #6e6e6e;
            width: 150px;
            height: 50px;
            background-color: white;
        }
        .head {
            text-shadow: black;
            font-weight: bold;
            margin-top: 5%;
            text-align: center;
            font-size: 70px;
            color: #2e9afe;
        }
    </style>
</head>

<body>
<div class = "head">Search Results</div>
<div class="button-container">
    <button type="button" onclick="location.href='/news'" class="before"><<< Prev</button>
    <button type="button" onclick="location.href='/scraplist'"class="scrap">View Scraps</button>
</div>
<br><br>


<table>
    <tbody>
    <c:forEach items="${newss}" var="news">
        <tr>
            <td>
                <h2><a href="${news.link}" target="_blank">${news.title}</a></h2>
                <c:if test="${not empty news.originallink}">
                    <img src="${news.originallink}" width="50" height="50">
                </c:if>
                <p class="description">${news.description}</p>
                <p class="pubDate">${news.pubDate}</p>
                <form action="/scrap" method="post">
                    <input type="hidden" name="title" value="${news.title}">
                    <input type="hidden" name="description" value="${news.description}">
                    <input type="hidden" name="pubDate" value="${news.pubDate}">
                    <input type="hidden" name="link" value="${news.link}">
                    <button type="submit">스크랩</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
