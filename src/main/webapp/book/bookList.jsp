<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<style type="text/css">
		.container{margin-top: 10px;}
		.rounded-pill{opacity: 0.7;}
	</style>
</head>
<body>
	<div class="container">
		<h2>게시물 목록</h2>
		<p>사용자들이 게시한 목록을 보여 주는 페이지</p>	
		<table class="table table-striped">
			<thead>
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>카테고리</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${requestScope.datalist}"> 
				<tr>
					<td>${bean.cnt}</td>
					<td>${bean.name}</td>
					<td>${bean.category}</td>
					<c:choose>
						<c:when test="${fn:length(bean.description) > 50}">
							<td>${fn:substring(bean.description, 0, 50)}...</td>
						</c:when>
						<c:otherwise>
							<td>${bean.description}</td>
						</c:otherwise>
					</c:choose>
				</tr>
				</c:forEach>				 
			</tbody>
		</table>
			<ul class="pagination justify-content-center">
				<c:if test="${pagelist.beginPage > 1}">
					<li class="page-item"><a class="page-link"
						href="<%=getEnvs%>bookList&pageNumber=${pagelist.beginPage - 1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pagelist.beginPage}"
					end="${pagelist.endPage}">
					<li
						class="page-item <c:if test="${i == pagelist.pageNumber}">active</c:if>"><a
						class="page-link" href="<%=getEnvs%>bookList&pageNumber=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pagelist.endPage < pagelist.totalPage}">
					<li class="page-item"><a class="page-link"
						href="<%=getEnvs%>bookList&pageNumber=${pagelist.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
	</div>	 
</body>
</html>