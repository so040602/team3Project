<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원 가입 사용자 인증</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <script type="text/javascript">
        $(document).ready(function() {
            // Initialize tooltips
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        });
        
        function validCheck() {
            var userName = $('#userName').val();
            if (userName.length < 2 || userName.length > 5) {
                alert('성명은 2글자 이상 5글자 이하로 입력해 주세요.');
                $('#userName').focus(); 
                return false;
            }
            
            var fileInput = $('#idCardFile');
            if (fileInput.get(0).files.length === 0) {
                alert('신분증 이미지를 첨부해 주세요.');
                return false;
            }
            
            return true;
        }
        
        function setThumbnail(event) {
            var uploadWrap = event.target.parentNode;
            var oldImg = uploadWrap.querySelector('.previewImg');
            if (oldImg) {
                oldImg.remove();
            }
            
            var reader = new FileReader();
            reader.onload = function(event) {
                var previewContainer = document.createElement("div");
                previewContainer.className = "preview-container";
                
                var newImg = document.createElement("img");
                newImg.setAttribute("src", event.target.result);
                newImg.setAttribute("class", "previewImg");
                
                previewContainer.appendChild(newImg);
                document.querySelector('.uploadWrap').appendChild(previewContainer);
            }; 
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
    
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Noto Sans KR', sans-serif;
            color: #333;
        }
        
        .container {
            margin-top: 50px;
            margin-bottom: 50px;
        }
        
        .auth-box {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            padding: 40px;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .page-title {
            color: #333;
            font-size: 1.8rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #eee;
        }
        
        .input-group {
            margin-bottom: 20px;
            border-radius: 10px;
            overflow: hidden;
        }
        
        .input-group-text {
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            color: #495057;
            font-weight: 500;
            min-width: 120px;
            justify-content: center;
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
            border: 1px solid #ddd;
            border-radius: 0 5px 5px 0;
            background-color: white;
        }
        
        .form-check {
            margin: 0 15px;
        }
        
        .form-check-input:checked {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }
        
        .preview-container {
            width: 100%;
            margin-bottom: 20px;
            padding: 10px;
            background: #f8f9fa;
            border-radius: 10px;
            text-align: center;
        }
        
        .previewImg {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .bottomBtnGroup {
            margin-top: 30px;
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        
        .btn {
            padding: 12px 25px;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s ease;
            min-width: 120px;
        }
        
        .btn-primary {
            background-color: #0d6efd;
            border: none;
        }
        
        .btn-primary:hover {
            background-color: #0b5ed7;
            transform: translateY(-2px);
        }
        
        .btn-info {
            background-color: #6c757d;
            border: none;
            color: white;
        }
        
        .btn-info:hover {
            background-color: #5c636a;
            color: white;
            transform: translateY(-2px);
        }
        
        /* Error styles */
        .is-invalid {
            border-color: #dc3545;
        }
        
        .invalid-feedback {
            display: none;
            color: #dc3545;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
        
        /* 반응형 스타일 */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
            
            .auth-box {
                padding: 20px;
                margin: 10px;
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
                border-radius: 0 0 8px 8px;
                flex-direction: column;
                align-items: flex-start !important;
            }
            
            .form-check {
                margin: 5px 15px;
            }
            
            .bottomBtnGroup {
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
        <div class="auth-box">
            <h2 class="page-title">회원 가입 사용자 인증</h2>
            
            <form action="<%= postForm %>" method="post" enctype="multipart/form-data">
                <input type="hidden" name="opsmode" value="userCardParse">
                
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-user me-2"></i>성명
                    </span>
                    <input type="text" class="form-control" id="userName" 
                        placeholder="성명을 입력해 주세요" name="userName"
                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                        title="성명을 입력해 주세요">
                </div>

                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-id-card me-2"></i>신분증 첨부
                    </span>
                    <input id="idCardFile" name="idCardFile" type="file" 
                        class="form-control" onchange="setThumbnail(event)"
                        accept="image/*">
                </div>

                <div class="uploadWrap"></div>

                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-address-card me-2"></i>신분증 종류
                    </span>
                    <div class="radio-group d-flex align-items-center flex-grow-1">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="cardType" 
                                id="cardType" value="residentCard" checked>
                            <label class="form-check-label" for="recard">
                                주민등록증
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="cardType" 
                                id="driverLicence" value="driverLicence">
                            <label class="form-check-label" for="drcard">
                                운전면허증
                            </label>
                        </div>
                    </div>
                </div>

                <div class="bottomBtnGroup">
                    <button type="submit" class="btn btn-primary" id="btnAuth" 
                        onclick="return validCheck();">
                        <i class="fas fa-user-check me-2"></i>본인 인증
                    </button>
                    <button type="button" class="btn btn-info" 
                        onclick="location.assign('index.jsp');">
                        <i class="fas fa-home me-2"></i>메인으로
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>