<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
					<th>작성자</th>
					<th>글제목</th>
					<th>조회수</th>
					<th>작성일</th>					
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${requestScope.datalist}"> 
				<tr>
					<td>${bean.brdidx}</td>
					<td>${bean.memid}</td>
					<td>
						<a href="<%=getEnvs%>brdDetail&brdidx=${bean.brdidx}">
							<c:forEach var="i" begin="1" end="${bean.depthcnt}" step="1">
								<span class="badge rounded-pill bg-secondary">re</span>
							</c:forEach>
							${bean.subtitle}
						</a>
					</td>
					<td>
						<c:if test="${bean.readcnt >= 30}">
							<span class="badge rounded-pill bg-primary">
								${bean.readcnt}
							</span>
						</c:if>
						<c:if test="${bean.readcnt < 30}">
							<span class="badge rounded-pill bg-danger">
								${bean.readcnt}
							</span>
						</c:if>						
					</td>
					<td>${bean.regdate}</td>							
					<td>
						<c:if test="${sessionScope.loginfo.memid == bean.memid}">
							<a href="<%=getEnvs%>brdUpdate&brdidx=${bean.brdidx}">수정</a>
						</c:if>
					</td>
				</tr>
				</c:forEach>				 
			</tbody>
		</table>
		
	</div>	 
</body>
</html>