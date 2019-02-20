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
section#wcw-enroll-container{
    width: 100%;
}
article{
    margin-left: auto;
    margin-right: auto;  
      
}
section#wcw-enroll-container .card-signin {
  border: 0;
  box-shadow: 0 1rem 2rem 0 rgba(0, 0, 0, 0.2);
  width: 559px;
  margin: auto;
  
}

section#wcw-enroll-container .card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

section#wcw-enroll-container .card-signin .card-body {
  padding: 2rem;
  margin: auto;
  /* margin: auto; */
}

section#wcw-enroll-container .form-signin {
    margin: auto;
}



section#wcw-enroll-container .form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

section#wcw-enroll-container .form-label-group input {
  height: auto;
  border-radius: 2rem;
}

section#wcw-enroll-container .form-label-group>input,
section#wcw-enroll-container .form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

section#wcw-enroll-container .form-label-group>label {
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

section#wcw-enroll-container .form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

section#wcw-enroll-container .form-label-group input:-ms-input-placeholder {
  color: transparent;
}

section#wcw-enroll-container .form-label-group input::-ms-input-placeholder {
  color: transparent;
}

section#wcw-enroll-container .form-label-group input::-moz-placeholder {
  color: transparent;
}

section#wcw-enroll-container .form-label-group input::placeholder {
  color: transparent;
}

section#wcw-enroll-container .form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

section#wcw-enroll-container .form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

section#wcw-enroll-container .btn{
    display: inline-block;
    margin-left: 11px;
}
section#wcw-enroll-container input[type="text"],section#wcw-enroll-container input[type="password"],section#wcw-enroll-container input[type="email"]{
        width: 350px;
        height: 51px;
        display: inline-block;
    }

    section#wcw-enroll-container div#enrollreset input{
        outline: 0;
    padding: 5px 12px;
    color: #9fa8b0;
    font-weight: bold;
    text-shadow: 1px 1px #1f272b;
    border: 1px solid #1c252b;
    border-radius: 3px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    background: #232B30; /* old browsers */
    background: -moz-linear-gradient(top, #3D4850 3%, #313d45 4%, #232B30 100%); /* firefox */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#3D4850), color-stop(4%,#313d45), color-stop(100%,#232B30)); /* webkit */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3D4850', endColorstr='#232B30',GradientType=0 ); /* ie */
    box-shadow: 1px 1px 1px rgba(0,0,0,0.2); /* CSS3 */
    -moz-box-shadow: 1px 1px 1px rgba(0,0,0,0.2); /* Firefox */
    -webkit-box-shadow: 1px 1px 1px rgba(0,0,0,0.2); /* Safari, Chrome */
    }
    section#wcw-enroll-container #signup:hover, section#wcw-enroll-container #reset:hover{
        color: #fff;
    background: #4C5A64; /* old browsers */
    background: -moz-linear-gradient(top, #4C5A64 3%, #404F5A 4%, #2E3940 100%); /* firefox */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#4C5A64), color-stop(4%,#404F5A), color-stop(100%,#2E3940)); /* webkit */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4C5A64', endColorstr='#2E3940',GradientType=0 ); /* ie */
    }
    section#wcw-enroll-container div#enrollreset #signup:active, section#wcw-enroll-container div#enrollreset #reset:active{
        background-position: 0 top;
    position: relative;
    top: 1px;
    color: #fff;
    padding: 6px 12px 4px;
    background: #20282D; /* old browsers */
    background: -moz-linear-gradient(top, #20282D 3%, #252E34 51%, #222A30 100%); /* firefox */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#20282D), color-stop(51%,#252E34), color-stop(100%,#222A30)); /* webkit */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#20282D', endColorstr='#222A30',GradientType=0 ); /* ie */
    -moz-box-shadow: 1px 1px 1px rgba(255,255,255,0.1); /* Firefox */
    -webkit-box-shadow: 1px 1px 1px rgba(255,255,255,0.1); /* Safari, Chrome */
    box-shadow: 1px 1px 1px rgba(255,255,255,0.1); /* CSS3 */
    }
</style>
</head>

<body>
    <section id="wcw-enroll-container">
        <article id="enroll-article">
        <div class="container">
            <div class="row">
                <div class="mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <h5 class="card-title text-center">회원가입</h5>
                            <form action="<%=request.getContextPath() %>/login" class="form-signin" method="POST">
                                <div class="form-label-group">
                                    <input type="text" id="inputEmail" name="inputEmail" class="form-control"
                                        placeholder="아이디" required autofocus>
                                    <label for="inputEmail"> 아이디</label>
                                    <button class="btn btn-secondary">중복확인</button>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" id="inputPassword" name="inputPassword" class="form-control"
                                        placeholder="비밀번호" required>
                                    <label for="inputPassword">비밀번호</label>
                                </div>
                                <div class="form-label-group">
                                    <input type="password" id="password_confirm" name="password_confirm" class="form-control"
                                        placeholder="비밀번호" required>
                                    <label for="password_confirm">비밀번호 확인</label>
                                </div>
                                <div class="form-label-group">
                                    <input type="email" id="email" name="email" class="form-control" placeholder="이메일"
                                        required>
                                    <label for="email">이메일</label>
                                    <button class="btn btn-secondary">인증번호보내기</button>
                                </div>
                                <div class="form-label-group">
                                    <input type="text" id="cknumber" name="cknumber" class="form-control" placeholder="비밀번호"
                                        required>
                                    <label for="cknumber">인증번호</label>
                                    <button class="btn btn-secondary">인증번호확인</button>
                                </div>
                                <div class="form-label-group">
                                    <input type="text" id="username" name="username" class="form-control" placeholder="비밀번호"
                                        required>
                                    <label for="username">이름</label>
                                </div>
                                <div class="form-label-group">
                                    <input type="text" id="address" name="address" class="form-control" placeholder="비밀번호"
                                        required>
                                    <label for="address">우편번호</label>
                                    <button class="btn btn-secondary">우편번호검색</button>
                                </div>
                                <div class="form-label-group">
                                    <input type="text" id="address2" name="address2" class="form-control" placeholder="비밀번호"
                                        required>
                                    <label for="address2">상세주소</label>
                                </div>

                                <div class="control-group">
                                        <!-- Button -->
                                        <div class="controls" id="enrollreset">
                                            <input type="submit" id="signup" value="회원가입" class="btn btn-success"/>
                                            <input type="reset" id="reset" value="취소" class="btn btn-success"/>    
                                                                                                 
                                        </div>
                                    </div>


                            </form>
                        </div>
                        <img src="<%=request.getContextPath() %>/images/Symbol_logo_t.png" width="50px" height="50px" />
                    </div>
                </div>
            </div>
        </div>
    </article>
    </section>
    <%@ include file="/views/common/footer.jsp" %>