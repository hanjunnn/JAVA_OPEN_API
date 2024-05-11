<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<title>News Search</title>
	<style>
		body {
			text-align: center;
		}

		div {
			margin-top: 30px;
			font-weight: bold;
			font-size: 150px;
			color: #2E9AFE;
		}

		input[name='keyword'] {
			vertical-align: middle; /* 세로 가운데 정렬을 위해 추가 */
			margin-top: 100px;
			border-radius: 20px;
			padding: 5px;
			width: 500px; /* 검색창의 너비를 2배로 키웁니다 */
			height: 30px;
			border: 1px solid #ccc;
		}

		input[type='submit'] {
			vertical-align: middle; /* 세로 가운데 정렬을 위해 추가 */
			margin-top: 100px;
			border-radius: 20px;
			width: 60px;
			height: 40px;
			background-color: #2E9AFE;
			color: white;
			border: none;
			cursor: pointer;
		}

		table {
			margin: auto;
		}
	</style>
</head>
<body>
<div>News Search & Scrap</div>
<table>
	<form action="/newssearch">
		<input name='keyword' type='text' required/>
		<input type="submit" value="search">
	</form>
</table>
</body>
</html>
