<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<style type="text/css">
/* 기본 스타일 */
:root {
    --primary-color: #0066c0;
    --primary-hover: #004d8c;
    --secondary-color: #6c757d;
    --border-color: #e1e1e1;
    --background-color: #f8f9fa;
    --text-color: #333;
    --shadow-sm: 0 2px 8px rgba(0,0,0,0.08);
    --shadow-md: 0 2px 10px rgba(0,0,0,0.08);
    --border-radius: 8px;
}

body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: var(--background-color);
    color: var(--text-color);
}

.container {
    max-width: 1400px;
    margin: 40px auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: var(--shadow-sm);
    position: relative;
    border-radius: 15px;
}

/* 제목 스타일 */
h2 {
    font-size: 28px;
    font-weight: 600;
    margin-bottom: 30px;
    padding-bottom: 15px;
    border-bottom: 2px solid var(--border-color);
}

/* 카테고리 폼 스타일 */
#categoryForm {
    margin-bottom: 20px;
}

.category-select {
    padding: 12px 20px;
    border: 2px solid var(--border-color);
    border-radius: var(--border-radius);
    font-size: 15px;
    background-color: white;
    cursor: pointer;
    min-width: 200px;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 15px center;
    background-size: 15px;
    padding-right: 45px;
    appearance: none;
    transition: all 0.3s ease;
}

.category-select:hover,
.category-select:focus {
    border-color: var(--primary-color);
    outline: none;
}

/* 검색 폼 스타일 */
#bookSearch {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-bottom: 20px;
    padding: 20px;
    background: #fff;
    border-radius: var(--border-radius);
    box-shadow: var(--shadow-md);
}

.search-wrapper {
    display: flex;
    flex: 1;
    gap: 10px;
    align-items: center;
    background: var(--background-color);
    padding: 5px;
    border-radius: var(--border-radius);
    border: 1px solid var(--border-color);
}

.search-wrapper select,
.search-wrapper input[type="text"] {
    padding: 10px 15px;
    border: none;
    background: transparent;
    font-size: 15px;
    outline: none;
}

.search-wrapper select {
    min-width: 120px;
    cursor: pointer;
    appearance: none;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 5px center;
    background-size: 12px;
    padding-right: 25px;
}

.search-wrapper input[type="text"] {
    flex: 1;
    min-width: 200px;
}

button[type="submit"] {
    padding: 12px 25px;
    background: var(--primary-color);
    color: white;
    border: none;
    border-radius: var(--border-radius);
    cursor: pointer;
    font-weight: 500;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 8px;
    white-space: nowrap;
}

button[type="submit"]:hover {
    background: var(--primary-hover);
    transform: translateY(-1px);
}

/* 도서 목록 스타일 */
.book-list {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 25px;
    margin-bottom: 120px;
}

.book-item {
    display: flex;
    flex-direction: column;
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow: var(--shadow-sm);
}

.book-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0,0,0,0.12);
}

.book-image {
    width: 100%;
    height: 300px;
    object-fit: cover;
    border-bottom: 1px solid var(--border-color);
}

.book-details {
    padding: 20px;
    flex-grow: 1;
}

.book-title {
    font-size: 1.1em;
    font-weight: 600;
    margin-bottom: 10px;
    line-height: 1.4;
}

.book-title a {
    text-decoration: none;
    color: #2c3e50;
    transition: color 0.2s;
}

.book-title a:hover {
    color: var(--primary-color);
}

.book-category {
    font-size: 0.85em;
    color: var(--secondary-color);
    margin-bottom: 10px;
}

.book-description {
    font-size: 0.9em;
    color: var(--secondary-color);
    margin-bottom: 15px;
    line-height: 1.5;
}

/* 버튼 스타일 */
.button-group {
    display: flex;
    gap: 10px;
    padding: 0 20px 20px;
}

.button-group button {
    flex: 1;
    padding: 10px;
    border-radius: var(--border-radius);
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
    border: none;
}

