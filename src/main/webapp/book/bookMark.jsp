<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북마크</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<style type="text/css">
:root {
    --primary-color: #03c75a;
    --primary-hover: #02b351;
    --background-color: #f5f6f7;
    --text-primary: #333;
    --text-secondary: #666;
    --border-color: #e5e5e5;
    --card-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

body {
    background-color: var(--background-color);
    color: var(--text-primary);
    font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
    margin: 0;
    line-height: 1.6;
}

.container {
    max-width: 1000px;
    margin: 2rem auto;
    padding: 2rem;
}

.card {
    background: white;
    border-radius: 12px;
    box-shadow: var(--card-shadow);
    padding: 2rem;
}

.header {
    margin-bottom: 2rem;
}

.header h2 {
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--text-primary);
    margin: 0 0 0.5rem 0;
}

.header p {
    color: var(--text-secondary);
    margin: 0;
}

.book-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
}

.book-table th {
    text-align: left;
    padding: 1rem;
    border-bottom: 1px solid var(--border-color);
    color: var(--text-secondary);
    font-weight: 500;
    font-size: 0.875rem;
}

.book-table td {
    padding: 1rem;
    border-bottom: 1px solid var(--border-color);
    vertical-align: middle;
}

.book-table tr:hover {
    background-color: #f8f9fa;
}

.book-image {
    width: 60px;
    height: 85px;
    border-radius: 4px;
    object-fit: cover;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.book-title {
    font-weight: 500;
    color: var(--text-primary);
}

.book-author {
    color: var(--text-secondary);
    font-size: 0.875rem;
}

.borrow-button {
    background-color: var(--primary-color);
    color: white;
    border: none;
    padding: 0.5rem 1rem;
    border-radius: 6px;
    cursor: pointer;
    font-size: 0.875rem;
    transition: all 0.2s;
}

.borrow-button:hover {
    background-color: var(--primary-hover);
}

.date {
    color: var(--text-secondary);
    font-size: 0.875rem;
}

@media (max-width: 768px) {
    .container {
        padding: 1rem;
        margin: 1rem;
    }
    
    .card {
        padding: 1rem;
    }
    
    .book-table {
        display: block;
        overflow-x: auto;
        white-space: nowrap;
    }
    
    .header h2 {
        font-size: 1.25rem;
    }
}

.empty-message {
    text-align: center;
    padding: 3rem 0;
    color: var(--text-secondary);
}

.book-info {
    display: flex;
    flex-direction: column;
    gap: 0.25rem;
}

</style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="header">
                <h2>${sessionScope.loginfo.memname}님의 북마크</h2>
                <p>${sessionScope.loginfo.memname}님이 담으신 책들입니다.</p>
            </div>
            
            <c:choose>
                <c:when test="${empty requestScope.datalist}">
                    <div class="empty-message">
                        <p>아직 북마크한 책이 없습니다.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="book-table">
                        <thead>
                            <tr>
                                <th style="width: 80px">표지</th>
                                <th>책 정보</th>
                                <th>출판일</th>
                                <th>북마크 날짜</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="bean" items="${requestScope.datalist}">
                                <tr>
                                    <td>
                                        <img class="book-image" src="${bean.img}" 
                                             alt="${bean.book_name}">
                                    </td>
                                    <td>
                                        <div class="book-info">
                                            <div class="book-title">${bean.book_name}</div>
                                            <div class="book-author">${bean.person_name}</div>
                                        </div>
                                    </td>
                                    <td class="date">${bean.date}</td>
                                    <td class="date">${bean.regdate}</td>
                                    <td>
                                        <button type="button" class="borrow-button btn-out" 
                                                value="${bean.book_idx}">대출하기</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const buttons = document.querySelectorAll('.btn-out');
            buttons.forEach(button => {
                button.addEventListener('click', function() {
                    const bookOutIdx = this.value;
                    
                    fetch('<%=getEnvs%>bookOut', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({bookId: bookOutIdx})
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json();
                    })
                    .then(data => {
                        switch(data) {
                            case "대여중":
                                alert('이미 같은 책을 대여중입니다.');
                                break;
                            case "완료":
                                alert('해당 책이 대출되었습니다.');
                                window.location.reload();
                                break;
                            case "오류":
                                alert('책을 대출할 수 없습니다.');
                                break;
                            case "가능":
                                alert('북마크에 추가되었습니다.');
                                break;
                            case "초과":
                                alert('더 이상 책을 대출할 수 없습니다.');
                                break;
                        }
                    })
                    .catch(error => {
                        console.error('오류가 발생했습니다:', error);
                    });
                });
            });
        });
    </script>
</body>
</html>