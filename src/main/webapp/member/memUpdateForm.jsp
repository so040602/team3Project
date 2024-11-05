<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<script type="text/javascript">
    $(document).ready(function() {
        $('#birth').datepicker();
        $('input[value="${requestScope.bean.gender}"]').attr('checked', true);
    });
</script>
<style type="text/css">
:root {
    --primary-color: #03c75a;
    --primary-hover: #02b351;
    --background-color: #f5f6f7;
    --text-primary: #333;
    --text-secondary: #666;
    --border-color: #e5e5e5;
    --error-color: #ff3e3e;
    --card-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

body {
    background-color: var(--background-color);
    color: var(--text-primary);
    font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
    margin: 0;
    line-height: 1.6;
}

.container {
    max-width: 780px;
    margin: 2rem auto;
    padding: 2rem;
}

.card {
    background: white;
    border-radius: 12px;
    box-shadow: var(--card-shadow);
    padding: 2rem;
}

.page-title {
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--text-primary);
    margin: 0 0 0.5rem 0;
}

.page-description {
    color: var(--text-secondary);
    margin: 0 0 2rem 0;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-label {
    display: block;
    font-size: 0.875rem;
    font-weight: 500;
    color: var(--text-primary);
    margin-bottom: 0.5rem;
}

.form-control {
    width: 100%;
    padding: 0.75rem 1rem;
    font-size: 1rem;
    border: 1px solid var(--border-color);
    border-radius: 6px;
    background-color: white;
    transition: border-color 0.2s;
}

.form-control:focus {
    outline: none;
    border-color: var(--primary-color);
}

.form-control:disabled {
    background-color: var(--background-color);
    cursor: not-allowed;
}

.radio-group {
    display: flex;
    gap: 1rem;
    padding: 0.5rem 0;
}

.radio-label {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
}

.radio-input {
    width: 1.25rem;
    height: 1.25rem;
    accent-color: var(--primary-color);
}

.button-group {
    display: flex;
    gap: 1rem;
    margin-top: 2rem;
}

.btn {
    padding: 0.875rem 1.5rem;
    font-size: 1rem;
    font-weight: 500;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.2s;
    border: none;
}

.btn-primary {
    background-color: var(--primary-color);
    color: white;
}

.btn-primary:hover {
    background-color: var(--primary-hover);
}

.btn-secondary {
    background-color: white;
    color: var(--text-primary);
    border: 1px solid var(--border-color);
}

.btn-secondary:hover {
    background-color: var(--background-color);
}

@media (max-width: 768px) {
    .container {
        padding: 1rem;
        margin: 1rem;
    }
    
    .card {
        padding: 1.5rem;
    }
    
    .button-group {
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
        <div class="card">
            <h2 class="page-title">회원정보 수정</h2>
            <p class="page-description">회원님의 정보를 안전하게 수정하실 수 있습니다.</p>
            
            <form action="<%=postForm%>" method="post">
                <input type="hidden" name="opsmode" value="memUpdate">
                <input type="hidden" id="memid" name="memid" value="${requestScope.bean.memid}">
                
                <div class="form-group">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-control" disabled value="${requestScope.bean.memid}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">이름</label>
                    <input type="text" class="form-control" id="memname" name="memname" value="${requestScope.bean.memname}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="mempwd" name="mempwd">
                </div>
                
                <div class="form-group">
                    <label class="form-label">성별</label>
                    <div class="radio-group">
                        <label class="radio-label">
                            <input type="radio" class="radio-input" name="gender" value="남자" id="gender1">
                            <span>남자</span>
                        </label>
                        <label class="radio-label">
                            <input type="radio" class="radio-input" name="gender" value="여자" id="gender2">
                            <span>여자</span>
                        </label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="form-label">생년월일</label>
                    <input type="datetime" class="form-control" id="birth" name="birth" value="${requestScope.bean.birth}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">휴대전화</label>
                    <input type="text" class="form-control" id="mobile" name="mobile" value="${requestScope.bean.mobile}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">이메일</label>
                    <input type="email" class="form-control" id="email" name="email" value="${requestScope.bean.email}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">주소</label>
                    <input type="text" class="form-control" id="addr01" name="addr01" value="${requestScope.bean.addr01}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">상세주소</label>
                    <input type="text" class="form-control" id="addr02" name="addr02" value="${requestScope.bean.addr02}">
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="reset" class="btn btn-secondary">초기화</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>