.reserve-button {
    background-color: #fff;
    color: var(--primary-color);
    border: 1px solid var(--primary-color) !important;
}

.reserve-button:hover {
    background-color: #f0f7ff;
}

.borrow-button {
    background-color: var(--primary-color);
    color: white;
}

.borrow-button:hover {
    background-color: var(--primary-hover);
}

/* 페이지네이션 스타일 */
.pagination {
    display: flex;
    justify-content: center;
    list-style-type: none;
    padding: 20px 0;
    margin-top: 30px;
    background: white;
    border-radius: var(--border-radius);
    box-shadow: var(--shadow-md);
    position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
    min-width: max-content;
}

.page-item {
    margin: 0 4px;
    display: inline-flex;
    align-items: center;
}

.page-link {
    color: var(--primary-color);
    padding: 8px 12px;
    text-decoration: none;
    border: 1px solid var(--border-color);
    border-radius: 4px;
    transition: all 0.2s;
    min-width: max-content;
}

.page-link:hover {
    background-color: var(--background-color);
    border-color: var(--primary-color);
}

.page-item.active .page-link {
    background-color: var(--primary-color);
    color: white;
    border-color: var(--primary-color);
}

.page-item.disabled .page-link {
    color: var(--secondary-color);
    pointer-events: none;
    background-color: #fff;
    border-color: var(--border-color);
}

