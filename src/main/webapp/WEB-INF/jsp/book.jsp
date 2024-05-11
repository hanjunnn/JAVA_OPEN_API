<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Book Search</title>
	</head>
	<body>
		<style>
			input {
				margin: 2px;
			}
		</style>
		<h3>네이버 오픈 API를 활용한 도서 목록 검색 하기 </h3>
		<table>
        	<form action="/booksearch">
  				도서명  : <input name='keyword' type='text' required/>
  				<input type="submit" value="검색하기">
			</form>
		</table>
		
	</body>
</html>