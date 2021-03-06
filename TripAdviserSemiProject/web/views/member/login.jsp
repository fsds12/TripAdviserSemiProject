<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<% 
	Cookie[] cookies=request.getCookies();
	
	String saveId=null;
	
	if(cookies!=null){
		for(Cookie c : cookies){
			String key=c.getName();
			String value=c.getValue();
			
			if(key.equals("saveId")){
				saveId=value;
				break;
			}
			
		}
	}
	%>
<!DOCTYPE html>
<html>

        <%@ include file="/views/common/header.jsp" %>
       
        
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

    <style>
        :root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background: lightgray;
  /* background: linear-gradient(to right, #0062E6, #33AEFF); */
}

div#wcw-login-container .card-signin {
  border: 0;
  
  box-shadow: 0 1rem 2rem 0 rgba(0, 0, 0, 0.2);
}

div#wcw-login-container .card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

div#wcw-login-container .card-signin .card-body {
  padding: 2rem;
}

div#wcw-login-container .form-signin {
  width: 100%;
}

div#wcw-login-container .form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

div#wcw-login-container .form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

div#wcw-login-container .form-label-group input {
  height: auto;
  border-radius: 2rem;
}

div#wcw-login-container .form-label-group>input,
div#wcw-login-container .form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

div#wcw-login-container .form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

div#wcw-login-container .form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

div#wcw-login-container .form-label-group input:-ms-input-placeholder {
  color: transparent;
}

div#wcw-login-container .form-label-group input::-ms-input-placeholder {
  color: transparent;
}

div#wcw-login-container .form-label-group input::-moz-placeholder {
  color: transparent;
}

div#wcw-login-container .form-label-group input::placeholder {
  color: transparent;
}

div#wcw-login-container .form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

div#wcw-login-container .form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

div#wcw-login-container .btn-naver {
  color: white;
  background-color: rgb(0, 199, 60);
}
div#wcw-login-container .btn-naver:hover{
color:black;
}

div#wcw-login-container .btn-kakao {
  
  background-color: rgb(255,244,20);
}
div#wcw-login-container .btn-kakao:hover{
    color: white;
}
div.container div.row #login:hover{
color: black;
}
div.container div.row div#checkboxdiv{
    text-align: right;
}
div#wcw-login-container a#idpwsearchpage{
color: black;
margin-left:15px;
font-size: 14px;
}

div#wcw-login-container a#signuppage{
color:black;
margin-left: 100px;
font-size: 14px;
}


</style>
</head>

<body>
 
 
 
    <div id="wcw-login-container" class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">로그인</h5>
                        <form action="<%=request.getContextPath() %>/login" class="form-signin" method="POST">
                            <div class="form-label-group">
                                <input type="text" id="inputEmail" name="inputEmail" class="form-control" placeholder="아이디" value="<%=saveId!=null?saveId:""%>" required
                                    autofocus>
                                <label for="inputEmail">아이디</label>
                            </div>

                            <div class="form-label-group">
                                <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="비밀번호"
                                    required>
                                <label for="inputPassword">비밀번호</label>
                            </div>

                            <div class="custom-control custom-checkbox mb-3" id="checkboxdiv">
                                <input type="checkbox" class="custom-control-input" name="customCheck1" id="customCheck1" <%=saveId!=null?"checked":"" %>>
                                <label class="custom-control-label" for="customCheck1">아이디 저장</label>
                            </div>
                            <button class="btn btn-lg btn-primary btn-block text-uppercase" id="login" type="submit">로그인</button>
                            <br>
                            
                            <hr class="my-4">
                            <a href="<%=request.getContextPath()%>/idpwsearchpage" id="idpwsearchpage">아이디 비밀번호 찾기</a> <a href="<%=request.getContextPath()%>/enrollpage" id="signuppage">회원가입</a>
                        </form>
                    </div>
                    <img src="<%=request.getContextPath() %>/images/Symbol_logo_t.png" width="50px" height="50px" />
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/views/common/footer.jsp" %>