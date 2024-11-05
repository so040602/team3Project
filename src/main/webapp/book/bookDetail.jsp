<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.team3.model.bean.Book"%>
<%@ page import="com.team3.model.dao.BookDao"%>
<%@ include file="./../common/common.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

<%
int bookCnt = Integer.parseInt(request.getParameter("book_idx"));
BookDao dao = new BookDao();
Book book = dao.getDataByPk(bookCnt);
float rating = book.getRating();
double convertedRating = (rating / 10) * 5;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=book.getBook_name()%></title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">

<style>
/* 기본 스타일 */
body {
	background-color: #f8f9fa;
	font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
}

.container {
	max-width: 1400px;
	background-color: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	margin-top: 2rem;
	margin-bottom: 2rem;
}

/* 책 커버 스타일 */
.book-cover {
	max-width: 100%;
	height: auto;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
	border-radius: 5px;
}

.rank-badge {
	background-color: #007bff;
	color: white;
	padding: 5px 10px;
	border-radius: 20px;
	font-size: 0.8rem;
	margin-top: 1rem;
	display: inline-block;
}

/* 책 정보 스타일 */
.book-title {
	font-size: 24px;
	font-weight: bold;
	color: #333;
	border-bottom: 1px solid #eee;
	padding-bottom: 15px;
	margin-bottom: 1rem;
}

.meta-info {
	font-size: 0.9rem;
	color: #666;
	margin-bottom: 1rem;
	line-height: 1.6;
}

/* 평점 스타일 */
.rating-review {
	display: flex;
	align-items: center;
	margin-bottom: 1rem;
}

.rating-stars {
	color: #ff6b6b;
	font-size: 1.2rem;
}

.rating-stars i {
	margin-right: 2px;
}

.rating-score {
	margin-left: 0.5rem;
	margin-right: 1.5rem;
	font-weight: 500;
	color: #333;
}

.review-link {
	display: inline-flex;
	align-items: center;
	color: #0066c0;
	font-weight: 500;
	text-decoration: none;
	transition: color 0.2s ease;
}

.review-link:hover {
	color: #004e96;
	text-decoration: underline;
}

.review-link i {
	margin-right: 5px;
}

