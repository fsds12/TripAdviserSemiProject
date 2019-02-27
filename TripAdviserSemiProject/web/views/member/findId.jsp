<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tripAdviser.member.model.vo.Member" %>
    
<%
Member m =(Member)request.getAttribute("Member");

%>
<%@ include file="/views/common/header.jsp" %>
<style>
section#idfind-container{
width: 100%;
}
section#idfind-container article#idfind-article{
width: 430px;
margin: auto;
}
section#idfind-container article#idfind-article div#idfind-div{
padding:1rem;
margin-top:2rem;
margin-bottom:2rem;
width: 400px;
height: 400px;
text-align: center;
background-color: white;
box-shadow: 0 1rem 2rem 0 rgba(0, 0, 0, 0.2);
border: 0.1px solid lightgray;
}
section#idfind-container div#pagemove{

margin-top: 290px; 
}

section#idfind-container article#idfind-article span{
font-size: 17px;
}
</style>
<section id="idfind-container">
<article id="idfind-article">
	<div id="idfind-div">
	
	<%if(m!=null){ %> 
		<span>조회된 아이디는 </span> <span style="color: orange;"><%=m.getMemberId()%></span> <span>입니다.</span>
		
	<%}else{ %>
		<span>입력한 정보와 일치하는 회원이 존재하지 않습니다.</span>
		
	<%} %>
		<div id="pagemove">
		<button onclick="idpwsearchpage()" class="btn btn-secondary" type="button">아이디/비밀번호찾기</button>
		<button onclick="loginpage()" class="btn btn-secondary" type="button">로그인창으로</button>
		</div>
	</div>
</article>
</section>

<script>
	function idpwsearchpage(){
		location.href="<%=request.getContextPath()%>/idpwsearchpage";
	}
	
	function loginpage(){
		location.href="<%=request.getContextPath()%>/loginpage";
	}
</script>


<%@ include file="/views/common/footer.jsp" %>