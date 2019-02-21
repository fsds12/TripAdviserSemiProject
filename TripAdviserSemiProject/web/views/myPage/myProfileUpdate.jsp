<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>
<style>
    section#myProfileUpdate-container{
    width: 100%;
    /* background-color: lightgray; */
    background-color: lightgray;
}

section#myProfileUpdate-container article#myProfileupdate-article{
    width: 650px;
    margin: auto;

}
section#myProfileUpdate-container article#myProfileupdate-article table#update-table{
    border: 1px solid black;
    border-collapse: separate;
    border-spacing: 0;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
    margin-left: auto;
    margin-right: auto;
}
section#myProfileUpdate-container article#myProfileupdate-article table#update-table th{
    width: 150px;
    text-align: center;
    font-weight: bold;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #fff;
    border-left: 1px solid #fff;
    background-color: #FCFCFC;
    margin: auto;
}
section#myProfileUpdate-container article#myProfileupdate-article table#update-table td{
    width: 450px;
    padding: 10px;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin-left: auto;
    margin-right: auto;
    padding-bottom: 30px;
}

section#myProfileUpdate-container article#myProfileupdate-article div#update-div{
    background-color: white;
}

section#myProfileUpdate-container article#myProfileupdate-article table input[type="text"]{
width: 300px;
height: 30px;
display: inline-block;
border-radius: 2rem;
position: relative; top: 10px;

}
section#myProfileUpdate-container article#myProfileupdate-article table input[type="email"]{
width: 300px;
display: inline-block;
border-radius: 2rem;
position: relative; top: 10px;



}
section#myProfileUpdate-container article#myProfileupdate-article table input[type="button"]{
height: 35px;
position: relative; top: 7px;

}
section#myProfileUpdate-container article#myProfileupdate-article table #addressSearch{
margin-left: 5px;
}
section#myProfileUpdate-container article#myProfileupdate-article #update-div{
    text-align: center;
    padding-top: 15px;
    padding-bottom: 20px; 
}
section#myProfileUpdate-container article#myProfileupdate-article #update{
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
section#myProfileUpdate-container article#myProfileupdate-article #update:hover{
    color: #fff;
    background: #4C5A64; /* old browsers */
    background: -moz-linear-gradient(top, #4C5A64 3%, #404F5A 4%, #2E3940 100%); /* firefox */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#4C5A64), color-stop(4%,#404F5A), color-stop(100%,#2E3940)); /* webkit */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4C5A64', endColorstr='#2E3940',GradientType=0 ); /* ie */
}
section#myProfileUpdate-container article#myProfileupdate-article #update:active{
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

<section id="myProfileUpdate-container">
    <article id="myProfileupdate-article">
        <div id="update-div">
            <form class="form-horizontal" action="" method="post">
                <div id="enroll-title">
                    <h5 class="card-title text-center">내 정보 수정</h5>
                </div>
                <table id="update-table">
                    <tr>
                        <th>아이디</th>
                        <td><input type="text" id="userid" name="userid" class="form-control form-control-sm" readonly /></td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="button" id="password" name="password" class="btn btn-secondary" value="비밀번호 변경" /></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><input type="email" id="email" name="email" class="form-control form-control-sm" /></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" id="username" name="username" class="form-control form-control-sm" /></td>
                    </tr>
                    <tr>
                        <th>우편번호</th>
                        <td><input type="text" id="address" name="address" class="form-control form-control-sm" />
                            <input type="button" id="addressSearch" name="addressSearch" class="btn btn-secondary" value="우편번호검색" /></td>

                    </tr>
                    <tr>
                        <th>상세주소</th>
                        <td><input type="text" id="address2" name="address2" class="form-control form-control-sm" /></td>
                    </tr>


                </table>
                <div id="update-div">
                    <input type="submit" value="회원정보변경" id="update" name="update" />
                </div>
            </form>

        </div>

    </article>

</section>

<%@ include file="/views/common/footer.jsp" %>