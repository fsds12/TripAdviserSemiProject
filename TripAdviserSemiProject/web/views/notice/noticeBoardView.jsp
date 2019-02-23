<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="tripAdviser.board.model.vo.Board"%>
<%
	Board b=(Board)request.getAttribute("Board");
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>
<style>
	section#noticeView-section{
		height: 650px;
	}
</style>

<section id="noticeView-section" class="notice-section">
	<div class="caption">
		<img src="<%=request.getContextPath()%>/images/notice.png" width="800px"/>
	</div>        
	<table class="noticeView-tbl" align="center">
		<tr height="60px">
			<td colspan="2" id="title-td"><%=b.getTitle() %></td>
		</tr>
		<tr height="20px">
			<td id="writer-td">작성자: <%=b.getMemberId() %></td>
			<td id="date-td">작성일: <%=b.getBoardDate() %></td>
		</tr>
		<tr>
			<td colspan="2" id="content-td">
				<p><%=b.getContent() %></p>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="30px" id="btn-td">
				<input type="button" value="삭제" onclick="fn_delete()"/>
				<input type="button" value="수정" onclick="fn_update()"/>
				<input type="button" value="목록" onclick="fn_return()"/>           	
			</td>
		</tr>
	</table>  
</section>
<script>
	function fn_return(){
		location.href="<%=request.getContextPath()%>/notice/noticeList";
	}	
	function fn_update(){
		alert("수정하시겠습니까?");
		location.href="<%=request.getContextPath()%>/notice/updateNotice?boardNo=<%=b.getBoardNo()%>";
	}
	function fn_delete(){
		alert("삭제하시겠습니까?");
		location.href="<%=request.getContextPath()%>/notice/deleteNotice?boardNo=<%=b.getBoardNo()%>";
	}
</script>

<%@ include file="/views/common/footer.jsp" %>