<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="tripAdviser.member.model.vo.Member" %>
    <%
Member m =(Member)request.getAttribute("Member");

%>
<%@ include file="/views/common/header.jsp" %>
<style>
section#pwfind-container{
width: 100%;
}
section#pwfind-container article#pwfind-article{
width: 430px;
}

</style>

<section id="pwfind-container">
<article id="pwfind-article">
<div id="pwfind-div">

<%if(m!=null){ %> 
		<form action="<%=request.getContextPath()%>/pwfindchange" method="post" onsubmit="return validate();">
		<span>변경할 비밀번호를 입력하세요 </span>
		<input type="password" id="password" name="password"/>
		<input type="password" id="passwordconfig" name="passwordconfig"/><br>
		<span id="pwspan"></span>
		<input type="hidden" name="id" value="<%=m.getMemberId()%>"/>
		
		<input type="submit" value="비밀번호 변경"/>
		<input type="reset" value="취소"/>
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