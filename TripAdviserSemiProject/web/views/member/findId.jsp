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
width: 650px;
margin: auto;
}
section#idfind-container article#idfind-article div#idfind-div{
width: 400px;
height: 400px;
text-align: center;
background-color: lightgray;
}
</style>
<section id="idfind-container">
<article id="idfind-article">
	<div id="idfind-div">
	
	<%if(m!=null){ %> 
		<span>조회된 아이디는 <%=m.getMemberId()%></span>
	<%}else{ %>
		<span>입력한 정보와 일치하는 회원이 존재하지 않습니다.</span>
	<%} %>
	</div>
</article>
</section>


<%@ include file="/views/common/footer.jsp" %>