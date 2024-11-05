<%@page import="com.team3.model.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ page isErrorPage="false" %>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
    margin: 0 auto;
    padding: 2rem 1rem;
}

.profile-header {
    background-color: white;
    padding: 2rem;
    border-radius: 12px;
    box-shadow: var(--card-shadow);
    margin-bottom: 1.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.profile-info h2 {
    font-size: 1.5rem;
    margin: 0;
    color: var(--text-primary);
}

.profile-info p {
    color: var(--text-secondary);
    margin: 0.5rem 0 0 0;
}

.card {
    background: white;
    border-radius: 12px;
    box-shadow: var(--card-shadow);
    margin-bottom: 1.5rem;
    padding: 1.5rem;
}

.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 1rem;
    border-bottom: 1px solid var(--border-color);
    margin-bottom: 1rem;
}

.card-header h3 {
    font-size: 1.25rem;
    margin: 0;
    color: var(--text-primary);
}

.update-button {
    background-color: white;
    color: var(--primary-color);
    border: 1px solid var(--primary-color);
    padding: 0.5rem 1rem;
    border-radius: 6px;
    cursor: pointer;
    font-size: 0.875rem;
    transition: all 0.2s;
}

.update-button:hover {
    background-color: var(--primary-color);
    color: white;
}

.info-table {
    width: 100%;
    border-collapse: collapse;
}

.info-table tr {
    border-bottom: 1px solid var(--border-color);
}

.info-table tr:last-child {
    border-bottom: none;
}

.info-table th {
    width: 150px;
    text-align: left;
    padding: 1rem;
    color: var(--text-secondary);
    font-weight: 500;
    background: none;
}

.info-table td {
    padding: 1rem;
    color: var(--text-primary);
}

.book-table {
    width: 100%;
    border-collapse: collapse;
}

.book-table th {
    text-align: left;
    padding: 1rem;
    border-bottom: 1px solid var(--border-color);
    color: var(--text-secondary);
    font-weight: 500;
    background: none;
}

.book-table td {
    padding: 1rem;
    border-bottom: 1px solid var(--border-color);
    vertical-align: middle;
}

.book-table tr:hover {
    background-color: #f8f9fa;
}

.bookimg {
    width: 45px;
    height: 45px;
    border-radius: 4px;
    object-fit: cover;
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

.overdue {
    background-color: #fff5f5;
}

.overdue td {
    color: #e03131;
}

@media (max-width: 768px) {
    .container {
        padding: 1rem;
    }
    
    .profile-header {
        flex-direction: column;
        text-align: center;
        gap: 1rem;
    }
    
    .info-table th {
        width: 100px;
    }
    
    .book-table {
        display: block;
        overflow-x: auto;
        white-space: nowrap;
    }
    
    .card {
        padding: 1rem;
    }
}
</style>
</head>
<body>
    <div class="container">
        <div class="profile-header">
            <div class="profile-info">
                <h2>${sessionScope.loginfo.memname}님</h2>
                <p>${sessionScope.loginfo.memid}</p>
            </div>
            <a href="<%=getEnvs%>memUpdate">
                <button class="update-button">회원정보 수정</button>
            </a>
        </div>

        <div class="card">
            <div class="card-header">
                <h3>회원 정보</h3>
            </div>
            <table class="info-table">
                <tbody>
                    <tr>
                        <th>이름</th>
                        <td>${mbean.memname}</td>
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td>${mbean.memid}</td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td>${mbean.gender}</td>
                    </tr>                    
                    <tr>
                        <th>생일</th>
                        <td>${mbean.birth}</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>${mbean.mobile}</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${mbean.email}</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>${mbean.addr01}</td>
                    </tr>
                    <tr>
                        <th>상세 주소</th>
                        <td>${mbean.addr02}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="card">
            <div class="card-header">
                <h3>대출 현황</h3>
            </div>
            <table class="book-table">
                <thead>
                    <tr>
                        <th></th>
                        <th>책 이름</th>
                        <th>장르</th>
                        <th>작가</th>
                        <th>출판사</th>
                        <th>출판일</th>
                        <th>대출자</th>
                        <th>대출일</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="bean" items="${requestScope.datalist}">
                        <tr>
                            <td><img class="bookimg" src="${bean.img}" alt="${bean.book_name}"></td>
                            <td>${bean.book_name}</td>
                            <td>${bean.category}</td>
                            <td>${bean.person_name}</td>
                            <td>${bean.publisher}</td>
                            <td>${bean.date}</td>
                            <td>${bean.memname}</td>
                            <td>${bean.regdate}</td>
                            <td><button type="button" class="borrow-button" value="${bean.book_idx}" onclick="showConfirm(this.value)">반납하기</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <c:if test="${not empty limitdate}">
            <div class="card">
                <div class="card-header">
                    <h3>연체 현황</h3>
                </div>
                <table class="book-table">
                    <thead>
                        <tr>
                            <th></th>
                            <th>책 이름</th>
                            <th>장르</th>
                            <th>작가</th>
                            <th>출판사</th>
                            <th>출판일</th>
                            <th>대출자</th>
                            <th>대출일</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="bean" items="${requestScope.limitdate}">
                            <tr class="overdue">
                                <td><img class="bookimg" src="${bean.img}" alt="${bean.book_name}"></td>
                                <td>${bean.book_name}</td>
                                <td>${bean.category}</td>
                                <td>${bean.person_name}</td>
                                <td>${bean.publisher}</td>
                                <td>${bean.date}</td>
                                <td>${bean.memname}</td>
                                <td>${bean.regdate}</td>
                                <td><button type="button" class="borrow-button" value="${bean.book_idx}" onclick="showConfirm(this.value)">반납하기</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </div>

    <script>
        function showConfirm(bookidx) {
            const result = confirm("반납을 진행 하시겠습니까?");
            if(result) {
                fetch('<%=getEnvs%>memMyPage', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({bookId: bookidx})
                })
                .then(response => {
                    if(!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    if(data === "완료") {
                        alert('반납이 완료 되었습니다.');
                        window.location.reload();
                    } else if(data === "실패") {
                        alert('반납이 실패하였습니다.');
                        window.location.reload();
                    }
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
            }
        }
    </script>
</body>
</html>