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
body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f8f9fa;
    color: #333;
}

.container {
    max-width: 1400px;
    margin: 40px auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
    position: relative;
    border-radius: 15px;
<<<<<<< HEAD
}

#categoryForm {
    margin-bottom: 20px;
}

#categoryForm .category-select {
    padding: 12px 20px;
    border: 2px solid #e1e1e1;
    border-radius: 8px;
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
    -webkit-appearance: none;
    transition: all 0.3s ease;
}

#categoryForm .category-select:hover {
    border-color: #0066c0;
}

/* 검색 폼 스타일 */
#bookSearch {
    display: flex;
    align-items: stretch;
    gap: 15px;
    margin-bottom: 20px;
    padding: 20px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
}

.search-wrapper {
    display: flex;
    flex: 1;
    gap: 10px;
    align-items: center;
    background: #f8f9fa;
    padding: 5px;
    border-radius: 8px;
    border: 1px solid #e1e1e1;
}

.search-wrapper select {
    padding: 10px 15px;
    border: none;
    background-color: transparent;
    font-size: 15px;
    cursor: pointer;
    min-width: 120px;
    color: #495057;
    outline: none;
    appearance: none;
    -webkit-appearance: none;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 5px center;
    background-size: 12px;
    padding-right: 25px;
}

.search-wrapper input[type="text"] {
    flex: 1;
    padding: 10px 15px;
    border: none;
    background: transparent;
    font-size: 15px;
    outline: none;
    min-width: 200px;
}

button[type="submit"] {
    padding: 12px 25px;
    background: #0066c0;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 500;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 8px;
    white-space: nowrap;
}

button[type="submit"]:hover {
    background: #004d8c;
    transform: translateY(-1px);
}

@media (max-width: 768px) {
    .search-wrapper {
        flex-direction: column;
        padding: 10px;
    }

    .search-wrapper select,
    .search-wrapper input[type="text"] {
        width: 100%;
    }

    #bookSearch {
        flex-direction: column;
    }

    button[type="submit"] {
        width: 100%;
        justify-content: center;
    }
=======
>>>>>>> branch 'master' of https://github.com/so040602/team3Project.git
}

h2 {
    color: #333;
    font-size: 28px;
    font-weight: 600;
    margin-bottom: 30px;
    padding-bottom: 15px;
    border-bottom: 2px solid #e1e1e1;
}

/* 카테고리 폼 스타일 */
#categoryForm {
    margin-bottom: 20px;
}

.category-select {
    padding: 12px 20px;
    border: 2px solid #e1e1e1;
    border-radius: 8px;
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
    -webkit-appearance: none;
    transition: all 0.3s ease;
}

.category-select:hover {
    border-color: #0066c0;
}

/* 검색 폼 스타일 */
#bookSearch {
    display: flex;
    align-items: stretch;
    gap: 15px;
    margin-bottom: 20px;
    padding: 20px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
}

.search-wrapper {
    display: flex;
    flex: 1;
    gap: 10px;
    align-items: center;
    background: #f8f9fa;
    padding: 5px;
    border-radius: 8px;
    border: 1px solid #e1e1e1;
}

.search-wrapper select {
    padding: 10px 15px;
    border: none;
    background-color: transparent;
    font-size: 15px;
    cursor: pointer;
    min-width: 120px;
    color: #495057;
    outline: none;
    appearance: none;
    -webkit-appearance: none;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 5px center;
    background-size: 12px;
    padding-right: 25px;
}

.search-wrapper input[type="text"] {
    flex: 1;
    padding: 10px 15px;
    border: none;
    background: transparent;
    font-size: 15px;
    outline: none;
    min-width: 200px;
}

button[type="submit"] {
    padding: 12px 25px;
    background: #0066c0;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 500;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 8px;
    white-space: nowrap;
}

button[type="submit"]:hover {
    background: #004d8c;
    transform: translateY(-1px);
}

/* 도서 목록 스타일 */
.book-list {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 25px;
<<<<<<< HEAD
    margin-bottom: 80px;
=======
    margin-bottom: 120px;
    padding-bottom: 20px;
>>>>>>> branch 'master' of https://github.com/so040602/team3Project.git
}

