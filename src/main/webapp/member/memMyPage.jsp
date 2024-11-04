<%@page import="com.team3.model.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ page isErrorPage="false" %>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
:root {
	--primary-color: #0066c0;
	--primary-hover: #004d8c;
	--background-color: #f8f9fa;
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

span {
	font-size: 1.2rem;
}

.dddmain_header {
	background-color: LightGray;
	border-top-left-radius: 2em 0.5em;
	border-top-right-radius: 1em 3em;
	border-bottom-right-radius: 4em 0.5em;
	border-bottom-left-radius: 1em 3em;
}

.borrow-button {
	background-color: var(--primary-color);
	color: white;
}

.borrow-button:hover {
	background-color: var(--primary-hover);
}
.main_header {
    display: inline; /* 텍스트와 버튼을 같은 줄에 배치 */
    margin-right: 10px; /* 텍스트와 버튼 간의 간격 조정 */
}

.button-container {
    display: inline; /* 버튼을 같은 줄에 배치 */
}

.update-button {
    padding: 5px 10px; /* 버튼 내부 여백 */
    font-size: 14px; /* 버튼 글자 크기 */
    cursor: pointer; /* 마우스 포인터 변경 */
    background-color: var(--primary-color);
    color: white;
}


</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2>
					${sessionScope.loginfo.memname}(${sessionScope.loginfo.memid}) 님의
					마이페이지</h2>
				<p>${sessionScope.loginfo.memname}님의 회원 정보입니다.</p>
				<br />
				<h3 class="main_header">회원 정보</h3>
				<div class="button-container">
					<a href="<%=getEnvs%>memUpdate">
					<input type="button" value="회원 수정" class="update-button"></a>
				</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>회원정보</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>이름</th>
							<td valign="middle">${mbean.memname}</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td valign="middle">${mbean.memid}</td>
						</tr>
						<tr>
							<th>생일</th>
							<td valign="middle">${mbean.birth}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td valign="middle">${mbean.mobile}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td valign="middle">${mbean.email}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td valign="middle">${mbean.addr01}</td>
						</tr>
						<tr>
							<th>상세 주소</th>
							<td valign="middle">${mbean.addr02}</td>
						</tr>
					</tbody>
				</table>
				
				<h3 class="main_header">대출 현황</h3>
				<p>${sessionScope.loginfo.memname}님의 대출 현황입니다.</p>
				<table class="table table-striped">
					<thead>
						<tr>
							<th></th>
							<th>책 이름</th>
							<th>장르</th>
							<th>작가</th>
							<th>출판사</th>
							<th>출판날짜</th>
							<th>대출자</th>
							<th>대출날짜</th>
							<th>반납하기</th>
						</tr>
					</thead>
					<c:forEach var="bean" items="${requestScope.datalist}">
						<tbody>
							<td><img class="bookimg" src="${bean.img}" width="45" height="45" alt="${bean.book_name}"></td>
							<td>${bean.book_name}</td>
							<td>${bean.category}</td>
							<td>${bean.person_name}</td>
							<td>${bean.publisher}</td>							
							<td>${bean.date}</td>
							<td>${bean.memname}</td>
							<td>${bean.regdate}</td>
							<td><button type="button" id="mybutton" class="borrow-button btn-out" value="${bean.book_idx}" onclick="showConfirm(this.value)">도서 반납</button></td>
						</tbody>
					</c:forEach>

				</table>
				<c:if test="${not empty limitdate}">
					<h3 class="main_header">연체 현황</h3>
					<p>${sessionScope.loginfo.memname}님의 연체 현황입니다.</p>
					<table class="table table-striped">
						<thead>
								<tr>
									<th></th>
									<th>책 이름</th>
									<th>장르</th>
									<th>작가</th>
									<th>출판사</th>
									<th>출판날짜</th>
									<th>대출자</th>
									<th>대출날짜</th>
									<th>반납하기</th>
								</tr>
						</thead>
						<c:forEach var="bean" items="${requestScope.limitdate}">
							<tbody>
								<td><img class="bookimg" src="${bean.img}" width="45" height="45" alt="${bean.book_name}"></td>
								<td>${bean.book_name}</td>
								<td>${bean.category}</td>
								<td>${bean.person_name}</td>
								<td>${bean.publisher}</td>							
								<td>${bean.date}</td>
								<td>${bean.memname}</td>
								<td>${bean.regdate}</td>
								<td><button type="button" id="mybutton" class="borrow-button btn-out" value="${bean.book_idx}" onclick="showConfirm(this.value)">도서 반납</button></td>
							</tbody>
						</c:forEach>
					</table>
				</c:if>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	
	<script>
        function showConfirm(bookidx){
        	const result = confirm("반납을 진행 하시겠습니까?");
        	console.log(bookidx);
        	if(result){
        		fetch('<%=getEnvs%>memMyPage', {
        			method:'POST',
        			headers:{
        				'Content-Type':'application/json'
        			},
        			body:JSON.stringify({bookId:bookidx})
        		}).then(response => {
        			if(!response.ok){
        				throw new Error('Network response was not ok');
        			}
        			return response.json(); //JSON으로 응답 받기
        		})
        		.then(data => {
        			console.log(data);
        			if(data === "완료"){
                    	alert('반납이 완료 되었습니다.');
                    	window.location.href = window.location.href;
                    }else if(data === "실패"){
                    	alert('반납이 실패하였습니다.');
                    	window.location.href = window.location.href;
                    }
        		})
        		.catck(error => {
        			console.error('There has been a problem with your fetch operation:', error);
        		});
        	}
        }
    </script>
</body>
</html>