/* 반응형 스타일 */
@media (max-width: 768px) {
    .container {
        margin: 20px;
        padding: 15px;
    }

    .search-wrapper {
        flex-direction: column;
        padding: 10px;
        width: 100%;
    }

    .search-wrapper select,
    .search-wrapper input[type="text"] {
        width: 100%;
    }

    #bookSearch {
        flex-direction: column;
        padding: 15px;
    }

    button[type="submit"] {
        width: 100%;
        justify-content: center;
    }

    .book-list {
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 15px;
    }

    .book-image {
        height: 250px;
    }

    .pagination {
        position: static;
        transform: none;
        margin: 20px 0;
        flex-wrap: wrap;
    }
}
</style>
</head>
<body>
<div class="container">
      <h2>베스트 도서 목록</h2>

    <!-- 통합 검색 폼 -->
    <form id="bookSearch" action="<%=getEnvs%>bookRaiting" method="POST">
        <div class="search-wrapper">
            <select name="category">
                <option value="전체보기">전체</option>
                <c:forEach var="category" items="${requestScope.category_List}">
                    <option value="${category}" 
                        <c:if test="${category == requestScope.selectedCategory}">selected</c:if>>
                        ${category}
                    </option>
                </c:forEach>
            </select>
            <input type="text" name="keyword" placeholder="도서명, 저자, 출판사를 검색해보세요">
        </div>
        <button type="submit">
            <i class="fas fa-search"></i>
            검색
        </button>
    </form>
    
    <!-- 독립적인 카테고리 선택 -->
    <form id="categoryForm" action="<%=getEnvs%>bookRaiting" method="POST">
        <select class="category-select" name="category" onchange="document.getElementById('categoryForm').submit()">
            <option value="전체보기">전체 카테고리</option>
            <c:forEach var="category" items="${requestScope.category_List}">
                <option value="${category}" 
                    <c:if test="${category == requestScope.selectedCategory}">selected</c:if>>
                    ${category}
                </option>
            </c:forEach>
        </select>
    </form>
      

      <div class="book-list" id="dataContainer">
         <c:forEach var="bean" items="${requestScope.datalist}">
            <div class="book-item">
               <img class="book-image" src="${bean.img}" alt="${bean.book_name}">
               <div class="book-details">
                  <div class="book-title">
                     <a href="<%=getEnvs%>bookDetail&book_idx=${bean.book_idx}">${bean.book_name}</a>
                  </div>
                  <div class="book-category">카테고리: ${bean.category}</div>
                  <div class="book-description">
                     <c:choose>
                        <c:when test="${fn:length(bean.description) > 50}">
                                    ${fn:substring(bean.description, 0, 50)}...
                                </c:when>
                        <c:otherwise>
                                    ${bean.description}
                                </c:otherwise>
                     </c:choose>
                  </div>
               </div>
               <div class="button-group">
                  <button class="reserve-button">대출 예약</button>
                  <button class="borrow-button">대출하기</button>
               </div>
            </div>
         </c:forEach>
         
         <ul class="pagination justify-content-center">
            <c:if test="${requestScope.keyword == ''}">
               <c:if test="${pagelist.beginPage > 10}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookRaiting&pageNumber=1&currCategory=${requestScope.selectedCategory}">처음</a></li>
               </c:if>
               <c:if test="${pagelist.beginPage <= 10}">
                  <li class="page-item"><span class="page-link disabled">처음</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.beginPage > 1}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookRaiting&pageNumber=${pagelist.beginPage - 1}&currCategory=${requestScope.selectedCategory}">이전</a></li>
               </c:if>
               <c:if test="${pagelist.beginPage <= 1}">
                  <li class="page-item disabled"><span class="page-link">이전</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.beginPage <= pagelist.totalPage}">
                  <c:forEach var="i" begin="${pagelist.beginPage}"
                     end="${pagelist.endPage}">
                     <li
                        class="page-item <c:if test="${i == pagelist.pageNumber}">active</c:if>"><a
                        class="page-link" href="<%=getEnvs%>bookRaiting&pageNumber=${i}&currCategory=${requestScope.selectedCategory}">${i}</a></li>
                  </c:forEach>
               </c:if>
               <c:if test="${pagelist.endPage < pagelist.totalPage}">
                  <li class="page-item"><a class="page-link"
                        href="<%=getEnvs%>bookRaiting&pageNumber=${pagelist.endPage + 1}&currCategory=${requestScope.selectedCategory}">다음</a></li>
               </c:if>
               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
                  <li class="page-item disabled"><span class="page-link">다음</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.endPage < pagelist.totalPage}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookRaiting&pageNumber=${pagelist.totalPage}&currCategory=${requestScope.selectedCategory}">맨끝</a></li>
               </c:if>
               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
                  <li class="page-item disabled"><span class="page-link">맨끝</span>
                  </li>
               </c:if>
            </c:if>
            <c:if test="${requestScope.keyword != ''}">
               <c:if test="${pagelist.beginPage > 10}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookRaiting&pageNumber=1&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">처음</a></li>
               </c:if>
               <c:if test="${pagelist.beginPage <= 10}">
                  <li class="page-item"><span class="page-link disabled">처음</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.beginPage > 1}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookRaiting&pageNumber=${pagelist.beginPage - 1}&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">이전</a></li>
               </c:if>
               <c:if test="${pagelist.beginPage <= 1}">
                  <li class="page-item disabled"><span class="page-link">이전</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.beginPage <= pagelist.totalPage}">
                  <c:forEach var="i" begin="${pagelist.beginPage}"
                     end="${pagelist.endPage}">
                     <li
                        class="page-item <c:if test="${i == pagelist.pageNumber}">active</c:if>"><a
                        class="page-link" href="<%=getEnvs%>bookRaiting&pageNumber=${i}&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">${i}</a></li>
                  </c:forEach>
               </c:if>
               <c:if test="${pagelist.endPage < pagelist.totalPage}">
                  <li class="page-item"><a class="page-link"
                        href="<%=getEnvs%>bookRaiting&pageNumber=${pagelist.endPage + 1}&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">다음</a></li>
               </c:if>
               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
                  <li class="page-item disabled"><span class="page-link">다음</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.endPage < pagelist.totalPage}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookRaiting&pageNumber=${pagelist.totalPage}&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">맨끝</a></li>
               </c:if>
               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
                  <li class="page-item disabled"><span class="page-link">맨끝</span> 
                  </li>
               </c:if>
            </c:if>
         </ul>         
      </div>
   </div>
</body>
</html> 
