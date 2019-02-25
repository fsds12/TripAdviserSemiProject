<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId=request.getParameter("userId");
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
<title>비밀번호 변경</title>
<style>
	
	
   #changereset{
   display: inline-block;
   }
   #pwchange{
   display: inline-block;
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
  line-height: 1.5;
  color: #495057;
  
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








.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}




</style>
</head>
<body>
<section id="wcw-changepw-container">
	<article id="changepw-article">
		<div id="changepw-div">
			 <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">비밀번호 변경</h5>
                        <form action="<%=request.getContextPath() %>/mypage/changepassword" class="form-signin" method="POST" onsubmit="return pwvalidate();">                       
                            <div class="form-label-group">
                                <input type="password" id="password" name="password" class="form-control" placeholder="현재 비밀번호"
                                    required>
                                <label for="password">현재 비밀번호</label>
                            </div>
                            
                             <div class="form-label-group">
                                <input type="password" id="password_new" name="password_new" class="pw form-control" placeholder="변경할 비밀번호"
                                    required>
                                <label for="password_new">변경할 비밀번호</label>
                            </div>
                            
                             <div class="form-label-group">
                                <input type="password" id="passwordck" name="passwordck" class="pw form-control" placeholder="비밀번호 확인"
                                    required>
                                <label for="passwordck">비밀번호 확인</label>
                                <span id="pwspan"></span>
                            </div>
                            
                            
                            
                            <div class="btn-group">
                            <input type="reset" value="취소" id="changereset" onclick="self.close()" name="changereset" class="btn btn-secondary"/>
                           </div>
          
                            <div class="btn-container">
                            <button class="btn btn-secondary" id="pwchange" name="pwchange" type="submit">비밀번호변경</button>
                            <br>
                            </div>  
                            <input type="hidden" name="userId" value="<%=userId %>"/>                 
                            <input type="hidden" id="vari" name="vari" value="0"/>
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
		</div>
	</article>
	<script>
	
	
		$(function(){
		$(".pw").blur(function(){
			var vari=$("#vari").val();
			var pw1=$("#password_new").val();
			var pw2=$("#passwordck").val();
			
			if(pw1.trim()!=pw2.trim()){
				$("#pwspan").html("비밀번호가 일치하지 않습니다.");
				vari=$("#vari").val(0);
				return vari;
			}else{
				$("#pwspan").html("비밀번호가 일치합니다.");
				vari=$("#vari").val(1);
				return vari;
			}			
		});									
		});
		
		function pwvalidate(){
			
			var vari=$("#vari").val();
			
			if(vari==0){
				alert("비밀번호가 일치하지 않습니다.");
				$("#password_new").focus();
				return false;
			}else{
				return true;
			}
			
		}
	</script>
</section>

<script>

</script>
</body>
</html>