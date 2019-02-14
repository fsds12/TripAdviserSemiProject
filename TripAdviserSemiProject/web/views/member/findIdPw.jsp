<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>

<style>
    section#idpwsearch-container{
    
min-width: 100%;
margin:auto;
}


section#idpwsearch-container article#allarti{
	width:880px;
	height:880px;
	margin:auto;
}
section#idpwsearch-container article#allarti div#idsearch{
width:400px;
height:400px;
display: inline-block;
background-color:rgb(252,252,252);

}
section#idpwsearch-container article#allarti div#pwsearch{
width:400px;
height:400px;
display: inline-block;
background-color:rgb(252,252,252);
margin-left: 42px;

}
article#allarti div#idsearch #idreset{
    
}
article#allarti div#pwsearch #pwreset{
    
}
article#allarti div#idsearch #idreset,article#allarti div#pwsearch #pwreset,article#allarti div#idsearch #idfind,article#allarti div#pwsearch #pwfind{
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
article#allarti div#idsearch #idreset:hover{
color: #fff;
    background: #4C5A64; /* old browsers */
    background: -moz-linear-gradient(top, #4C5A64 3%, #404F5A 4%, #2E3940 100%); /* firefox */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#4C5A64), color-stop(4%,#404F5A), color-stop(100%,#2E3940)); /* webkit */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4C5A64', endColorstr='#2E3940',GradientType=0 ); /* ie */
}
article#allarti div#pwsearch #pwreset:hover{
color: #fff;
    background: #4C5A64; /* old browsers */
    background: -moz-linear-gradient(top, #4C5A64 3%, #404F5A 4%, #2E3940 100%); /* firefox */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#4C5A64), color-stop(4%,#404F5A), color-stop(100%,#2E3940)); /* webkit */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4C5A64', endColorstr='#2E3940',GradientType=0 ); /* ie */
}
article#allarti div#idsearch #idfind:hover{
color: #fff;
    background: #4C5A64; /* old browsers */
    background: -moz-linear-gradient(top, #4C5A64 3%, #404F5A 4%, #2E3940 100%); /* firefox */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#4C5A64), color-stop(4%,#404F5A), color-stop(100%,#2E3940)); /* webkit */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4C5A64', endColorstr='#2E3940',GradientType=0 ); /* ie */
}
article#allarti div#pwsearch #pwfind:hover{
color: #fff;
    background: #4C5A64; /* old browsers */
    background: -moz-linear-gradient(top, #4C5A64 3%, #404F5A 4%, #2E3940 100%); /* firefox */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#4C5A64), color-stop(4%,#404F5A), color-stop(100%,#2E3940)); /* webkit */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4C5A64', endColorstr='#2E3940',GradientType=0 ); /* ie */
}

article#allarti div#idsearch #idreset:active{
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
article#allarti div#pwsearch #pwreset:active{
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
article#allarti div#idsearch #idfind:active{
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
article#allarti div#pwsearch #pwfind:active{
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
section#idpwsearch-container article#allarti input[type="text"],section#idpwsearch-container article#allarti div#idsearch input[type=email],#address2{
    border-radius: 2rem;
    display: inline-block;
}
section#idpwsearch-container article#allarti label{
    display: inline-block;
    margin-left: 10px;
}
section#idpwsearch-container article#allarti input[type="reset"]{

}
section#idpwsearch-container article#allarti input[type="submit"]{

}
section#idpwsearch-container article#allarti div.controlslabel{
    width: 73px;
}
#idsearch{
    margin: auto;
}
section#idpwsearch-container article#allarti div.control-group{
    padding-bottom: 10px;
}
section#idpwsearch-container article#allarti div.controlsbutton{
    text-align:end;
    margin-top: 180px;
}


</style>
<section id="idpwsearch-container">
    <article id="allarti">

        <div id="idsearch">

            <form action="">
                <div id="enroll-title">
                    <h5 class="card-title text-center">아이디 찾기</h5>
                </div>

                <div class="control-group">
                    <div class="controlslabel" style="display:inline-block;"> <label id="namelabel" for="name">이름</label></div>
                    <div class="controls" name="controls" style="display:inline-block;">
                        <input id="name" type="text" class="form-control" placeholder="이름" />
                    </div>
                </div>
                <div class="control-group">
                    <div class="controlslabel" style="display:inline-block;"> <label id="phonelabel" for="phone">전화번호</label></div>

                    <div class="controls" name="controls" style="display:inline-block;"><input id="phone" type="text"
                            class="form-control" placeholder="전화번호" />
                    </div>
                </div>

                <div class="control-group">
                    <div class="controlslabel" style="display:inline-block;"> <label id="addresslabel" for="address">이메일</label></div>
                    <div class="controls" name="controls" style="display:inline-block;"> <input id="address" type="email"
                            class="form-control" placeholder="이메일주소" />
                    </div>
                </div>
                <div class="controlsbutton">
                    <input id="idfind" type="submit" value="아이디찾기" class="btn btn-success" />
                    <input id="idreset" type="reset" value="취소" class="btn btn-success" />
                </div>


            </form>
        </div>

        <div id="pwsearch">
            <form>
                <div id="enroll-title">
                    <h5 class="card-title text-center">비밀번호 찾기</h5>
                </div>

                <div class="control-group">
                    <div class="controlslabel" style="display:inline-block;"><label id="idlabel" for="id">아이디</label>
                    </div>
                    <div class="controls" name="controls" style="display:inline-block;"><input type="text" id="id"
                            class="form-control" placeholder="아이디" />
                    </div>
                </div>

                <div class="control-group">
                    <div class="controlslabel" style="display:inline-block;"><label id="phone2label" for="phone2">전화번호</label></div>
                    <div class="controls" name="controls" style="display:inline-block;"> <input type="text" id="phone2"
                            class="form-control" placeholder="전화번호" /></div>
                </div>

                <div class="control-group">
                    <div class="controlslabel" style="display:inline-block;"><label id="address2label" for="address2">이메일</label>
                    </div>
                    <div class="controls" name="controls" style="display:inline-block;"><input id="address2" type="email"
                            class="form-control" placeholder="이메일주소" /></div>
                </div>
                <div class="controlsbutton">

                    <input id="pwfind" type="submit" value="비밀번호찾기" class="btn btn-success" />
                    <input id="pwreset" type="reset" value="취소" class="btn btn-success" />
                </div>


            </form>
        </div>


    </article>
</section>
<%@ include file="/views/common/footer.jsp"%>