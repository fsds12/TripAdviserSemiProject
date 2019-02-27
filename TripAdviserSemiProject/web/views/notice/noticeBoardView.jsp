<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="tripAdviser.board.model.vo.Board"%>
<%
	Board b=(Board)request.getAttribute("Board");
	Member m = (Member)session.getAttribute("loginMember");	
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>
<style>
	section#noticeView-section{
		height: 700px;
	}
	th{
		width: 10%;
	}
	/* td{
		width: 50%;
	} */
	td.write-td{
		border-bottom: 1px solid lightgrey;
	}
	td#title-td{
		border-top: 1px solid lightgrey;
		border-bottom: 1px solid lightgrey;
	}
	th.title-th{		
		border-bottom: 1px solid lightgrey;
	}
	th.content-th{
		border-top: 1px solid lightgrey;
		border-bottom: 1px solid lightgrey;
	}
	td#content-td{
		border-top: 1px solid lightgrey;
		border-bottom: 1px solid lightgrey;
	}
	
</style>

<section id="noticeView-section" class="notice-section">
	<div class="caption">
		<img src="<%=request.getContextPath()%>/images/notice.png" width="800px"/>
	</div>        
	<table class="noticeView-tbl" align="center">
		<tr>
			<td class="write-td" colspan="4" height="30px"><input type="button" value="목록" onclick="fn_return()"/></td>
		</tr>
		<tr height="50px">
			<th class="title-th">제목</th>
			<td colspan="3" id="title-td"><%=b.getTitle() %></td>
		</tr>
		<tr height="20px">
			<th>작성자</th>
			<td id="writer-td"><%=b.getMemberId() %></td>
			<th>작성일</th>
			<td id="date-td"><%=b.getBoardDate() %></td>
		</tr>
		<tr>
			<th class="content-th" height="350px">내용</th>
			<td colspan="3" id="content-td" height="350px">
				<%=(b.getContent()).replace("\r\n", "<br>")%>
			</td>
		</tr>		
		<tr>
			<%if(loginMember!=null&&loginMember.getMemberId().equals("admin")){ %>				
			<td colspan="4" height="30px" id="btn-td" class="btn-td">					
				<input type="button" value="삭제" onclick="fn_delete()"/>
				<input type="button" value="수정" onclick="fn_update()"/>				          	
			</td>					
			<%} %>
		</tr>		
	</table>

			  
</section>
<script>
	$(function(){
		
	})
	function fn_return(){
		location.href="<%=request.getContextPath()%>/notice/noticeList";
	}	
	function fn_update(){
		if(confirm('수정하시겠습니까?')){
			location.href="<%=request.getContextPath()%>/notice/updateNotice?boardNo=<%=b.getBoardNo()%>";
		}else{
			return;
		}
		
	}
	function fn_delete(){
		if(confirm("삭제하시겠습니까?")){
			location.href="<%=request.getContextPath()%>/notice/deleteNotice?boardNo=<%=b.getBoardNo()%>";
		}else{
			return;
		}		
	}
</script>

<%@ include file="/views/common/footer.jsp" %>