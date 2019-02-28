<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<%@ include file="/views/common/header.jsp"%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

<style>
:root { -
	-input-padding-x: 1.5rem; -
	-input-padding-y: .75rem;
}

body {
	background: lightgray;
	/* background: linear-gradient(to right, #0062E6, #33AEFF); */
}

section#wcw-enroll-container {
	width: 100%;
}

article {
	margin-left: auto;
	margin-right: auto;
}

.card-signin {
  border: 0;
  
  box-shadow: 0 1rem 2rem 0 rgba(0, 0, 0, 0.2);
}

.card-title {
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
  font-size: 100%;
  /* letter-spacing: .1rem; */
  font-weight: bold;
 /*  padding: 1rem; */
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
  width: 300px;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 2.9;
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

section#wcw-enroll-container .btn {
	display: inline-block;
	margin-left: 11px;
}

section#wcw-enroll-container input[type="text"], section#wcw-enroll-container input[type="password"],
	section#wcw-enroll-container input[type="email"] {
	width: 300px;
	height: 51px;
	display: inline-block;
}

section#wcw-enroll-container div#enrollreset input {
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
	background: -moz-linear-gradient(top, #3D4850 3%, #313d45 4%, #232B30 100%);
	/* firefox */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(3%, #3D4850),
		color-stop(4%, #313d45), color-stop(100%, #232B30)); /* webkit */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3D4850',
		endColorstr='#232B30', GradientType=0); /* ie */
	box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2); /* CSS3 */
	-moz-box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2); /* Firefox */
	-webkit-box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
	width: 100px;
	height: 42px;
	/* Safari, Chrome */
}

section#wcw-enroll-container #signup:hover, section#wcw-enroll-container #reset:hover
	{
	color: #fff;
	background: #4C5A64; /* old browsers */
	background: -moz-linear-gradient(top, #4C5A64 3%, #404F5A 4%, #2E3940 100%);
	/* firefox */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(3%, #4C5A64),
		color-stop(4%, #404F5A), color-stop(100%, #2E3940)); /* webkit */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4C5A64',
		endColorstr='#2E3940', GradientType=0); /* ie */
}

section#wcw-enroll-container div#enrollreset #signup:active, section#wcw-enroll-container div#enrollreset #reset:active
	{
	background-position: 0 top;
	position: relative;
	top: 1px;
	color: #fff;
	padding: 6px 12px 4px;
	background: #20282D; /* old browsers */
	background: -moz-linear-gradient(top, #20282D 3%, #252E34 51%, #222A30 100%);
	/* firefox */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(3%, #20282D),
		color-stop(51%, #252E34), color-stop(100%, #222A30)); /* webkit */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#20282D',
		endColorstr='#222A30', GradientType=0); /* ie */
	-moz-box-shadow: 1px 1px 1px rgba(255, 255, 255, 0.1); /* Firefox */
	-webkit-box-shadow: 1px 1px 1px rgba(255, 255, 255, 0.1);
	/* Safari, Chrome */
	box-shadow: 1px 1px 1px rgba(255, 255, 255, 0.1); /* CSS3 */
}

section#wcw-enroll-container article#enroll-article div#enrollreset {
	padding-top:20px;
	position: relative;
	left: 190px;
}

section#wcw-enroll-container article#enroll-article div.form-label-group button{
	
	/* font-size: 13px; */
}

section#wcw-enroll-container article#enroll-article span#password_span {
	color: red;
}

section#wcw-enroll-container .form-label-group button{
width: 100px;
height: 55px;
/* font-size: 6px; */
}

</style>
</head>

<script>
function idcheck(){
var userid=$("#inputEmail").val().trim();

if(!userid||userid.length<5){
	alert("아이디의 최소 길이는 4글자 입니다.");
	return;
}
var url="<%=request.getContextPath()%>/check/id";
var title="idCheck";
var option="left=500px,top=230px,width=400px,height=400px,menubar=no,status=no,scrollbars=yes";
var popup=window.open("",title,option);

checkid.hiddenid.value=userid;
checkid.target=title;
checkid.action=url;
checkid.method="post";
checkid.submit();
}

</script>

