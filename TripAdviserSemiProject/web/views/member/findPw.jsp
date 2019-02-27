<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="tripAdviser.member.model.vo.Member" %>
    <%
Member m =(Member)request.getAttribute("Member");

%>
<%@ include file="/views/common/header.jsp" %>
<style>
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

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}
.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}



section#pwfind-container{
width: 100%;
}
section#pwfind-container article#pwfind-article{
width: 430px;
margin: auto;

}


section#pwfind-container div.buttonscontrol{
text-align: center;
}
section#pwfind-container div#pwfind-div{
 background-color: white;
box-shadow: 0 1rem 2rem 0 rgba(0, 0, 0, 0.2);
border: 0.1px solid lightgray; 
margin-top: 30px;
margin-bottom: 30px;
height: 357px;

}
section#pwfind-container div.card-body{
width: 425px;
	
}
section#pwfind-container article#pwfind-article input[type=password]{
height: 40px;
}
</style>

<section id="pwfind-container">
<article id="pwfind-article">
<div id="pwfind-div">

<%if(m!=null){ %> 
		<form action="<%=request.getContextPath()%>/pwfindchange" method="post" onsubmit="return validate();">
		<!-- <span>변경할 비밀번호를 입력하세요 </span> -->
		<%-- <input type="password" id="password" name="password"/>
		<input type="password" id="passwordconfig" name="passwordconfig"/><br>
		<span id="pwspan"></span>--%>
		<input type="hidden" name="id" value="<%=m.getMemberId()%>"/> 
		 <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 ">
                <div class="card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">비밀번호 변경</h5>
                                              
                            
                             <div class="form-label-group">
                                <input type="password" id="password" name="password" class="pw form-control" placeholder="변경할 비밀번호"
                                    required>
                                <label for="password">변경할 비밀번호</label>
                            </div>
                            
                             <div class="form-label-group">
                                <input type="password" id="passwordconfig" name="passwordconfig" class="pw form-control" placeholder="비밀번호 확인"
                                    required>
                                <label for="passwordconfig">비밀번호 확인</label>
                               
                            </div>
                            
                            
                            
                          
                            
                            
                        
                    </div>
                    
                </div>
            </div>
        </div>
		
		
		<div class="buttonscontrol">
		<input type="submit" class="btn btn-secondary" value="비밀번호 변경"/>
		<input type="reset" class="btn btn-secondary" value="취소"/>
		</div>
		</form>
		<input type="hidden" id="variable" value="0"/>
	<%}else{ %>
		<span>입력한 정보와 일치하는 회원이 존재하지 않습니다.</span>
	<%} %>
</div>
<script>
$(function(){
	
	
	$("input[type=password]").blur(function(){
		var vari=$("#variable").val();
		var pw1=$("#password").val();
		var pw2=$("#passwordconfig").val();
		if(pw1.trim()!=pw2.trim()){
			$("#pwspan").html("비밀번호가 일치하지 않습니다.");
			vari=$("#variable").val(0);
			console.log(vari.val());
			return vari;
		}else{
			$("#pwspan").html("비밀번호가 일치합니다.");
			vari=$("#variable").val(1);
			console.log(vari.val());
			return vari;
		}
	});
});
function validate(){
	var vari=$("#variable").val();
	
	if(vari==0){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}else{
		return true;
	}
	
}

</script>

</article>

</section>
	
<%@ include file="/views/common/footer.jsp" %>