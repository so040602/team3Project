<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인</title>
    
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
        
        .btn-info {
            background-color: #17a2b8;
            border: none;
            color: white;
        }
        
        .btn-info:hover {
            background-color: #138496;
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
            
            #buttonset {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function(){
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl)
            })
        });

        function validCheck(){
            var memid = $('#memid').val();
            if(memid.length < 5 || memid.length > 12){
                alert('아이디는 5글자 이상 12글자 이하로 입력해 주세요.');
                $('#memid').focus();
                return false;
            }

            var mempwd = $('#mempwd').val();
            if(mempwd.length < 5 || mempwd.length > 12){
                alert('비밀번호는 5자리 이상 12자리 이하로 입력해 주세요.');
                $('#mempwd').focus();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2 class="page-title">로그인</h2>
        <p class="sub-title">회원 로그인을 위한 페이지입니다.</p>
        
        <form action="<%=postForm%>" method="post">
            <input type="hidden" name="opsmode" value="memLogin">
            
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fas fa-user me-2"></i>아이디
                </span>
                <input type="text" class="form-control" id="memid" name="memid" 
                    placeholder="아이디를 입력해 주세요"
                    data-bs-toggle="tooltip" data-bs-placement="bottom"
                    title="아이디는 5글자 이상 12글자 이하로 입력해 주세요.">
            </div>
            
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fas fa-lock me-2"></i>비밀번호
                </span>
                <input type="password" class="form-control" id="mempwd" name="mempwd" 
                    placeholder="비밀번호를 입력해 주세요"
                    data-bs-toggle="tooltip" data-bs-placement="bottom"
                    title="비밀번호는 5글자 이상 12글자 이하로 입력해 주세요.">
            </div>
            
            <div id="buttonset">
                <button type="submit" class="btn btn-primary" onclick="return validCheck();">
                    <i class="fas fa-sign-in-alt me-2"></i>로그인
                </button>
                <button type="button" class="btn btn-info" onclick="location.assign('<%=getEnvs%>memInsert');">
                    <i class="fas fa-user-plus me-2"></i>회원가입
                </button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>