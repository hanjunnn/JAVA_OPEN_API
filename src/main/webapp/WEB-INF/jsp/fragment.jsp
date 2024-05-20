<%--
  Created by IntelliJ IDEA.
  User: tprl0
  Date: 2024-05-18
  Time: 오전 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:forEach var="news" items="${newss}">
    <div class="news-item">
        <hr>
        <div class="image-container">
            <c:if test="${not empty news.originallink}">
                <img src="${news.originallink}" alt="News Image" onerror="this.style.display='none';">
            </c:if>
        </div>
        <div class="news-details">
            <h2><a href="${news.link}" target="_blank">${news.title}</a>
                <c:choose>
                    <c:when test="${fn:contains(links, news.link)}">
                        <a class="scrap-button active" onclick="scrapNews(event, `${news.title}`, `${news.description}`, `${news.pubDate}`, `${news.link}`, `${news.originallink}`)">
                            <ion-icon name="star"></ion-icon>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a class="scrap-button" onclick="scrapNews(event, `${news.title}`, `${news.description}`, `${news.pubDate}`, `${news.link}`, `${news.originallink}`)">
                            <ion-icon name="star-outline"></ion-icon>
                        </a>
                    </c:otherwise>
                </c:choose>
            </h2>
            <p class="description">${news.description}</p>
            <p class="pubDate">${news.pubDate}</p>
        </div>
    </div>
</c:forEach>


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    function scrapNews(event, title, description, pubDate, link, originallink) {
        event.preventDefault(); // 기본 이벤트 동작 방지
        var scrapButton = event.currentTarget;
        var ionIcon = scrapButton.querySelector('ion-icon');
        if (ionIcon) {
            ionIcon.setAttribute('name', 'star');
            scrapButton.classList.add('active');
        }

        // AJAX 요청 생성
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/scrap');
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // 폼 데이터로 전송하기 위해 Content-Type 설정

        // 폼 데이터 생성
        var formData = 'title=' + encodeURIComponent(title) +
            '&description=' + encodeURIComponent(description) +
            '&pubDate=' + encodeURIComponent(pubDate) +
            '&originallink=' + encodeURIComponent(originallink) +
            '&link=' + encodeURIComponent(link);
        // AJAX 요청 전송
        xhr.send(formData);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // 성공적으로 처리된 경우
                    Swal.fire({
                        icon: 'success',
                        title: '뉴스가 스크랩되었습니다!',
                        showConfirmButton: false,
                        timer: 1500
                    });
                } else if (xhr.status === 409) {
                    // 중복된 기사인 경우
                    Swal.fire({
                        icon: 'warning',
                        title: '이미 스크랩된 기사입니다.',
                        showConfirmButton: false,
                        timer: 1500
                    });
                } else {
                    // 오류가 발생한 경우
                    Swal.fire({
                        icon: 'error',
                        title: '스크랩에 실패했습니다.',
                        text: '다시 시도해주세요.',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: '확인'
                    });
                }
            }
        };
    }
</script>