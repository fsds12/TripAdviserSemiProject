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

section#idpwsearch-container .card-signin {
  border: 0;
  
  box-shadow: 0 1rem 2rem 0 rgba(0, 0, 0, 0.2);
}

section#idpwsearch-container .card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

section#idpwsearch-container .card-signin .card-body {
  padding: 2rem;
}

section#idpwsearch-container .form-signin {
  width: 351px;
}

section#idpwsearch-container .form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

section#idpwsearch-container .form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

section#idpwsearch-container .form-label-group input {
  height: auto;
  border-radius: 2rem;
}

section#idpwsearch-container .form-label-group>input,
section#idpwsearch-container .form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

section#idpwsearch-container .form-label-group>label {
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

section#idpwsearch-container .form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

section#idpwsearch-container .form-label-group input:-ms-input-placeholder {
  color: transparent;
}

section#idpwsearch-container .form-label-group input::-ms-input-placeholder {
  color: transparent;
}

section#idpwsearch-container .form-label-group input::-moz-placeholder {
  color: transparent;
}

section#idpwsearch-container .form-label-group input::placeholder {
  color: transparent;
}

section#idpwsearch-container .form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

section#idpwsearch-container .form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

section#idpwsearch-container article#allarti .blackbtn{
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
section#idpwsearch-container article#allarti .blackbtn:hover{
    color: #fff;
    background: #4C5A64; /* old browsers */
    background: -moz-linear-gradient(top, #4C5A64 3%, #404F5A 4%, #2E3940 100%); /* firefox */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#4C5A64), color-stop(4%,#404F5A), color-stop(100%,#2E3940)); /* webkit */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4C5A64', endColorstr='#2E3940',GradientType=0 ); /* ie */
}
section#idpwsearch-container article#allarti .blackbtn:active{
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
section#idpwsearch-container input[type=email]{
display: inline-block; 
}
section#idpwsearch-container input[type=email],section#idpwsearch-container input[type=text]{
width: 300px;
}

</style>
</head>

<body>
    <section id="idpwsearch-container">
        <article id="allarti">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                        <div class="card card-signin my-5">
                            <div class="card-body">
                                <h5 class="card-title text-center">아이디 찾기</h5>
                                <form action="<%=request.getContextPath() %>/idfind" class="form-signin" method="POST">
                                    <div class="form-label-group">
                                        <input type="text" id="name" name="name" class="form-control"
                                            placeholder="이름" required autofocus>
                                        <label for="name"> 이름</label>
                                    </div>

                                    <div class="form-label-group">
                                        <input type="text" id="phone" name="phone" class="form-control" placeholder="전화번호"
                                            required>
                                        <label for="phone">전화번호</label>
                                    </div>

                                    <div class="form-label-group">
                                        <input type="email" id="email" name="email" class="form-control" placeholder="이메일"
                                            required >
                                        <label for="email">이메일주소</label>
                                        
                                    </div>
                                    
                                    <div class="controlsbutton"> 
                                            <input id="idfind" type="submit" value="아이디찾기" class="blackbtn" />
                                            <input id="idreset" type="reset" value="취소" class="blackbtn" />
                                    </div>


                                </form>
                                
                                
                                <!-- <form name="idsearch-form" method="post">
                                	<input type="hidden" name="inputEmail"/>
                                	<input type="hidden" name="phone"/>
                                	<input type="hidden" name="email"/>
                                </form> -->
                            </div>
                            <div class="card-body">
                                <h5 class="card-title text-center">비밀번호 찾기</h5>
                                <form action="<%=request.getContextPath() %>/pwfind" class="form-signin" method="POST">
                                    <div class="form-label-group">
                                        <input type="text" id="inputEmail2" name="inputEmail2" class="form-control"
                                            placeholder="아이디" required autofocus>
                                        <label for="inputEmail2"> 아이디</label>
                                    </div>

                                    <div class="form-label-group">
                                        <input type="text" id="phone2" name="phone2" class="form-control" placeholder="전화번호"
                                            required>
                                        <label for="phone2">전화번호</label>
                                    </div>

                                    <div class="form-label-group">
                                        <input type="email" id="email2" name="email2" class="form-control" placeholder="이메일"
                                            required>
                                        <label for="email2">이메일주소</label>
                                    </div>
                                    
                                    <div class="controlsbutton"> 
                                            <input id="pwfind" type="submit" value="비밀번호찾기" class="blackbtn" />
                                            <input id="pwreset" type="reset" value="취소" class="blackbtn" />
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