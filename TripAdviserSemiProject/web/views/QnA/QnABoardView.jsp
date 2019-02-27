<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, tripAdviser.board.model.vo.*" %>
<%@ include file="/views/common/header.jsp" %>
<% 
	Board b=(Board)request.getAttribute("Board"); 
	List<BoardAnswer> comment=(List)request.getAttribute("comment");
	Member m = (Member)session.getAttribute("loginMember");
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<style>
	button#comment-btn{
		border: 1px solid gainsboro;
    	background-color: white;
    	width: 50px; height: 30px;
    	cursor: pointer;
    	margin: auto;
    	float: right;
    	border-radius: 10%;    	
	}
	th{
		width: 10%;
	}
	td.write-td{
		border-bottom: 1px solid lightgrey;
	}
	td.title-td{
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
	}
</style>
<section id="noticeView-section" class="notice-section">
<div class="noticeView-container">
	<div class="caption">
    	<img src="<%=request.getContextPath()%>/images/qnaBoard4.png" width="800px"/>
    </div>
          
	<table class="noticeView-tbl" align="center">
		<tr>
			<td colspan="4" height="30px" class="write-td"><input type="button" id="list-btn" value="목록" onclick="fn_return()"/></td>
		</tr>
		<tr height="50px">
			<th class="title-th">제목</th>
			<td colspan="3" class="title-td"><%=b.getTitle()%></td>
		</tr>
		<tr height="20px">
			<th class="writer-th">작성자</th>
			<td id="writer-td"><%=b.getMemberId()%></td>
			<th class="date-th">작성일</th>
			<td id="date-td"><%=b.getBoardDate() %></td>
		</tr>
		<tr>
			<th height="350px" class="content-th">내용</th>
			<td colspan="3" id="content-td" height="350px">
				<%=(b.getContent()).replace("\r\n", "<br>")%>
			</td>
		</tr>			
		<tr>
			<%-- <%if(loginMember.getMemberId().equals(b.getMemberId())||loginMember.getMemberId().equals("admin")){ %>	 --%>		
				<td colspan="4" height="30px" id="btn-td">
					<input type="button" value="삭제" onclick="fn_delete()"/>				
					<input type="button" value="수정" onclick="fn_update()"/>
					<input type="button" value="답글" id="comment-btn"/>					       	
				</td>
			<%-- <%} %> --%>
		</tr>		
	</table>
	
	<form name="deleteFrm" action="<%=request.getContextPath() %>/QnA/deleteQnA" method="post">
		<input type="hidden" value="<%=b.getBoardNo()%>" name="boardNo" id="hNo"/>			
	</form>		
	
	<div id="comment-container">
		<div id="comment-box">comment</div>
					
		<form action="<%=request.getContextPath()%>/QnA/insertComment">
			<table align="center" id="comment-tbl">
				<tr>
					<td>			
						<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>"/>
						<input type="hidden" name="memberId" value="admin"/>
						<textarea name="commentContent"></textarea>
						<input type="hidden" name="commentLevel" value="1"/>
						<input type="hidden" name="commentRef" value="0"/>					
						<button type="submit" id="comment-btn">등록</button>
					</td>
				</tr>
			</table>			
		</form>
		
		<table id="comment-tbl">
			<%if(comment!=null){
				for(BoardAnswer ba : comment) {				
					if(ba.getCommentLevel()==1){%>			
				<tr>
					<td><input type="hidden" value="<%=ba.getCommentNo()%>"/></td>
					<td id="writer-td"><%=ba.getMemberId() %></td>
					<td id="date-td"><%=ba.getBoardDate() %></td>
					<td width="80%">
						<%=(ba.getContent()).replace("\r\n", "<br>") %>
					</td>
					<td>
						<input type="button" id="commentDelete" value="삭제" onclick="location.href='<%=request.getContextPath()%>/QnA/commentDelete?commentNo=<%=ba.getCommentNo()%>'"/>
												
					</td>
				</tr>
					<%}
				}
			}%>
			</table>
	</div>
</div>
</section>

<script>	
	function fn_return(){
		location.href="<%=request.getContextPath()%>/QnA/QnAList";
	}

	function fn_update(){
		var con=confirm("수정하시겠습니까?");
		if(con){
			location.href="<%=request.getContextPath()%>/QnA/updateQnA?boardNo=<%=b.getBoardNo()%>";
		}else{
			return;
		}
		
	}

	function fn_delete(){
		var con=confirm("삭제하시겠습니까?");
		var comment=$();
		if(con){
			
				deleteFrm.submit();
			
			
		}else{
			return;
		}
		
	}

	function fn_comment(){
		alert("등록하시겠습니까?");		
	}

	$('#comment-btn').click(function(){	    	
		$('#comment-container').toggle();	        	
	});

</script>

<%@ include file="/views/common/footer.jsp" %>