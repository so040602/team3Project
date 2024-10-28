<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원 가입</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        .container {
            max-width: 800px;
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-top: 50px;
            margin-bottom: 50px;
        }
        
        .page-title {
            color: #333;
            font-weight: bold;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #eee;
        }
        
        .sub-title {
            color: #666;
            font-size: 1.1rem;
            margin-bottom: 30px;
        }
        
        .input-group {
            margin-bottom: 20px;
            border-radius: 10px;
            overflow: hidden;
        }
        
        .input-group-text {
            width: 120px;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            color: #495057;
            font-weight: 500;
        }
        
        .form-control {
            border: 1px solid #ddd;
            padding: 12px;
            font-size: 1rem;
        }
        
        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }
        
        .radio-group {
            padding: 10px 15px;
        }
        
        .radio_gender {
            margin-right: 20px;
            font-size: 1rem;
        }
        
        .radio-inline input[type="radio"] {
            margin-right: 5px;
        }
        
        #buttonset {
            margin-top: 30px;
            gap: 10px;
            display: flex;
            justify-content: center;
        }
        
        .btn {
            padding: 12px 30px;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        
        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        
        .btn-reset {
            background-color: #6c757d;
            border: none;
            color: white;
        }
        
        .btn-reset:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
        }
        
        /* 반응형 스타일 */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin-top: 20px;
            }
            
            .input-group {
                flex-direction: column;
            }
            
            .input-group-text {
                width: 100%;
                border-radius: 8px 8px 0 0;
                padding: 8px;
            }
            
            .form-control {
                border-radius: 0 0 8px 8px;
            }
            
            .radio-group {
                padding: 15px;
            }
            
            #buttonset {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="page-title">회원 가입</h2>
        <p class="sub-title">신규 회원이 가입하는 페이지입니다.</p>
        
        <form action="<%=postForm%>" method="post">
            <input type="hidden" name="opsmode" value="memInsert">
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-user me-2"></i>아이디</span>
                <input type="text" class="form-control" id="memid" name="memid" placeholder="4~12자 사이로 입력해주세요">
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-signature me-2"></i>이름</span>
                <input type="text" class="form-control" id="memname" name="memname" value="<%=request.getAttribute("parsedName")%>" placeholder="이름을 입력해주세요">
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-lock me-2"></i>비밀번호</span>
                <input type="password" class="form-control" id="mempwd" name="mempwd" placeholder="5~12자 사이로 입력해주세요">
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-venus-mars me-2"></i>성별</span>
                <div class="form-control radio-group">
                    <label class="radio-inline radio_gender">
                        <input type="radio" name="gender" id="gender1" value="남자" <%= "남자".equals(request.getAttribute("parsedGender")) ? "checked" : "" %>>
                        <i class="fas fa-male me-1"></i>남자
                    </label>
                    <label class="radio-inline radio_gender">
                        <input type="radio" name="gender" id="gender2" value="여자" <%= "여자".equals(request.getAttribute("parsedGender")) ? "checked" : "" %>>
                        <i class="fas fa-female me-1"></i>여자
                    </label>
                </div>
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-calendar me-2"></i>생일</span>
                <input type="datetime" class="form-control" id="birth" name="birth" value="<%=request.getAttribute("parsedBirth")%>">
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-mobile-alt me-2"></i>휴대폰</span>
                <input type="text" class="form-control" id="mobile" name="mobile" placeholder="휴대폰 번호를 입력해주세요">
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-envelope me-2"></i>이메일</span>
                <input type="email" class="form-control" id="email" name="email" placeholder="이메일 주소를 입력해주세요">
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-map-marker-alt me-2"></i>주소</span>
                <input type="text" class="form-control" id="addr01" name="addr01" value="<%=request.getAttribute("parsedAddr01")%>" placeholder="기본 주소를 입력해주세요">
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-home me-2"></i>상세주소</span>
                <input type="text" class="form-control" id="addr02" name="addr02" value="<%=request.getAttribute("parsedAddr02")%>" placeholder="상세 주소를 입력해주세요">
            </div>
            
            <div id="buttonset">
                <button type="submit" class="btn btn-primary" onclick="return validCheck();">
                    <i class="fas fa-user-plus me-2"></i>가입하기
                </button>
                <button type="reset" class="btn btn-reset">
                    <i class="fas fa-redo me-2"></i>초기화
                </button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>