.book-item {
    display: flex;
    flex-direction: column;
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    padding: 0;
}

.book-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0,0,0,0.12);
}

.book-image {
    width: 100%;
<<<<<<< HEAD
    height: 300px;
=======
    height: 250px;
>>>>>>> branch 'master' of https://github.com/so040602/team3Project.git
    object-fit: cover;
    border-bottom: 1px solid #eee;
}

.book-details {
<<<<<<< HEAD
    padding: 20px;
=======
    padding: 15px;
>>>>>>> branch 'master' of https://github.com/so040602/team3Project.git
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
    color: #0066c0;
}

.book-category {
    font-size: 0.85em;
    color: #666;
    margin-bottom: 10px;
}

.book-description {
    font-size: 0.9em;
    color: #666;
    margin-bottom: 15px;
    line-height: 1.5;
}

/* 버튼 스타일 */
.button-group {
    display: flex;
    gap: 10px;
<<<<<<< HEAD
    padding: 0 20px 20px 20px;
=======
    padding: 0 15px 15px;
>>>>>>> branch 'master' of https://github.com/so040602/team3Project.git
}

.button-group button {
    flex: 1;
    padding: 10px;
    border-radius: 6px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
    border: none;
}

.reserve-button {
    background-color: #fff;
    color: #0066c0;
    border: 1px solid #0066c0 !important;
}

.reserve-button:hover {
    background-color: #f0f7ff;
}

.borrow-button {
    background-color: #0066c0;
    color: white;
}

.borrow-button:hover {
    background-color: #004d8c;
}

<<<<<<< HEAD
.pagination {
    display: flex;
    justify-content: center;
    list-style-type: none;
    padding: 20px 0;
    margin-top: 30px;
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
=======
/* 페이지네이션 스타일 */
.pagination {
    display: flex;
    justify-content: center;
    list-style-type: none;
    padding: 20px 0;
    margin-top: 30px;
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    position: absolute;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    min-width: max-content;
>>>>>>> branch 'master' of https://github.com/so040602/team3Project.git
}

.page-item {
<<<<<<< HEAD
    margin: 0 3px;
=======
    margin: 0 4px;
    display: inline-flex;
    align-items: center;
>>>>>>> branch 'master' of https://github.com/so040602/team3Project.git
}

.page-link {
    color: #0066c0;
<<<<<<< HEAD
    padding: 8px 16px;
    text-decoration: none;
    border: 1px solid #dee2e6;
    border-radius: 6px;
    transition: all 0.2s;
=======
    padding: 8px 12px;
    text-decoration: none;
    border: 1px solid #dee2e6;
    border-radius: 4px;
    transition: all 0.2s;
    min-width: max-content;
>>>>>>> branch 'master' of https://github.com/so040602/team3Project.git
}

.page-link:hover {
    background-color: #f8f9fa;
    border-color: #0066c0;
}

.page-item.active .page-link {
    background-color: #0066c0;
    color: white;
    border-color: #0066c0;
}

.page-item.disabled .page-link {
    color: #6c757d;
    pointer-events: none;
    background-color: #fff;
    border-color: #dee2e6;
}

<<<<<<< HEAD
@media (max-width: 768px) {
    .container {
        margin: 20px;
        padding: 15px;
    }

    #bookSearch {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-bottom: 20px;
    padding: 20px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
}

.search-wrapper {
    display: flex;
    flex: 1;
    gap: 10px;
    align-items: center;
}

#categorySelect {
    padding: 12px 20px;
    border: 2px solid #e1e1e1;
    border-radius: 8px;
    font-size: 15px;
    background-color: white;
    cursor: pointer;
    min-width: 150px;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 15px center;
    background-size: 15px;
    padding-right: 45px;
    appearance: none;
    -webkit-appearance: none;
}

input[type="text"] {
    flex: 1;
    padding: 12px 20px;
    border: 2px solid #e1e1e1;
    border-radius: 8px;
    font-size: 15px;
    min-width: 200px;
}

button[type="submit"] {
    padding: 12px 25px;
    background: #0066c0;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 500;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 8px;
}

button[type="submit"] i {
    font-size: 16px;
}

