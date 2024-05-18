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
    <div id="newsResults">
        <jsp:include page="fragment.jsp" />
    </div>
    </tbody>
</table>

<!-- 더보기 버튼 -->
<button id="loadMoreButton">더보기</button>

<script>
    var currentPage = 1;
    var keyword = '<%= request.getParameter("keyword") %>';

    document.getElementById('loadMoreButton').addEventListener('click', function () {
        currentPage++;
        loadMoreNews(currentPage);
    });

    function loadMoreNews(page) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/newssearch?keyword=' + encodeURIComponent(keyword) + '&page=' + page, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                var newsResultsContainer = document.getElementById('newsResults');
                var parser = new DOMParser();
                var doc = parser.parseFromString(xhr.responseText, 'text/html');
                var newItems = doc.querySelectorAll('.news-item');
                newItems.forEach(function (item) {
                    newsResultsContainer.appendChild(item);
                });
            }
        };
        xhr.send();
    }
</script>

</body>
</html>

