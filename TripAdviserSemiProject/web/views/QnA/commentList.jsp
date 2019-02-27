<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, tripAdviser.board.model.vo.*" %>
<%@ page import="tripAdviser.member.model.vo.Member" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">

<%
	Member loginMember=(Member)session.getAttribute("loginMember");
	Board b=(Board)request.getAttribute("Board"); 
	List<BoardAnswer> comment=(List)request.getAttribute("comment");	
	int cPage=(int)request.getAttribute("cPage");
	int numPerPage=(int)request.getAttribute("numPerPage");
	String pageBar=(String)request.getAttribute("pageBar");
%>
<style>
	/* 답글 */	
section#noticeView-section div#comment-container{	
	width:100%; height: 100px;
	display: none;
	/* border: 1px solid lightblue;	 */
}
table#comment-tbl{
		border: 1px solid lightgrey;
	}
div#comment-box{
	margin-top: 10px;
}
textarea#cContent{ 
	margin-top: 10px;
	margin-left: auto;
	height: 80px; width: 800px;
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
	width: 100%; height: 200px;
	/* border: 1px solid lightgrey; */	
	text-align: left;
	margin: auto;
}
table#comment-tbl{	
	width: 80%; height: 200px;	
}
td#date-td{
	font-size: 10px;
}
td#writer-td{
	width: 5%;
}
div.donotShow{
	width:50%; height: 200px;	
	margin: auto;
	text-align: center;
	padding-top: 100px;
}
tr#first-tr{
	height: 40px;
	border-bottom: 1px solid lightgrey;
}
button#returnBtn{
	border: 1px solid gainsboro;
    background-color: white;
    width: 50px; height: 30px;
    cursor: pointer;
    margin: auto;   
    border-radius: 10%; 
}
button#returnBtn:hover{
	
    background-color: whitesmoke;
   
}
</style>
<section>
<%-- <%if(loginMember!=null&&(b.getMemberId().equals(loginMember.getMemberId())||"admin".equals(loginMember.getMemberId()))){ %> --%>
	
	<div id="comment-container">				
		<form action="<%=request.getContextPath()%>/QnA/insertComment">
			<table align="center">
				<tr>
					<td>			
						<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>"/>
						<input type="hidden" name="memberId" value="admin"/>
						<textarea id="cContent" name="commentContent"></textarea>
						<input type="hidden" name="commentLevel" value="1"/>
						<input type="hidden" name="commentRef" value="0"/>					
						<button type="submit" id="comment-btn">등록</button>
					</td>
				</tr>
			</table>			
		</form>
	</div>
	<%if(comment!=null){%>
		<%for(BoardAnswer ba : comment) {  %>				
			
	<div id="comment-box">	
		<table id="comment-tbl" align="center">
		<%if(ba.getCommentLevel()==1){%>											
				<tr id="first-tr">					
					<td id="writer-td">						
						<%=ba.getMemberId() %>
					</td>
					<td id="date-td">						
						<%=ba.getBoardDate()%>
						<input type="hidden" value="<%=ba.getCommentNo()%>"/>
					</td>
				</tr>
				<tr>
					<td width="80%">
						<%=(ba.getContent()).replace("\r\n", "<br>") %>
					</td>
					<td>
						<input type="button" id="commentDelete" value="삭제" onclick="location.href='<%=request.getContextPath()%>/QnA/commentDelete?commentNo=<%=ba.getCommentNo()%>'"/>												
					</td>
				</tr>
				<%}%>
			</table>				
			<%} %>						
		</div>				
		<div id="paging-container"> 
            <ul class="pagination pagination-sm justify-content-center">
    			<%=pageBar %>
  			</ul>            
   		</div>		
		<%} %>	
	</div>
<%-- <%} %> --%>
</section>