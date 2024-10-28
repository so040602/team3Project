<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<style type="text/css">
	body {
		font-family: 'Roboto', 'Arial', sans-serif;
		background-color: #f3f3f3;
		color: #333;
	}
	
	.container {
		max-width: 1400px;
		margin: 40px auto;
		padding: 20px;
		background-color: #ffffff;
		box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
		position: relative; /* 상대 위치 설정 */
	}
	
	.pagination {
		display: flex;
		justify-content: center;
		list-style-type: none;
		padding: 0;
		margin-top: 30px;
		position: absolute; /* 절대 위치 설정 */
		bottom: 0; /* 맨 아래 위치 */
		left: 50%; /* 수평 중앙 */
		transform: translateX(-50%); /* 중앙 정렬 */
	}
	
	h2 {
		color: #333;
		text-align: left;
		margin-bottom: 30px;
		font-size: 24px;
		border-bottom: 1px solid #e1e1e1;
		padding-bottom: 10px;
	}
	
	.book-list {
		display: grid;
		grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
		gap: 20px;
		margin-bottom: 60px; /* 아래쪽 여백 추가 */
	}
	
	.book-item {
		display: flex;
		flex-direction: column;
		border: none;
		border-radius: 0;
		padding: 10px;
		transition: transform 0.2s;
		background-color: #fff;
	}
	
	.book-item:hover {
		transform: translateY(-5px);
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	}
	
	.book-image {
		width: 100%;
		height: 250px;
		object-fit: cover;
		margin-bottom: 10px;
	}
	
	.book-details {
		flex-grow: 1;
	}
	
	.book-title {
		font-weight: bold;
		font-size: 1em;
		color: #0066c0;
		margin-bottom: 5px;
		line-height: 1.2;
	}
	
	.book-title a {
		text-decoration: none;
		color: inherit;
	}
	
	.book-title a:hover {
		text-decoration: underline;
	}
	
	.book-category {
		font-size: 0.8em;
		color: #555;
		margin-bottom: 5px;
	}
	
	.book-description {
		font-size: 0.9em;
		color: #333;
		margin-bottom: 10px;
	}
	
	.button-group {
		display: flex;
		justify-content: space-between;
	}
	
	.button-group button {
		flex: 1;
		padding: 8px 12px;
		border: none;
		border-radius: 3px;
		color: white;
		cursor: pointer;
		transition: background-color 0.2s;
		font-size: 0.9em;
	}
	
	.reserve-button {
		background-color: #f0c14b;
		color: #111;
		margin-right: 5px;
	}
	
	.reserve-button:hover {
		background-color: #ddb347;
	}
	
	.borrow-button {
		background-color: #4CAF50;
	}
	
	.borrow-button:hover {
		background-color: #45a049;
	}
	
	
	.page-item {
		margin: 0 5px;
	}
	
	.page-item a {
		color: #0066c0;
		padding: 8px 12px;
		border: 1px solid #ddd;
		text-decoration: none;
		font-size: 0.8em;
	}
	
	.page-item a:hover {
		background-color: #f0f0f0;
	}
	
	.page-item.active a {
		background-color: #0066c0;
		color: white;
	}

</style>
</head>
<body>
	<div class="container">
		<h2>도서 목록</h2>
		<form id="bookSearch" action="<%=getEnvs%>bookSearch" method="POST">
			<span>
				<select id="categorySelect" name="category">
					<option value="전체보기">전체보기</option>
					<c:forEach var="category" items="${requestScope.category_List}">
						<option value="${category}" 
							<c:if test="${category == requestScope.selectedCategory}">selected</c:if>>
							${category}
						</option>
					</c:forEach>
				</select>				
			</span>
			<input type="text" name="keyword" placeholder="여기에 찾으실 도서를 입력하세요.">
			<button type="submit">검색</button>
		</form>
		<form id="categoryForm" action="<%=getEnvs%>bookCategory" method="POST">
			<select id="categorySelect" name="category" onchange="document.getElementById('categoryForm').submit()">
				<option value="전체보기">전체보기</option>
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
