<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

    <script type="text/javascript">
        $(document).ready(function() {
            // Initialize tooltips
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            
            // Apply Tooltip function to each element
            var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        });
        
        function validCheck() { /* form validation check */
            var memname = $('#memname').val(); // Corrected variable name
            if (memname.length < 2 || memname.length > 5) {
                alert('성명은 2글자 이상 5글자 이하로 입력해 주세요.');
                $('#memname').focus(); 
                return false; /* 이벤트 전파 방지 */
            }
            return true;
        }
    </script>
    
    <script>
		function setThumbnail(event) {
	    	var uploadWrap = event.target.parentNode; 
	        //이벤트 대상자의 부모
	        var reader = new FileReader();
	 
	        reader.onload = function(event) {
	        	console.log(uploadWrap);
	            var newImg = document.createElement("img");
	            uploadWrap.appendChild(newImg);
	            newImg.setAttribute("src", event.target.result);
	            newImg.setAttribute("width", "100%");
	            newImg.setAttribute("class", "previewImg");
	        }; 
	        reader.readAsDataURL(event.target.files[0]);
			document.getElementById("btnAuth").focus();
	    }
	</script>
	
    <style type="text/css">
        /* 하단의 버튼과 입력 양식 간의 간격 띄우기 */
        .bottomBtnGroup {
            margin-top: 30px;
        }
        .bottomBtnGroup button {
            width: 100px;
        }
        .inputTitle {
            width: 100px;
            text-align: center;
            display: block;
        }
    </style>

	<style>
	    .auth-box {
	        width: 600px;
	        margin: 0 auto; /* 가운데 정렬 */
	        border: 1px solid #cdcdcd;
	        padding: 30px;
	        margin-top: 50px;
	    }
	    .input-group-text {
	    	width: 120px;
	    }
	</style>

<div class="container mt-3">
    <div class="auth-box">
        <h3 class="text-center" style="margin-bottom: 20px;">회원 가입 사용자 인증</h3>
        <form action="<%= postForm %>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="opsmode" value="userCardParse">
            
            <div class="input-group mb-3">
                <span class="input-group-text col-1 d-flex justify-content-center align-items-center">성명</span>
                <input type="text" class="form-control" id="userName" 
                    placeholder="성명을 입력해 주세요." name="userName"
                    data-bs-toggle="tooltip" data-bs-placement="bottom"
                    title="성명을 입력해 주세요">
            </div>

            <div class="input-group mb-3">
                <span class="input-group-text col-1 d-flex justify-content-center align-items-center">신분증 첨부</span> 
          		<input id="idCardFile" name="idCardFile" type="file" class="form-control" onchange="setThumbnail(event)">
            </div>

            <div class="input-group uploadWrap"></div>
        
            <div class="input-group mb-3">
                <span class="input-group-text col-1 d-flex justify-content-center align-items-center">신분증 종류</span>
                <div class="d-flex align-items-center col" style="padding-left:10px; border:1px solid #dedede;">
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="cardType" id="cardType" value="residentCard" checked>
                        <label class="form-check-label" for="recard">
                            주민등록증
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="cardType" id="driverLicence" value="driverLicence">
                        <label class="form-check-label" for="drcard">
                            운전면허증
                        </label>
                    </div>
                </div>
            </div>
        
            <div class="bottomBtnGroup text-center"> 
                <button type="submit" class="btn btn-primary" id="btnAuth" onclick="return validCheck();">본인 인증</button>
                <button type="button" class="btn btn-info" onclick="location.assign('index.jsp');">메인으로</button>
            </div>			
        </form>
    </div>
</div>


</html>
