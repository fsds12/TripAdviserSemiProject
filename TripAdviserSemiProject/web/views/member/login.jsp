<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.card-signin {
  border: 0;
  
  box-shadow: 0 1rem 2rem 0 rgba(0, 0, 0, 0.2);
}

.card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin .card-body {
  padding: 2rem;
}

.form-signin {
  width: 100%;
}

.form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input {
  height: auto;
  border-radius: 2rem;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

.form-label-group>label {
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

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

.btn-naver {
  color: white;
  background-color: rgb(0, 199, 60);
}

.btn-kakao {
  
  background-color: rgb(255,244,20);
}
.btn-kakao:hover{
    color: white;
}
div.container div.row #login:hover{
color: black;
}
div.container div.row div#checkboxdiv{
    text-align: right;
}
</style>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">로그인</h5>
                        <form class="form-signin">
                            <div class="form-label-group">
                                <input type="text" id="inputEmail" class="form-control" placeholder="아이디" required
                                    autofocus>
                                <label for="inputEmail"> 아이디</label>
                            </div>

                            <div class="form-label-group">
                                <input type="password" id="inputPassword" class="form-control" placeholder="비밀번호"
                                    required>
                                <label for="inputPassword">비밀번호</label>
                            </div>

                            <div class="custom-control custom-checkbox mb-3" id="checkboxdiv">
                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">아이디 저장</label>
                            </div>
                            <button class="btn btn-lg btn-primary btn-block text-uppercase" id="login" type="submit">로그인</button>
                            <hr class="my-4">
                            <button class="btn btn-lg btn-naver btn-block text-uppercase" type="submit"><img src="<%=request.getContextPath()%>/images/naver.png"
                                    width="20px" height="20px" /> 네이버 아이디로 로그인</button>
                            <button class="btn btn-lg btn-kakao btn-block text-uppercase" type="submit"><img src="<%=request.getContextPath()%>/images/kakao.png"
                                    width="20px" height="20px" /> 카카오 계정으로 로그인</button>
                        </form>
                    </div>
                    <img src="<%=request.getContextPath() %>/images/Symbol_logo_t.png" width="50px" height="50px" />
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/views/common/footer.jsp" %>