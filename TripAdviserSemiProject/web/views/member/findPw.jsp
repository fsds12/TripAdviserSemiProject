<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="tripAdviser.member.model.vo.Member" %>
    <%
Member m =(Member)request.getAttribute("Member");

%>
<%@ include file="/views/common/header.jsp" %>


<section id="pwfind-container">
<article id="pwfind-article">
<div id="pwfind-div">

<%if(m!=null){ %> 
		<form action="<%=request.getContextPath()%>/pwfindchange" method="post">
		<span>변경할 비밀번호를 입력하세요 </span>
		<input type="password" id="password" name="password"/>
		<input type="hidden" name="id" value="<%=m.getMemberId()%>"/>
		
		<input type="submit" value="비밀번호 변경"/>
		<input type="reset" value="취소"/>
		</form>
	<%}else{ %>
		<span>입력한 정보와 일치하는 회원이 존재하지 않습니다.</span>
	<%} %>
</div>


</article>

</section>
	
<%@ include file="/views/common/footer.jsp" %>