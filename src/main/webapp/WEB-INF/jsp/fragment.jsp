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
                <img src="${news.originallink}" alt="News Image">
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
                <button type="submit">스크랩</button>
            </form>
        </div>
    </div>
</c:forEach>

