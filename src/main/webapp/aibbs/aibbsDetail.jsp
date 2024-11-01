<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
    
	<style type="text/css">
		.container{margin-top: 10px;} /* box model */
		.rounded-pill{opacity: 0.7;}
		#backButton{margin: auto;}
		.tbBoardRead th {width: 120px;}
	</style>

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

				<c:choose>
				    <c:when test="${not empty requestScope.bean.attach01}">
				        <tr>
				            <th>첨부파일(1)</th>
				            <td>
				                <img src="${requestScope.filePath}/${requestScope.bean.attach01}" style="width:640px; height:auto;" 
				                    alt="${requestScope.filePath}/${requestScope.bean.attach01}" />
				            </td>
				        </tr>
				    </c:when>
				    <c:otherwise>
				        <tr>
				            <th>첨부파일(1)</th>
				            <td>첨부파일이 없습니다.</td>
				        </tr>
				    </c:otherwise>
				</c:choose>
				
				<c:choose>
				    <c:when test="${not empty requestScope.bean.attach02}">
				        <tr>
				            <th>첨부파일(2)</th>
				            <td>
				                <img src="${requestScope.filePath}/${requestScope.bean.attach02}" style="width:640px; height:auto;" 
				                    alt="${requestScope.filePath}/${requestScope.bean.attach02}" />
				            </td>
				        </tr>
				    </c:when>
				    <c:otherwise>
				        <tr>
				            <th>첨부파일(2)</th>
				            <td>첨부파일이 없습니다.</td>
				        </tr>
				    </c:otherwise>
				</c:choose>
				
				<c:choose>
				    <c:when test="${not empty requestScope.bean.attach03}">
				        <tr>
				            <th>첨부파일(3)</th>
				            <td>
				                <img src="${requestScope.filePath}/${requestScope.bean.attach03}" style="width:640px; height:auto;" 
				                    alt="${requestScope.filePath}/${requestScope.bean.attach03}" />
				            </td>
				        </tr>
				    </c:when>
				    <c:otherwise>
				        <tr>
				            <th>첨부파일(3)</th>
				            <td>첨부파일이 없습니다.</td>
				        </tr>
				    </c:otherwise>
				</c:choose>
				
				<c:choose>
				    <c:when test="${not empty requestScope.bean.attach04}">
				        <tr>
				            <th>첨부파일(4)</th>
				            <td>
				                <img src="${requestScope.filePath}/${requestScope.bean.attach04}" style="width:640px; height:auto;" 
				                    alt="${requestScope.filePath}/${requestScope.bean.attach04}" />
				            </td>
				        </tr>
				    </c:when>
				    <c:otherwise>
				        <tr>
				            <th>첨부파일(4)</th>
				            <td>첨부파일이 없습니다.</td>
				        </tr>
				    </c:otherwise>
				</c:choose>

				<c:choose>
				    <c:when test="${not empty requestScope.bean.codefile}">
				        <tr>
				            <th>코드파일</th>
				            <td>
				                <a href="${requestScope.filePath}/${requestScope.bean.codefile}">${requestScope.bean.codefile}</a>
				            </td>
				        </tr>
				    </c:when>
				    <c:otherwise>
				        <tr>
				            <th>코드파일</th>
				            <td>코드파일이 없습니다.</td>
				        </tr>
				    </c:otherwise>
				</c:choose>

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