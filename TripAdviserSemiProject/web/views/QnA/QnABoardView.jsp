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
	div#comment-box{
		margin-top: 10px;
	}
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
	table#comment-tbl{
		border: 1px solid lightgrey;
	}
	/* 답글 */	
section#noticeView-section div#comment-container{	
	width:100%; height: 150px;
	display: none;	
}
section#noticeView-section div#comment-box{
	width:100%; height: 150px;
	margin-top: 0px;
}
textarea{ 
	margin-top: 10px;
	margin-left: auto;
	width: 100%; height: 50px;
	border: 0.05em solid lightgrey;
	border-radius: 0.5em;	
}
input#comment-btn{
	width: 50px; height: 30px; 
	border: 1px solid gainsboro; 
	background-color: white;	
	border-radius: 10%;
	cursor: pointer;	
	display: inline-block;	
}
div#comment-box{	
	width: 100%; height: 30px;	
	text-align: left;
	margin: auto;
}
table#comment-tbl{	
	width: 80%; height: 80px;	
}
td#date-td{
	font-size: 10px;
}
div.donotShow{
	width: 80%; height: 200px;	
	margin: auto;
	text-align: center;
	padding-top: 100px;
}

</style>
<section id="noticeView-section" class="notice-section">
<div class="noticeView-container">
	<div class="caption">
    	<img src="<%=request.getContextPath()%>/images/qnaBoard4.png" width="800px"/>
    </div>
    
    <%if(loginMember!=null&&(b.getMemberId().equals(loginMember.getMemberId())||"admin".equals(loginMember.getMemberId()))){ %>	      
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
				<td colspan="3" id="content-td" height="350px"><%=(b.getContent()).replace("\r\n", "<br>")%></td>
			</tr>				
			<tr>						
				<td colspan="4" height="30px" id="btn-td">
					<input type="button" value="삭제" onclick="fn_delete()"/>				
					<input type="button" value="수정" onclick="fn_update()"/>
					<input type="button" value="답글" id="comment-btn"/>					       	
				</td>			
			</tr>				
		</table>
		<form name="deleteFrm" action="<%=request.getContextPath() %>/QnA/deleteQnA" method="post">
			<input type="hidden" value="<%=b.getBoardNo()%>" name="boardNo" id="hNo"/>			
		</form>	
	<%}else{ %>
		<div class="donotShow">
			<p>작성자와 관리자만 볼 수 있습니다.</p>
			<input type="button" onclick="fn_return()" value="목록" class="returnBtn"/>
		</div>		
	<%} %>
			
	<%if(loginMember!=null&&(b.getMemberId().equals(loginMember.getMemberId())||"admin".equals(loginMember.getMemberId()))){ %>
	<div id="comment-container">				
		<form action="<%=request.getContextPath()%>/QnA/insertComment">
			<table align="center">
				<tr>
					<td>			
						<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>"/>
						<input type="hidden" name="memberId" value="admin"/>
						<textarea row="50" name="commentContent"></textarea>
						<input type="hidden" name="commentLevel" value="1"/>
						<input type="hidden" name="commentRef" value="0"/>					
						<button type="submit" id="comment-btn">등록</button>
					</td>
				</tr>
			</table>			
		</form>
	</div>
	<div id="comment-box">
		<%if(comment!=null){%>
		<table id="comment-tbl" align="center">			
				<% for(BoardAnswer ba : comment) {				
					if(ba.getCommentLevel()==1){%>			
				<tr>					
					<td id="writer-td" width="5%">
						<input type="hidden" value="<%=ba.getCommentNo()%>"/>
						<%=ba.getMemberId() %>
					</td>
					<td id="date-td"><%=ba.getBoardDate()%></td>
				</tr>
				<tr>
					<td width="80%">
						<%=(ba.getContent()).replace("\r\n", "<br>") %>
					</td>
					<td>
						<input type="button" id="commentDelete" value="삭제" onclick="location.href='<%=request.getContextPath()%>/QnA/commentDelete?commentNo=<%=ba.getCommentNo()%>'"/>												
					</td>
				</tr>
					<%}
				}%>
			</table>
		<% }%>
	</div>	
</div>
<%} %>
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

	$('#comment-btn').click(function(){
		$('#noticeView-section').css('style', {'height':'1500px'});
		$('#comment-container').toggle();		
	});

</script>

<%@ include file="/views/common/footer.jsp" %>