<body>
	<section id="wcw-enroll-container">
		<article id="enroll-article">
			<div class="container">
				<div class="row">
					<div class="mx-auto">
						<div class="card card-signin my-5">
							<div class="card-body">
								<h5 class="card-title text-center">회원가입</h5>
								<form action=" <%=request.getContextPath()%>/signup"
									name="enrollformm" class="form-signin" method="POST"
									onsubmit="return formstrans();">
									<div class="form-label-group">
										<input type="text" id="inputEmail" name="inputEmail"
											class="form-control" placeholder="&nbsp;&nbsp;아이디" required autofocus>
										<label for="inputEmail"> 아이디</label>
										<button type="button" id="useridbtn" onclick="idcheck()"
											class="btn btn-secondary">중복확인</button>
										<br> <span id="id_span"></span>
									</div>


									<div class="form-label-group">
										<input type="password" id="inputPassword" name="inputPassword"
											class="form-control" placeholder="&nbsp;&nbsp;비밀번호" required> <label
											for="inputPassword">비밀번호</label>
									</div>

									<div class="form-label-group">
										<input type="password" id="password_confirm"
											name="password_confirm" class="form-control"
											placeholder="&nbsp;&nbsp;비밀번호확인" required> <label
											for="password_confirm">비밀번호 확인</label><br> <span
											id="password_span"></span>
									</div>




									<div class="form-label-group">
										<input type="email" id="email" name="email"
											class="form-control" placeholder="&nbsp;&nbsp;이메일" required> <label
											for="email">이메일</label>
										<button type="button" id="cknumbergo" onclick="emailgo()"
											class="btn btn-secondary">인증번호 &nbsp보내기</button>
									</div>

									<%--  <script>
								function cknumbergo(){
									location.href="<%=request.getContextPath()%>/signup";
								}                               
								</script> --%>

									<div class="form-label-group">
										<input type="text" id="cknumber" name="cknumber"
											class="form-control" placeholder="&nbsp;&nbsp;인증번호"> <label
											for="cknumber">인증번호</label>
										<button type="button" id="united"
											class="btn btn-secondary">인증번호 확인</button>
										<input type="hidden" id="united2" value="0" /> <input
											type="hidden" id="united3" value="0" /> <input type="hidden"
											id="united4" value="3" />
									</div>

									<div class="form-label-group">
										<input type="text" id="phone" name="phone"
											class="form-control" maxlength="11" placeholder="&nbsp;&nbsp;전화번호"> <label
											for="phone">전화번호</label>
									</div>



									<div class="form-label-group">
										<input type="text" maxlength="4" id="username" name="username"
											class="form-control" placeholder="&nbsp;&nbsp;이름" required> <label
											for="username">이름</label>
									</div>
									<div class="form-label-group">
										<input type="text" id="sample4_postcode" name="address"
											class="form-control" placeholder="&nbsp;&nbsp;우편번호" required> <label
											for="address">우편번호</label>
										<button type="button" onclick="sample4_execDaumPostcode()"
											class="btn btn-secondary">우편번호 검색</button>
									</div>

									<div class="form-label-group">
										<input type="text" id="sample4_roadAddress"
											name="sample4_roadAddress" class="form-control"
											placeholder="&nbsp;&nbsp;주소" required> <label
											for="sample4_roadAddress">주소</label>
									</div>

									<div class="form-label-group">
										<input type="text" id="sample4_detailAddress" name="address2"
											class="form-control" placeholder="&nbsp;&nbsp;상세주소" required> <label
											for="sample4_detailAddress">상세주소</label>
									</div>

									<div class="control-group">
										<!-- Button -->
										<div class="controls" id="enrollreset">
											<input type="reset" id="reset" value="취소"
												class="btn btn-success btn-lg" /> <input type="submit"
												id="signup" value="회원가입" class="btn btn-success btn-lg" />

								
										</div>
									</div>
									<input type="hidden" readonly="readonly" name="code_check"
										id="code_check" value="<%=getRandom()%>" />
									<%!public String getRandom() {
		int random = 0;
		random = (int) Math.floor((Math.random() * (99999 - 10000 + 1))) + 100000;
		return String.valueOf(random);
	}%>

								</form>

								<%--  <script>
                                $(function(){
                                	$("#cknumbergo").click(function(){
                                		$.ajax({
                                			url:"<%=request.getContextPath()%>/email",
                                			type:"post",
                                			data:{"email":$("#email").val(),"code":$("#code_check").val()},
                                			success:function(data){
                                				console.log(data);
                                			}
                                		});
                                	});
                                });
                                </script> --%>
							</div>
						</div>
					</div>
				</div>
				<form name="emailgoFrm" method="post">
					<input type="hidden" name="email" /> <input type="hidden"
						name="code_check" />
				</form>

				<form name="checkid" method="post">
					<input type="hidden" name="hiddenid" />

				</form>
			</div>


			<script>
        function emailgo(){
        	var email=$("#email").val().trim();
			var code=$("#code_check").val();
			var url="<%=request.getContextPath()%>/email";
			var title="인증번호";
			var option="left=500px, top=100px, width=300px, height=200px, menubar=no, status=no, scrollbars=yes";
			var popup=window.open("",title,option);
			emailgoFrm.email.value=email;
			emailgoFrm.code_check.value=code;
			emailgoFrm.target=title;
			emailgoFrm.action=url;
			emailgoFrm.method="post";
			emailgoFrm.submit();
        }
        
        <%-- function addresssearch(){
        	var url="<%=request.getContextPath()%>/address";
        	var title="우편번호 검색";
        	var option="left=500px, top=200px, width=500px, height=500px, menubar=no, status=no, scrollbars=yes";
        	/* var popup=window.open("",title,option); */
        	
        	window.open(url,"_blank",option);
        	
        	
        } --%>
        
       $("#united").click(function(){
    	    var number=$("#cknumber").val().trim();
       		var code=$("#code_check").val();
       		var flag=$("#united2").val();
       		console.log("넘버"+number);
       		console.log("코드"+code);
       		if(number!=code){
       			alert("인증번호가 일치하지 않습니다.");
       			flag=$("#united2").val(0);
       			console.log(flag.val());
       			$("#cknumber").val("");
       			$("#cknumber").focus();
       			return flag;
       		}else{
       			alert("인증번호가 일치합니다.");
       			flag=$("#united2").val(1);       			
       			console.log(flag.val());
       			return flag;
       		}
       });
       
       $(function(){
    		$("input[type=password]").blur(function(){
    			var pw1=$('#inputPassword').val();
    			var pw2=$('#password_confirm').val();
    			var pwuni=$("#united3").val();
    			var x=document.getElementById("password_span");
    			if(pw1.trim()!=pw2.trim()){
    				$('#password_span').html("비밀번호가 일치하지 않습니다.");
    				x.style.color="red";
    				pwuni=$("#united3").val(2);
    				console.log(pwuni.val());
    				return pwuni;
    			}else{
    				$('#password_span').html("비밀번호가 일치합니다.");
    				x.style.color="lightgreen";
    				pwuni=$("#united3").val(1);
    				console.log(pwuni.val());
    				return pwuni;
    			}
    			
    		});
    	});

		$(function(){
			var idbtn=$("#united4").val();
			
			$("#useridbtn").click(function(){				
       			idbtn=$("#united4").val(4);
       			
 			
	    	   });
		});
		
       
       
        function formstrans(){
    	   var tfnumber=$("#united2").val();
    	   var password=$("#united3").val();
    	   var idbtn1=$("#united4").val();
    	   var userid=$("#inputEmail").val().trim();
    	   /* #united2가 0이면 인증번호 확인 1이면 트루 #united3가 2이면 비밀번호가 일치하지 않음*/
    	   if(tfnumber=='1'&&password=='1'&&userid.length>4){
    		   return true;
    	   }else if(tfnumber=='0'){
    		   alert("인증번호를 확인해주세요");
    		   return false;
    	   }else if(password=='2'){
    		   alert("비밀번호가 일치하지 않습니다.");
    		   return false;
    	   }else if(idbtn1=='3'){
    		   alert("아이디 중복확인 버튼을 눌러주세요");
    		   return false;
    	   }else if(idbtn1=='4'){
    		   return true;
    	   }
    	   
    	   
       } 
        
        $(function(){
        	var name=$("")
        })
        
        
        </script>





			<script>
        
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;
                    //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                    
                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if(roadAddr !== ''){
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
        </script>
		</article>
	</section>
	<%@ include file="/views/common/footer.jsp"%>