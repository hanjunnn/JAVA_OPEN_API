<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>News Search</title>
    <style>
        .button-container {
            display: flex;
            justify-content: space-between; /* 버튼을 오른쪽으로 정렬 */
            margin-bottom: 10px; /* 버튼과 테이블 사이의 간격 조정 */
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        tbody{
            font-family: 'Gowun Dodum', sans-serif; /* Applying 'Gowun Dodum' font family to the body */
        }
        th,
        td {
            border-top: 3px solid #2e9afe;
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
        h3{
            text-shadow: black;
            font-weight: bold;
            margin-top: 5%;
            text-align: center;
            font-size: 60px;
            color: #2e9afe;
        }
        .button-style {
            font-family: 'Gowun Dodum', sans-serif; /* Applying 'Gowun Dodum' font family to the body */
            font-weight: bold;
            font-size: 18px;
            margin-top: 3%;
            border-radius: 10px;
            border: 3px solid #2e9afe;
            color: #2e9afe;
            width: 150px;
            height: 50px;
            background-color: white;
         }

        .button-style:hover {
            background-color: #2e9afe;
            color: white;
        }
        a {
            text-decoration: none;
        }
        hr {
            border:1px solid #2e9afe;
        }
             /* 삭제 버튼 스타일 */
         .delete-button {
             font-family: 'Gowun Dodum', sans-serif;
             font-weight: bold;
             font-size: 16px;
             padding: 6px 12px;
             border: none;
             color: red;
             background-color: white;
             border-radius: 10px;
             cursor: pointer;
             text-decoration: none; /* 링크 텍스트의 밑줄 제거 */
         }

        /* 삭제 버튼 호버 효과 */
        .delete-button:hover {
            background-color: red;
            color: white;
        }
    </style>

</head>
<body>
<h3>스크랩한 기사</h3>
<div class="button-container">
    <c:if test="${not empty sessionScope.keyword}">
        <button class="button-style" onclick="location.href='/newssearch?keyword=${sessionScope.keyword}'">돌아가기</button>
    </c:if>
    <c:if test="${empty sessionScope.keyword}">
        <a href="/news">돌아가기</a>이재명 "검찰이 문서 짜깁기"…檢 "李, 법정 밖서 허위 주장"
    </c:if>
    <button class="button-style" onclick="location.href='/news'">검색하기</button>
</div>

<br><br><br>

<table>
    <tbody>
    <c:forEach items="${newsList}" var="news">
        <tr>
            <td>
                <h2><a href="${news.link}" target="_blank">${news.title}</a></h2>
                <p class="description">${news.description}</p>
                <p class="pubDate">${news.pubDate}</p>
                <p class="link">
                    <button class="delete-button" onclick="location.href='/delete/${news.id}'">삭제</button>
                </p>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table><hr>
</body>
</html>