/* 책 상세 정보 영역 */
.bookdetail-info {
	background-color: #f8f9fa;
	padding: 30px;
	border-radius: 12px;
	margin: 20px 0;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.book-details {
	position: relative;
	padding-bottom: 40px;
}

.detail-header {
	font-size: 20px;
	font-weight: 600;
	color: #333;
	margin-bottom: 20px;
	padding-bottom: 15px;
	border-bottom: 2px solid #eee;
}

.detail-content {
	line-height: 1.8;
	color: #555;
	max-height: 200px;
	overflow: hidden;
	transition: max-height 0.3s ease;
	margin-bottom: 20px;
	font-size: 1rem;
	word-break: keep-all;
	position: relative;
}

.detail-content.expanded {
	max-height: none;
}

/* 더보기 버튼 스타일 */
.toggle-button {
	position: absolute;
	bottom: 0;
	right: 0;
	background: none;
	border: none;
	color: #0066c0;
	font-size: 0.9rem;
	font-weight: 500;
	cursor: pointer;
	padding: 8px 16px;
	border-radius: 20px;
	transition: all 0.2s ease;
}

.toggle-button:hover {
	background-color: #f0f7ff;
	text-decoration: underline;
}

.toggle-button::after {
	content: '';
	display: inline-block;
	margin-left: 5px;
	width: 8px;
	height: 8px;
	border-right: 2px solid #0066c0;
	border-bottom: 2px solid #0066c0;
	transform: rotate(45deg);
	transition: transform 0.2s ease;
}

.toggle-button.expanded::after {
	transform: rotate(-135deg);
}

/* 버튼 그룹 스타일 */
.action-buttons {
	display: flex;
	gap: 10px;
	margin: 20px 0;
}

.action-buttons .btn {
	flex: 1;
	padding: 12px;
	font-weight: 500;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
	transition: all 0.2s ease;
}

.btn-buy {
	background-color: #E64938;
	color: white;
	border: none;
	flex: 2 !important;
}

.btn-buy:hover {
	background-color: #d43b2a;
}

.btn-wishlist {
	background-color: white;
	color: #666;
	border: 1px solid #666;
}

.btn-wishlist:hover {
	background-color: #f8f9fa;
	color: #333;
}

.btn-cart {
	background-color: #666;
	color: white;
	border: none;
}

.btn-cart:hover {
	background-color: #555;
}

/* 반응형 스타일 */
@media ( max-width : 768px) {
	.container {
		padding: 15px;
		margin: 1rem;
	}
	.action-buttons {
		flex-direction: column;
	}
	.action-buttons .btn {
		width: 100%;
	}
}
</style>
</head>
<body>
	<div class="container my-5">
		<div class="row">
			<!-- 왼쪽 영역: 도서 이미지 -->
			<div class="col-md-4 mb-4">
				<img src="<%=book.getImg()%>" alt="<%=book.getBook_name()%>"
					class="book-cover">
				<div class="rank-badge mt-3">
					<%=book.getCategory()%>
					주간 베스트
				</div>
			</div>

			<!-- 오른쪽 영역: 도서 정보 -->
			<div class="col-md-8">
				<h1 class="book-title"><%=book.getBook_name()%></h1>

				<div class="meta-info">
					저자:
					<%=book.getPerson_name()%>
					| 출판사:
					<%=book.getPublisher()%>
					| 출판일:
					<%=book.getDate()%>
					| 카테고리:
					<%=book.getCategory()%>
				</div>

				<div class="rating-review">
					<div class="rating-stars">
						<%
						for (int i = 1; i <= 5; i++) {
							if (i <= convertedRating) {
								out.print("<i class='fas fa-star'></i>");
							} else if (i - convertedRating < 1) {
								out.print("<i class='fas fa-star-half-alt'></i>");
							} else {
								out.print("<i class='far fa-star'></i>");
							}
						}
						%>
					</div>
					<span class="rating-score"><%=String.format("%.1f", rating)%></span>
					<a href="<%=getEnvs%>reviewList&book_idx=<%=bookCnt%>"
						class="review-link"> <i class="far fa-comment-dots"></i> 리뷰 보기
					</a>
				</div>

				<div class="bookdetail-info">
					<div class="book-details">
						<h3 class="detail-header">책 소개</h3>
						<div class="detail-content" id="bookDescription">
							<%=book.getDescription()%>
						</div>
						<button id="toggleButton" class="toggle-button">더보기</button>
					</div>
				</div>
				
				<c:if test="${whologin > 0}">
					<div class="action-buttons">
						<button class="btn btn-lg btn-buy btn-out" value="<%=bookCnt%>">
							<i class="fas fa-book"></i> 대출
						</button>
						<button class="btn btn-lg btn-wishlist">
							<i class="fas fa-calendar-check"></i> 대출 예약
						</button>
						<button class="btn btn-lg btn-cart" value="<%=bookCnt%>">
							<i class="fas fa-bookmark"></i> 북마크
						</button>
					</div>
				</c:if>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        // DOM 로드 이벤트와 버튼 이벤트를 하나의 스크립트로 통합
        document.addEventListener("DOMContentLoaded", function() {
            // 더보기 버튼 기능
            const toggleButton = document.getElementById("toggleButton");
            const description = document.getElementById("bookDescription");
                       
            toggleButton.addEventListener("click", function() {
                description.classList.toggle("expanded");
                toggleButton.classList.toggle("expanded");
                toggleButton.textContent = description.classList.contains("expanded") ? "접기" : "더보기";
            });

            // 버튼 클릭 이벤트
            document.querySelector('.btn-cart').addEventListener('click', function() {
                const bookCartIdx = this.value;
				
                fetch('<%=getEnvs%>bookOutCart', {
                	method: 'POST',
                	headers: {
                		'Content-Type':'application/json'
                	},
                	body: JSON.stringify({bookId:bookCartIdx})
                }).then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json(); // JSON으로 응답 받기
                })
                .then(data => {
                    console.log(data);// 서버에서 받은 응답 처리
                    
                    if(data === "초과"){
                    	alert('책은 6권 이상 담을 수 없습니다.');
                    }else if(data === "중복"){
                    	alert('같은 책은 담을 수 없습니다.');
                    }else if(data === "오류"){
                    	alert('책을 담을 수 없습니다.')
                    } else if(data === "가능"){
                    	alert('북마크에 추가되었습니다.');
                    }else{
                    	alert('이미 대출중인 도서 입니다.');
                    }                   
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
            });
            
            document.querySelector('.btn-wishlist').addEventListener('click', function() {
                alert('대출 예약이 완료되었습니다.');
            });
            
            document.querySelector('.btn-buy').addEventListener('click', function() {
            	const bookOutIdx = this.value;
            	console.log(bookOutIdx);
            	fetch('<%=getEnvs%>BookListOut', {
                	method: 'POST',
                	headers: {
                		'Content-Type':'application/json'
                	},
                	body: JSON.stringify({bookId: bookOutIdx})
                }).then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json(); // JSON으로 응답 받기
                })
                .then(data => {
                    console.log(data);// 서버에서 받은 응답 처리  
                    if(data === "불가능"){
                    	alert('이미 책이 대여 중 입니다.');
                    }else if(data === "성공"){
                    	alert('해당 책이 대출 되었습니다.');
                    	window.location.href = window.location.href;
                    }else if(data === "실패"){
                    	alert('책을 대출할 수 없습니다.')
                    } else if(data === "오류"){
                    	alert('대출 진행 중 오류가 발생했습니다. 다시 시도해주세요.');
                    }else if(data === "초과")
                    	alert('대출 가능한 권수(4)를 초과했습니다.')
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
            });
        });
    </script>
</body>
</html>
