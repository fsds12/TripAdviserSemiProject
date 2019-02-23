<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, tripAdviser.board.model.vo.*" %>
<% 
	Board b=(Board)request.getAttribute("Board"); 
	List<BoardAnswer> comment=(List)request.getAttribute("comment");	
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>

<section id="noticeView-section" class="notice-section">

<div class="noticeView-container">
	<div class="caption">
    	<img src="<%=request.getContextPath()%>/images/qnaBoard4.png" width="800px"/>
    </div>        
	<table class="noticeView-tbl" align="center">
		<tr height="60px">
			<td colspan="2" id="title-td"><%=b.getTitle()%></td>
		</tr>
		<tr height="20px">
			<td id="writer-td"><%=b.getMemberId() %></td>
			<td id="date-td"><%=b.getBoardDate() %></td>
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
				<input type="button" value="답글" id="comment-btn"/>         	
			</td>
		</tr>
	</table>
	<div id="comment-container">
		
		<div id="comment-box">comment</div>
			<table id="comment-tbl">
				<tr>
					<td id="writer-td" width="5%"><%=b.getMemberId()%></td>
					<td id="date-td">19.02.12</td>				
				</tr>
				<tr>
					<td id="content-td" colspan="3">
						<p>
							답글 테스트
						</p>
					</td>
				</tr>
			</table>
		<form action="<%=request.getContextPath()%>/QnA/insertComment" method="post">
			<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>"/>
			<input type="hidden" name="commentWriter" value="admin"/>
			<input type="hidden" name="level" value="1"/>
			<input type="hidden" name="commentRef" value="0"/>
			<textarea name="commentContent"></textarea>		
			<input type="submit" value="등록" id="comment-btn"/>
		</form>
				
	</div>	
</div>	  
</section>

<script>
	function fn_return(){
		location.href="<%=request.getContextPath()%>/QnA/QnAList";
	}	
	function fn_update(){
		alert("수정하시겠습니까?");
		location.href="<%=request.getContextPath()%>/QnA/updateQnA?boardNo=<%=b.getBoardNo()%>";
	}
	function fn_delete(){
		alert("삭제하시겠습니까?");
		location.href="<%=request.getContextPath()%>/QnA/deleteQnA?boardNo=<%=b.getBoardNo()%>";
	}
	function fn_comment(){
		alert("등록하시겠습니까?");
		
	}
	
	    $('#comment-btn').click(function(){	    	
	        $('#comment-container').toggle();	        	
	    });
	
</script>

<%@ include file="/views/common/footer.jsp" %>