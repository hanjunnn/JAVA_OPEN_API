<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>News Search</title>
	<style>
		body {

			text-align: center;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			height: 100vh;
			margin: 0;
			background-color: white;
		}

		div.title {
			font-family: 'Gowun Dodum';
			margin-bottom: 40px;
			font-weight: bold;
			font-size: 100px;
			color: #2E9AFE;
		}

		.search-box {
			display: flex;
			align-items: center;
			background: white;
			border-radius: 40px;
			padding: 10px;
			border: 1px solid #2E9AFE;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		}

		.search-txt {
			border: none;
			background: none;
			color: #797979;
			font-size: 25px;
			line-height: 30px;
			width: 600px;
			padding: 5px;
			border-radius: 20px;
			outline: none;
		}

		.search-btn {
			color: #2E9AFE;
			width: 40px;
			height: 40px;
			border-radius: 50%;
			background: white;
			border: none;
			font-size: 16px;
			display: flex;
			justify-content: center;
			align-items: center;
			margin-left: 10px;
			cursor: pointer;
		}

		.search-btn:hover {
			background-color: #2E9AFE;
			color: white;
		}
	</style>
	<script src="https://kit.fontawesome.com/60c313e98e.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="title">Scrap It.</div>
<form class="search-box" action="/newssearch" method="get">
	<input class="search-txt" name="keyword" type="text" required />
	<button class="search-btn" type="submit" value="search">
		<i class="fa-solid fa-magnifying-glass"></i>
	</button>
</form>
</body>
</html>
