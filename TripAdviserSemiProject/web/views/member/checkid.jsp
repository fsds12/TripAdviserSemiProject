<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	boolean isAble = (boolean) request.getAttribute("isAble");
	String userId = (String) request.getAttribute("userId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<style>
section#idduplicate-container {
	width: 100%;
}

section#idduplicate-container article#id-article {
	width: 650px;
	margin: auto;
}

section#idduplicate-container .form-label-group {
	position: relative;
	margin-bottom: 1rem;
}

section#idduplicate-container .form-label-group input {
	height: auto;
	border-radius: 2rem;
}

section#idduplicate-container .form-label-group>input, section#wcw-enroll-container .form-label-group>label
	{
	padding: var(- -input-padding-y) var(- -input-padding-x);
}

section#idduplicate-container .form-label-group>label {
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	width: 355px;
	margin-bottom: 0;
	/* Override default `<label>` margin */
	line-height: 1.5;
	color: #495057;
	border: 1px solid transparent;
	border-radius: .25rem;
	transition: all .1s ease-in-out;
}

section#idduplicate-container .form-label-group input::-webkit-input-placeholder
	{
	color: transparent;
}

section#idduplicate-container .form-label-group input:-ms-input-placeholder
	{
	color: transparent;
}

section#idduplicate-container .form-label-group input::-ms-input-placeholder
	{
	color: transparent;
}

section#idduplicate-container .form-label-group input::-moz-placeholder
	{
	color: transparent;
}

section#idduplicate-container .form-label-group input::placeholder {
	color: transparent;
}

section#idduplicate-container .form-label-group input:not (:placeholder-shown
	) {
	padding-top: calc(var(- -input-padding-y)+ var(- -input-padding-y)* (2/3));
	padding-bottom: calc(var(- -input-padding-y)/3);
}

section#idduplicate-container .form-label-group input:not (:placeholder-shown
	)~label {
	padding-top: calc(var(- -input-padding-y)/3);
	padding-bottom: calc(var(- -input-padding-y)/3);
	font-size: 7px;
	color: #777;
}

section#idduplicate-container input[type=text] {
	width: 300px;
	height: 30px;
}
</style>
<title>아이디 입력</title>
</head>
<body>
	<section id="idduplicate-container">
		<article id="id-article">
			<div id="id-div">
				<%
					if (isAble) {
				%>
				<span id="trueAble"><%=userId%></span>는 사용 가능합니다. <br>
				<br>
				<button type="button" onclick="close1()">창닫기</button>
				<%
					} else {
				%>
				<span id="falseAble"><%=userId%></span>는 사용 불가능합니다. <br>
				<br>
				<form action="<%=request.getContextPath()%>/check/id" method="post"
					onsubmit="return validate();">
					<div class="form-label-group">
						<input type="text" id="inputId" name="hiddenid"
							class="form-control" placeholder="아이디" required> <label
							for="inputId">아이디</label>
							<input type="submit" value="재검색"/>
					</div>
				</form>

				<%
					}
				%>
			</div>
			<script>
			function close1(){
				var frm=opener.document.enrollformm;
				console.log(frm);
				frm.inputEmail.value='<%=userId%>';
				frm.inputPassword.focus();
			
				self.close();
				
			}
			function validate(){
				
				var userId=document.getElementById('inputId').value;
				if(!userId||userId.trim().length<4){
					alert("아이디를 4글자 이상 입력해주세요");
					return false;
				}else{
					return true;
				}
				
			}
			
			</script>

		</article>

	</section>
</body>
</html>