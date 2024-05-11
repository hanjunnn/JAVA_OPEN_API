<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Book Search</title>
	</head>
	<body>
        <style>
            table {
                border-collapse: collapse;
                border: 0;
            }
            th,
            td {
                border: 2px solid #aaa;
            }
            th {
                background-color: #f8f8f8;
            }
        </style>
		<h3>네이버 오픈 API를 활용한 도서 목록 검색결과</h3>
		<a href="/book">돌아가기</a>
		<table>
            <thead>
                <tr>
                    <th scope="col">ISBN</th>
                    <th scope="col">표지</th>
                    <th scope="col">제목</th>
                    <th scope="col">저자</th>
                    <th scope="col">출판사</th>
                    <th scope="col">출판일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${books}" var="book">
                    <tr>
                        <td><c:out value="${book.isbn}"/> </td>
                        <td> <img src="<c:url value='${book.image}'/>" width="100" hight="60"/> </td>
                        <td> <a href="<c:out value='${book.link}'/>" target="_blank"> <c:out value="${book.title}"/> </a> </td>
                        <td><c:out value="${book.author}"/> </td>
                        <td><c:out value="${book.publisher}"/> </td>
                        <td><c:out value="${book.pubdate}"/> </td>
                    </tr>
                </c:forEach>
            </tbody>
		</table>
	</body>
</html>