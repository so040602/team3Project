<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		/* Tag 스타일 : 특정 태그에 스타일을 입히는 기법 */
		label{font-size: 25px;}
		
		/* id 선택자는 sharp 기호를 사용합니다. */
		#age{color:red; font-size: 40px;}
		#hobby{color:blue; font-size: 50px;}
		
		/* class 선택자는 dot(.) 기호를 사용합니다. */
		.mytarget{color:yellow; font-size: 40px; background-color: black;}
		.yourtarget{color:red; background-color: blue;}
		
		/* 콤마 기호는 2개 이상의 요소를 찾을 때 사용합니다. */
		#age, #hobby{background-color: red; color:green;}
		
		/* 스페이스 기호는 특정 요소의 하위 요소를 찾을 때 사용합니다. */
		#myform #age{background-color: yellow; color:blue;}
		
		/* 라벨 요소 중에서 id가 hobby인 요소를 찾을 때 사용합니다. */
		label#hobby{background-color: green; color:blcak;}
		
		
		/* 라벨 요소 중에서 class가 mytarget인 요소를 찾을 때 사용합니다. */
		label.mytarget{background-color: orange; color:blcak; font-size: 10px;}
		
		
	</style>
</head>
<body>
	<!-- 여기는 html 주석입니다. -->
	<!-- h1~h6 태그는 글 제목을 작성할 때 사용하는 태그입니다. -->
	<h1>폼 양식</h1>
	<!-- action 속성에 명시된 페이지로 폼 양식을 제출합니다. -->
	<form id="myform" action="htmlTest01To.jsp">
		<!-- 인라인 스타일 방식은 태그 내에서 style 속성으로 지정하는 방식입니다. -->
		<label style="color: blue; font-size: 30px;">이름 :</label>
		<input type="text" name="name">
		<br/><!-- br 태그는 엔터키 효과 -->
		
		<!-- id 속성의 값은 문서내에서 유일(unique)해야 합니다. -->
		<label id="age">나이 :</label>	
		
		<input type="text" name="age">
		
		<br/>
		<label class="mytarget">이미지 :</label>
		<input type="file" name="image"> 
		<br/> 
		<label>숨김 파라미터 :</label>
		<input type="hidden" name="money" value="120000"> 
		<br/>	
		<label class="mytarget">성별 :</label>
		<!-- 라디오 버튼의 name 속성은 그룹을 묶어 주는 역할을 합니다. -->
		<input type="radio" name="gender" value="1" checked="checked">남자 
		<input type="radio" name="gender" value="2">여자
		<br/>
		<label id="hobby">취미 :</label>
		<input type="checkbox" name="hobby" value="당구">당구 
		<input type="checkbox" name="hobby" value="축구" checked="checked">축구
		<input type="checkbox" name="hobby" value="야구" checked="checked">야구
		<input type="checkbox" name="hobby" value="농구">농구		
		<br/>
		<label class="yourtarget">직업 :</label>
		<select name="job"> 
			<option value="-">-- 선택해 주세요
			<option value="의사">의사 
			<option value="판사" selected="selected">판사
			<option value="변호사">변호사
			<option value="검사">검사
		</select>
		<br/>
		<!-- class 속성은 동시에 2개 이상의 속성 값을 가질 수 있습니다. -->
		<label class="mytarget yourtarget">코멘트 :</label>
		<textarea name="comment" rows="10" cols="50"></textarea>
		<br/><br/><br/> 
		<input type="submit" value="전송">
		<!-- entity : 특수 문자나 whiteCharacter 등을 표현하기 위한 문법 -->
		<!-- &로 시작하고 ;으로 끝이 납니다. -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<br/>
		1 &euro;는 약 1,400원입니다.
		
		
		<input type="reset" value="초기화">
	</form>
</body>
</html>








