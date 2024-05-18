<%--
  Created by IntelliJ IDEA.
  User: tprl0
  Date: 2024-05-18
  Time: 오전 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:forEach var="news" items="${newss}">
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
            <form action="/scrap" method="post">
                <input type="hidden" name="title" value="${news.title}">
                <input type="hidden" name="description" value="${news.description}">
                <input type="hidden" name="pubDate" value="${news.pubDate}">
                <input type="hidden" name="link" value="${news.link}">
                <a href="#" class="scrap-button" onclick="scrapNews(event, '${news.title}', '${news.description}', '${news.pubDate}', '${news.link}')">
                    <ion-icon name="star-outline"></ion-icon>
                </a>
            </form>
        </div>
    </div>
</c:forEach>

<script>
    function scrapNews(event, title, description, pubDate, link) {
        event.preventDefault(); // 기본 이벤트 동작 방지

        // AJAX 요청 생성
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/scrap');
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // 폼 데이터로 전송하기 위해 Content-Type 설정

        // 폼 데이터 생성
        var formData = 'title=' + encodeURIComponent(title) +
            '&description=' + encodeURIComponent(description) +
            '&pubDate=' + encodeURIComponent(pubDate) +
            '&link=' + encodeURIComponent(link);

        // AJAX 요청 전송
        xhr.send(formData);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // 성공적으로 처리된 경우
                    alert("뉴스가 스크랩되었습니다!");
                    // 성공 메시지를 출력한 후 페이지를 새로 고침하거나 다른 작업을 수행할 수 있습니다.
                } else if (xhr.status === 409) {
                    // 중복된 기사인 경우
                    alert("이미 스크랩된 기사입니다.");
                } else {
                    // 오류가 발생한 경우
                    alert("스크랩에 실패했습니다. 다시 시도해주세요.");
                    // 오류 메시지를 출력한 후 사용자에게 다른 작업을 제안할 수 있습니다.
                }
            }
        };
    }
</script>