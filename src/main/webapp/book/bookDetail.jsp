<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.team3.model.bean.Book"%>
<%@ page import="com.team3.model.dao.BookDao"%>

<%
    int bookCnt = Integer.parseInt(request.getParameter("cnt"));
    BookDao dao = new BookDao();
    Book book = dao.getDataByPk(bookCnt);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><%=book.getBook_name()%></title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        .container {
            max-width: 1400px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .book-cover {
            max-width: 100%;
            height: auto;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            border-radius: 5px;
        }
        
        .book-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }
        
        .rating-stars {
            color: #ff6b6b;
            font-size: 1.1rem;
        }
        
        .price-info {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
        }
        
        .original-price {
            color: #666;
            text-decoration: line-through;
            font-size: 0.9rem;
        }
        
        .discount-price {
            font-size: 1.8rem;
            color: #E64938;
            font-weight: bold;
        }
        
        .discount-rate {
            color: #E64938;
            font-weight: bold;
            font-size: 1.2rem;
        }
        
        .point-info {
            font-size: 0.9rem;
            color: #28a745;
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
            margin: 20px 0;
        }
        
        .btn-buy {
            background-color: #E64938;
            color: white;
            border: none;
            flex: 2;
        }
        
        .btn-cart {
            background-color: #666;
            color: white;
            border: none;
            flex: 1;
        }
        
        .btn-wishlist {
            background-color: white;
            color: #666;
            border: 1px solid #666;
            flex: 1;
        }
        
        .book-details {
            margin-top: 30px;
        }
        
        .detail-header {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid #333;
        }
        
        .detail-content {
            line-height: 1.8;
            color: #555;
        }
        
        .meta-info {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 10px;
        }
        
        .rank-badge {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            margin-bottom: 10px;
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <div class="row">
            <!-- 왼쪽 영역: 도서 이미지 -->
            <div class="col-md-4 mb-4">
                <img src="<%=book.getImg()%>" alt="<%=book.getBook_name()%>" class="book-cover">
                <div class="rank-badge mt-3">
                    <%=book.getCategory()%> 주간 베스트
                </div>
            </div>
            
            <!-- 오른쪽 영역: 도서 정보 -->
            <div class="col-md-8">
                <h1 class="book-title"><%=book.getBook_name()%></h1>
                
                <div class="meta-info">
                    저자: <%=book.getPerson_name()%> | 출판사: <%=book.getPublisher()%> | 출판일: <%=book.getDate()%> | 카테고리: <%=book.getCategory()%>
                </div>
                
                <div class="rating-stars mb-3">
                    <%
                        float rating = book.getRating();
                        for(int i = 1; i <= 10; i++) {
                            if(i <= rating) {
                                out.print("<i class='fas fa-star'></i>");
                            } else if(i - rating < 1) {
                                out.print("<i class='fas fa-star-half-alt'></i>");
                            } else {
                                out.print("<i class='far fa-star'></i>");
                            }
                        }
                    %>
                    <span class="ms-2"><%=rating%>/10</span>
                </div>
                
                <div class="price-info">
                    <div class="original-price">정가: <%=String.format("%,d", book.getPrice())%>원</div>
                    <div class="d-flex align-items-center gap-2">
                        <span class="discount-rate">10%</span>
                        <span class="discount-price"><%=String.format("%,d", (int)(book.getPrice() * 0.9))%>원</span>
                    </div>
                    <div class="point-info mt-2">
                        <i class="fas fa-coins"></i> <%=String.format("%,d", (int)(book.getPrice() * 0.05))%>원 적립
                    </div>
                </div>
                
                <div class="action-buttons">
                    <button class="btn btn-lg btn-buy">
                        <i class="fas fa-book"></i> 대출
                    </button>
                    <button class="btn btn-lg btn-cart">
                        <i class="fas fa-shopping-cart"></i> 장바구니
                    </button>
                    <button class="btn btn-lg btn-wishlist">
                         <i class="fas fa-calendar-check"></i> 대출 예약
                    </button>
                </div>
                
                <div class="book-details">
                    <h3 class="detail-header">책 소개</h3>
                    <div class="detail-content">
                        <%=book.getDescription()%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // 장바구니 버튼 클릭 이벤트
        document.querySelector('.btn-cart').addEventListener('click', function() {
            alert('장바구니에 추가되었습니다.');
        });
        
        // 찜하기 버튼 클릭 이벤트
        document.querySelector('.btn-wishlist').addEventListener('click', function() {
            alert('찜 목록에 추가되었습니다.');
        });
        
        // 바로구매 버튼 클릭 이벤트
        document.querySelector('.btn-buy').addEventListener('click', function() {
            location.href = '<%=request.getContextPath()%>/order/orderForm.jsp?cnt=' + <%=bookCnt%>;
        });
    </script>
</body>
</html>
