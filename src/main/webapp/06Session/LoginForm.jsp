<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Session</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	</head>
	<body>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<jsp:include page="../Common/Link.jsp"/>	
		<h2>로그인 페이지</h2>
		<span style="color: red; font-size:1.2em;">
			<%= request.getAttribute("LoginErrMsg")==null ? "" : request.getAttribute("LoginErrMsg") %>
		</span>
		<%
		if(session.getAttribute("UserId") == null) {
		%>
		<script>
		function validateForm(form) {
			if(!form.user_id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if(form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
		</script>
		<form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
			아이디 : <input type="text" name="user_id"/><br>
			패스워드 : <input type="password" name="user_pw"/><br>
			<button type="button" class="btn btn-primary">로그인</button>
		</form>
		<%
		}else{
		%>
		<%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다!<br>
		<a href="Logout.jsp">[로그아웃]</a>
		<%
		}
		%>
	</body>
</html>