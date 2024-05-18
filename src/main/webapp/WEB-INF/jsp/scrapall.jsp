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
        .image-container {
            float: left;
            margin-right: 20px; /* 이미지와 정보 사이 여백 조절 */
        }

        .image-container img {
            width: 200px; /* 이미지의 너비 조절 */
            height: auto; /* 비율에 맞게 높이 자동 조절 */
        }

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
            font-family: 'Gowun Dodum', sans-serif; /* Applying 'Gowun Dodum' font family to the body */
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
            color: black;
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
        .news-details {
            overflow: hidden; /* 이미지 옆에 나오는 텍스트들이 영역을 벗어나지 않도록 설정 */
        }

        .news-details h2 {
            margin-top: 0; /* 제목의 위쪽 여백 제거 */
        }

        .news-details p {
            margin: 0; /* 문단의 위아래 여백 제거 */
        }

        .news-details form {
            margin-top: 10px; /* 스크랩 버튼과의 여백 설정 */
        }

        .news-item {
            clear: both; /* 각 뉴스 아이템마다 clear를 설정하여 이미지와 정보가 겹치지 않도록 함 */
        }

        hr {
            border: 1px solid #2e9afe;
        }
        hr {
            border:1px solid #2e9afe;
        }

        body {
            font-family: 'Gowun Dodum', sans-serif; /* Applying 'Gowun Dodum' font family to the body */
        }
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

<br><br>

<table>
    <tbody>
    <c:forEach items="${newsList}" var="news">
    <div class="news-item">
        <hr>
        <div class="image-container">
            <c:if test="${not empty news.originallink}">
                <img src="${news.originallink}" alt="News Image" onerror="this.style.display='none';">
            </c:if>
        </div>
        <div class="news-details">
            <h2><a href="${news.link}" target="_blank">${news.title}</a></h2>
            <p class="description">${news.description}</p>
            <p class="pubDate">${news.pubDate}</p>
            <p class="link">
                <button class="delete-button" onclick="location.href='/delete/${news.id}'">삭제</button>
            </p>
        </div>
    </div>
    </c:forEach>
    </tbody>
</table><hr>
</body>
</html>
