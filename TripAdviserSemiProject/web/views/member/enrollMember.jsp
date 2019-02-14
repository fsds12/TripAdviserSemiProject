<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!------ Include the above in your HEAD tag ---------->

<style>


    section#enroll-container{
    width: 100%;
    background-color:lightgray;
}

    section#enroll-container article#enroll-article{
    width: 650px;
    margin:auto;
    
    
}

    section#enroll-container article#enroll-article div#enroll-div{

       background-color: white;
        width: 625px;   
        padding-top: 60px;
        padding-bottom: 50px;
        border: 0;
  
  box-shadow: 0 1rem 2rem 0 rgba(0, 0, 0, 0.2);
  

        
    }

    section#enroll-container div#enroll-div div#enroll-title h5{
        font-weight: initial;
        font-size: 30px;    
    }
    div.control-group input[type="text"],div.control-group input[type="password"],div.control-group input[type="email"]{
        width: 350px;
        
    }
    article input#userid{
        display: inline-block;       
    }
    div label{
        margin-left: 15px;
        display: inline-block;
    }
    
    section#enroll-container div[name="controls"]{
        display: inline-block;
        padding-bottom: 17px;
    }
    section#enroll-container #userid{
        display: inline-block;
        margin-left: 50px;
        border-radius: 2rem;
    }
    section#enroll-container #password{
        display: inline-block;
        margin-left: 35px;
        border-radius: 2rem;

    }
    section#enroll-container #password_confirm{
        display: inline-block;
        margin-left: 2px;
        border-radius: 2rem;


    }
    section#enroll-container #email{
        display: inline-block;
        margin-left: 50px;
        border-radius: 2rem;
        line-height: 1.5;
    }
    section#enroll-container #cknumber{
        display: inline-block;
        margin-left: 35px;
        border-radius: 2rem;
    }
    section#enroll-container #username{
        display: inline-block;
        margin-left: 64px;
        border-radius: 2rem;
    }
    section#enroll-container #address{
        display: inline-block;
        margin-left: 34px;
        border-radius: 2rem;
    }
    section#enroll-container #address2{
        display: inline-block;
        margin-left: 34px;
        border-radius: 2rem;


    }
    section#enroll-container article#enroll-article div#enrollreset button{
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
    section#enroll-container article#enroll-article div#enrollreset button:hover{
        color: #fff;
    background: #4C5A64; /* old browsers */
    background: -moz-linear-gradient(top, #4C5A64 3%, #404F5A 4%, #2E3940 100%); /* firefox */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#4C5A64), color-stop(4%,#404F5A), color-stop(100%,#2E3940)); /* webkit */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4C5A64', endColorstr='#2E3940',GradientType=0 ); /* ie */
    }
    section#enroll-container article#enroll-article div#enrollreset button:active{
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
    section#enroll-container article#enroll-article div#enrollreset button{
        position: relative; left: 420px;
    }
    section#enroll-container article#enroll-article div#enrollreset{
        margin-top: 40px;
    }
   
    section#enroll-container article#enroll-article div.control-group button.btn-secondary{
        margin-left: 9px;
    }
    section#enroll-container article#enroll-article #enroll-title{
        position: relative; bottom: 30px;
        font-weight: 300;
        font-size: 1.5rem;
    }
    
</style>
<section id="enroll-container">
    <article id="enroll-article">
        <div id="enroll-top-div">
            <div id="enroll-div">
                <form class="form-horizontal" action='' method="POST">

                    <div id="enroll-title">
                        <h5 class="card-title text-center">회원가입</h5>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="userid">아이디</label>
                        <div class="controls" name="controls" style="display:inline-block;">
                            <input type="text" id="userid" name="userid" placeholder="" class="form-control" />
                            <button class="btn btn-secondary">중복확인</button>
                        </div>
                    </div>

                    <div class="control-group">
                        <!-- Password-->
                        <label class="control-label" for="password">비밀번호</label>
                        <div class="controls" name="controls">
                            <input type="password" id="password" name="password" placeholder="" class="form-control">
                            <!-- <p class="help-block">Password should be at least 4 characters</p> -->
                        </div>
                    </div>

                    <div class="control-group">
                        <!-- Password -->
                        <label class="control-label" for="password_confirm">비밀번호 확인</label>
                        <div class="controls" name="controls">
                            <input type="password" id="password_confirm" name="password_confirm" placeholder="" class="form-control">
                            <!-- <p class="help-block">Please confirm password</p> -->
                        </div>
                    </div>
                    <div class="control-group">
                        <!-- E-mail -->
                        <label class="control-label" for="email">이메일</label>
                        <div class="controls" name="controls">
                            <input type="email" id="email" name="email" placeholder="" class="form-control">
                            <button class="btn btn-secondary">인증번호 보내기 </button>

                            <!-- <p class="help-block">Please provide your E-mail</p> -->
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="cknumber">인증번호</label>
                        <div class="controls" name="controls">
                            <input type="text" id="cknumber" name="cknumber" class="form-control" />
                            <button class="btn btn-secondary">인증번호 확인</button>

                        </div>
                    </div>

                    <div class="control-group">
                        <!-- Username -->
                        <label class="control-label" for="username">이름</label>
                        <div class="controls" name="controls">
                            <input type="text" id="username" name="username" placeholder="" class="form-control">
                            <!-- <p class="help-block">Username can contain any letters or numbers, without spaces</p> -->
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="address">우편번호</label>
                        <div class="controls" name="controls">
                            <input type="text" id="address" name="address" class="form-control" />
                            <button class="btn btn-secondary">우편번호 검색</button>

                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="address2">상세주소</label>
                        <div class="controls" name="controls">
                            <input type="text" id="address2" name="address2" class="form-control" />
                        </div>
                    </div>




                    <div class="control-group">
                        <!-- Button -->
                        <div class="controls" id="enrollreset">
                            <button id="enroll" class="btn btn-success">회원가입</button>
                            <button id="reset" class="btn btn-success">취소</button>

                        </div>
                    </div>



                </form>
            </div>
    </article>
</section>
<%@ include file="/views/common/footer.jsp" %>