@media (max-width: 768px) {
    #bookSearch {
        flex-direction: column;
        padding: 15px;
    }

    .search-wrapper {
        flex-direction: column;
        width: 100%;
    }

    #categorySelect {
        width: 100%;
    }

    input[type="text"] {
        width: 100%;
    }

    button[type="submit"] {
        width: 100%;
        justify-content: center;
=======
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

    .category-select {
        width: 100%;
    }

    .book-list {
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 15px;
    }

    .book-image {
        height: 200px;
    }

    .pagination {
        flex-wrap: wrap;
        justify-content: center;
        gap: 5px;
        padding: 10px;
        position: static;
        transform: none;
        margin: 20px auto;
>>>>>>> branch 'master' of https://github.com/so040602/team3Project.git
    }
}
</style>
</head>
<body>
<div class="container">
<<<<<<< HEAD
      <h2>도서 목록</h2>
=======
		<h2>도서 목록</h2>

    <!-- 통합 검색 폼 -->
    <form id="bookSearch" action="<%=getEnvs%>bookSearch" method="POST">
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
    <form id="categoryForm" action="<%=getEnvs%>bookCategory" method="POST">
        <select class="category-select" name="category" onchange="document.getElementById('categoryForm').submit()">
            <option value="전체보기">전체</option>
            <c:forEach var="category" items="${requestScope.category_List}">
                <option value="${category}" 
                    <c:if test="${category == requestScope.selectedCategory}">selected</c:if>>
                    ${category}
                </option>
            </c:forEach>
        </select>
    </form>
		
>>>>>>> branch 'master' of https://github.com/so040602/team3Project.git

    <!-- 통합 검색 폼 -->
    <form id="bookSearch" action="<%=getEnvs%>bookList" method="POST">
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
    <form id="categoryForm" action="<%=getEnvs%>bookList" method="POST">
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
                     <a href="<%=getEnvs%>bookDetail&cnt=${bean.cnt}">${bean.book_name}</a>
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
                     href="<%=getEnvs%>bookList&pageNumber=1&currCategory=${requestScope.selectedCategory}">처음</a></li>
               </c:if>
               <c:if test="${pagelist.beginPage <= 10}">
                  <li class="page-item"><span class="page-link disabled">처음</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.beginPage > 1}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookList&pageNumber=${pagelist.beginPage - 1}&currCategory=${requestScope.selectedCategory}">이전</a></li>
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
                        class="page-link" href="<%=getEnvs%>bookList&pageNumber=${i}&currCategory=${requestScope.selectedCategory}">${i}</a></li>
                  </c:forEach>
               </c:if>
               <c:if test="${pagelist.endPage < pagelist.totalPage}">
                  <li class="page-item"><a class="page-link"
                        href="<%=getEnvs%>bookList&pageNumber=${pagelist.endPage + 1}&currCategory=${requestScope.selectedCategory}">다음</a></li>
               </c:if>
               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
                  <li class="page-item disabled"><span class="page-link">다음</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.endPage < pagelist.totalPage}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookList&pageNumber=${pagelist.totalPage}&currCategory=${requestScope.selectedCategory}">맨끝</a></li>
               </c:if>
               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
                  <li class="page-item disabled"><span class="page-link">맨끝</span>
                  </li>
               </c:if>
            </c:if>
            <c:if test="${requestScope.keyword != ''}">
               <c:if test="${pagelist.beginPage > 10}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookList&pageNumber=1&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">처음</a></li>
               </c:if>
               <c:if test="${pagelist.beginPage <= 10}">
                  <li class="page-item"><span class="page-link disabled">처음</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.beginPage > 1}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookList&pageNumber=${pagelist.beginPage - 1}&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">이전</a></li>
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
                        class="page-link" href="<%=getEnvs%>bookList&pageNumber=${i}&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">${i}</a></li>
                  </c:forEach>
               </c:if>
               <c:if test="${pagelist.endPage < pagelist.totalPage}">
                  <li class="page-item"><a class="page-link"
                        href="<%=getEnvs%>bookList&pageNumber=${pagelist.endPage + 1}&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">다음</a></li>
               </c:if>
               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
                  <li class="page-item disabled"><span class="page-link">다음</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.endPage < pagelist.totalPage}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookList&pageNumber=${pagelist.totalPage}&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">맨끝</a></li>
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