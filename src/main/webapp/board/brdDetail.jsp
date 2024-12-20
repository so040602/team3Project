<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.container{margin-top: 10px;} /* box model */
		.rounded-pill{opacity: 0.7;}
		#backButton{margin: auto;}
		.tbBoardRead th {width: 120px;}
	</style>
</head>
<body>
	<div class="container">
		<h2>${requestScope.bean.brdidx}번 게시물 정보</h2>
		<table class="table tbBoardRead">
			<thead>
			</thead>
			<tbody>
				<tr>
					<th>글번호</th>
					<td>${requestScope.bean.brdidx}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${requestScope.bean.memid}</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td>${requestScope.bean.subtitle}</td>
				</tr>
				<tr>
					<th>글내용</th>
					<td>${requestScope.bean.contents}</td>
				</tr>
				<tr>
					<th>첨부파일(1)</th>
					<td>
						<img src="${requestScope.filePath}/${requestScope.bean.attach01}" style="width:640px; height:auto;" 
							alt="${requestScope.filePath}/${requestScope.bean.attach01}" />
					</td>
				</tr>
				<tr>
					<th>첨부파일(2)</th>
					<td>
						<img src="${requestScope.filePath}/${requestScope.bean.attach02}" style="width:640px; height:auto;" 
							alt="${requestScope.filePath}/${requestScope.bean.attach02}" />
					</td>
				</tr>
				<tr>
				<th>조회수</th>
					<td>${requestScope.bean.readcnt}</td>
				</tr>				
			</tbody>
		</table>
		<div id="backButton" style="text-align:center;">
			<button type="button" class="btn btn-primary" onclick="history.back();">
				돌아가기
			</button>		
		</div>
		<div>&nbsp;</div>
	</div>	 
</body>
</html>