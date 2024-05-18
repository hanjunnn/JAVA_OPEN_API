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

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination button {
            margin: 0 5px;
            padding: 10px 20px;
            border: 1px solid #2e9afe;
            border-radius: 5px;
            background-color: white;
            color: #2e9afe;
            cursor: pointer;
        }
        .pagination button.active {
            background-color: #2e9afe;
            color: white;
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
    <hr>
    </tbody>
</table>
<div id="pagination" class="pagination"></div>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>
    const numOfContent = 1000;
    const maxContent = 10;
    const maxButton = 10;
    const maxPage = Math.ceil(numOfContent / maxContent);
    let page = 1;

    const buttons = document.getElementById('pagination');

    const makeButton = (id) => {
        const button = document.createElement("button");
        button.classList.add("button");
        button.dataset.num = id;
        button.innerText = id;
        button.addEventListener("click", (e) => {
            Array.prototype.forEach.call(buttons.children, (button) => {
                if (button.dataset.num) button.classList.remove("active");
            });
            e.target.classList.add("active");
            loadPage(parseInt(e.target.dataset.num));
        });
        return button;
    };

    const renderButton = (page) => {
        // 버튼 리스트 초기화
        while (buttons.hasChildNodes()) {
            buttons.removeChild(buttons.lastChild);
        }
        // 화면에 최대 5개의 페이지 버튼 생성
        for (let id = page; id < page + maxButton && id <= maxPage; id++) {
            buttons.appendChild(makeButton(id));
        }
        // 첫 버튼 활성화(class="active")
        if (buttons.children[0]) {
            buttons.children[0].classList.add("active");
        }

        buttons.prepend(prev);
        buttons.append(next);

        // 이전, 다음 페이지 버튼이 필요한지 체크
        if (page - maxButton < 1) buttons.removeChild(prev);
        if (page + maxButton > maxPage) buttons.removeChild(next);
    };

    const goPrevPage = () => {
        page -= maxButton;
        render(page);
    };

    const goNextPage = () => {
        page += maxButton;
        render(page);
    };

    const prev = document.createElement("button");
    prev.classList.add("button", "prev");
    prev.innerHTML = '<ion-icon name="chevron-back-outline"></ion-icon>';
    prev.addEventListener("click", goPrevPage);

    const next = document.createElement("button");
    next.classList.add("button", "next");
    next.innerHTML = '<ion-icon name="chevron-forward-outline"></ion-icon>';
    next.addEventListener("click", goNextPage);

    var keyword = '<%= request.getParameter("keyword") %>';

    function loadPage(page) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/newssearch?keyword=' + encodeURIComponent(keyword) + '&page=' + page, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                var newsResultsContainer = document.getElementById('newsResults');
                renderContent(xhr.responseText, newsResultsContainer);

                // 페이지 버튼 활성화 상태 업데이트
                var activeButton = document.querySelector(`.button[data-num="${page}"]`);
                if (activeButton) {
                    activeButton.classList.add('active');
                }
            }
        };
        xhr.send();
    }

    function renderContent(content, container) {
        container.innerHTML = ''; // 기존 내용을 지웁니다.
        var parser = new DOMParser();
        var doc = parser.parseFromString(content, 'text/html');
        var newItems = doc.querySelectorAll('.news-item');
        newItems.forEach(function (item) {
            container.appendChild(item);
            window.scrollTo(0, 0);
        });
    }

    const render = (page) => {
        loadPage(page);
        renderButton(page);
    };

    render(page);
</script>

</body>
</html>

