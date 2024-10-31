<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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
		span {font-size:1.2rem;}
		.dddmain_header{
		background-color:LightGray;
		  border-top-left-radius: 2em 0.5em;
  border-top-right-radius: 1em 3em;
  border-bottom-right-radius: 4em 0.5em;
  border-bottom-left-radius: 1em 3em;}
  .borrow-button {
    background-color: var(--primary-color);
    color: white;
}

 .borrow-button:hover {
    background-color: var(--primary-hover);
}
	</style>
</head>
<body>
	<div class="container">
		<div class="row">
    		<div class="col-sm-2"></div>
    		<div class="col-sm-8">
				<h2>
					${sessionScope.loginfo.memname}(${sessionScope.loginfo.memid})
					님의 북마크
				</h2>
				<p>
					${sessionScope.loginfo.memname}님이 담으신 책들의 내용입니다.
				</p>
				
				<br/>
				<h3 class="main_header">북마크</h3>		
				
				<table class="table table-striped">
					<thead>
						<tr>
							<th>책 제목</th>
							<th>이미지</th>
							<th>작가</th>
							<th>출시일자</th>
							<th>북마크날짜</th>
							<th></th>
						</tr>
					</thead>
					<tbody>										
						<c:forEach var="bean" items="${requestScope.datalist}">
							<tr>
								<td valign="middle">${bean.book_name}</td>
								<td valign="middle">
									<img alt="${bean.book_name}" width="45" height="45" 
										src="${bean.img}">
								</td>
								<td valign="middle">
									${bean.person_name}						
								</td>
								<td valign="middle">
									${bean.date}				
								</td>
								<td valign="middle">
									${bean.regdate}					
								</td>
								<td>
									<button type="button" class="borrow-button btn-out" value="${bean.book_idx},${bean.oid}">대출하기</button>
								</td>					
							</tr>					
						</c:forEach>	
					</tbody>
				</table>				
    			</div>
    		<div class="col-sm-2"></div>
  		</div>		
	</div>
	
	<script>
        // DOM 로드 이벤트와 버튼 이벤트를 하나의 스크립트로 통합
        document.addEventListener("DOMContentLoaded", function() {
        	const buttons = document.querySelectorAll('.btn-out')
            // 버튼 클릭 이벤트
            buttons.forEach(button => {button.addEventListener('click', function() {
                const values = this.value.split(',');
            	const bookOutIdx = values[0];
                const cartOid = values[1];
                console.log(bookOutIdx);
                console.log(cartOid);
                
                fetch('<%=getEnvs%>bookOut', {
                	method: 'POST',
                	headers: {
                		'Content-Type':'application/json'
                	},
                	body: JSON.stringify({bookId: bookOutIdx, oid: cartOid})
                }).then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json(); // JSON으로 응답 받기
                })
                .then(data => {
                    console.log(data);// 서버에서 받은 응답 처리                
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
            });
        });
        });
    </script>
	
</body>
</html>
