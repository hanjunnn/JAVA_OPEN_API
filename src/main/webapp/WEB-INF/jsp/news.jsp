<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
			cursor: pointer;
			margin-left: auto; /* 돋보기 아이콘을 오른쪽으로 이동 */
			margin-right: 10px; /* 오른쪽 여백 추가 */
		}

		.search-btn:hover {
			background-color: #2E9AFE;
			color: white;
		}

		.search-container {
			display: flex;
			align-items: center;
			justify-content: space-between; /* 아이콘과 텍스트를 컨테이너의 양 끝에 배치 */
			width: 100%; /* 컨테이너를 화면 전체 너비로 확장 */
			max-width: 600px; /* 최대 너비를 설정하여 컨테이너가 너무 커지지 않도록 제한 */
			margin: 0 auto; /* 가운데 정렬 */
		}

		.scrap-list-btn {
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
			cursor: pointer;
			margin-right: auto; /* 스크랩 버튼을 왼쪽으로 이동 */
			margin-left: 10px; /* 왼쪽 여백 추가 */
		}

		.scrap-list-btn:hover {
			background-color: #2E9AFE;
			color: white;
		}

	</style>
	<script src="https://kit.fontawesome.com/60c313e98e.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="title">Scrap It.</div>
<form class="search-box" action="/newssearch" method="get">
	<div class="search-container"> <!-- 검색 텍스트와 아이콘을 감싸는 div 요소 -->
		<input class="search-txt" name="keyword" type="text" required /> <!-- 검색 텍스트 -->
		<button class="scrap-list-btn" onclick="location.href='/scraplist'" type="submit" value="scrap1">
			<i class="fa-solid fa-inbox"></i>
		</button>
		<button class="search-btn" type="submit" value="search"> <!-- 돋보기 아이콘 -->
			<i class="fa-solid fa-magnifying-glass"></i>
		</button>
	</div>
</form>

</body>
</html>
