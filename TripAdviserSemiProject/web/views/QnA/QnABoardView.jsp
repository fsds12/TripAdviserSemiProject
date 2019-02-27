<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, tripAdviser.board.model.vo.*" %>
<%@ include file="/views/common/header.jsp" %>
<% 
	Board b=(Board)request.getAttribute("Board"); 
	List<BoardAnswer> comment=(List)request.getAttribute("comment");
	Member m = (Member)session.getAttribute("loginMember");
	int cPage=(int)request.getAttribute("cPage");
	int numPerPage=(int)request.getAttribute("numPerPage");
	String pageBar=(String)request.getAttribute("pageBar");
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
	button#commentinsert-btn{
		border: 1px solid gainsboro;
    	background-color: white;
    	width: 50px; height: 30px;
    	cursor: pointer;
    	margin: auto;    	
    	border-radius: 10%;    	
	}
table#noticeView-tbl th{
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
	/* 답글 */	
section#noticeView-section div#comment-container{	
	width:100%; height: 100px;
	display: none;
	
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
	width: 40%;
}
td#writer-td{
	width: 40%;
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
section#commentSection{

	height:700px;
}
textarea#contentUpdate{
	display: none;
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
				<th class="title-th" width="10%">제목</th>
				<td colspan="3" class="title-td"><%=b.getTitle()%></td>
			</tr>
			<tr height="20px">
				<th class="writer-th" width="10%">작성자</th>
				<td id="writer-td"><%=b.getMemberId()%></td>
				<th class="date-th">작성일</th>
				<td id="date-td"><%=b.getBoardDate() %></td>
			</tr>
			<tr>
				<th height="350px" class="content-th" width="10%">내용</th>
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
			<button type="button" onclick="fn_return()" id="returnBtn">목록</button>
		</div>		
	<%} %>

	<%if(loginMember!=null&&(b.getMemberId().equals(loginMember.getMemberId())||"admin".equals(loginMember.getMemberId()))){ %>	
	<div id="comment-container">				
		<form name="commentFrm" action="<%=request.getContextPath()%>/QnA/insertComment">
			<table align="center">
				<tr>
					<td>			
						<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>"/>
						<input type="hidden" name="memberId" value="admin"/>
						<textarea id="cContent" name="commentContent"></textarea>
						<input type="hidden" name="commentLevel" value="1"/>
						<input type="hidden" name="commentRef" value="0"/>					
						<button type="submit" id="commentinsert-btn">등록</button>
					</td>
				</tr>
			</table>			
		</form>
	</div>
<%if(comment!=null){
		for(BoardAnswer ba : comment) {  %>
		<%if(ba.getCommentLevel()==1){%>			
			<div id="comment-box">	
			<table id="comment-tbl" align="center">
															
					<tr id="first-tr">					
						<td id="writer-td"><%=ba.getMemberId() %></td>						
						<td id="date-td">
							<%=ba.getBoardDate()%>
							<input type="hidden" value="<%=ba.getCommentNo()%>"/>						
						</td>
					</tr>
					<tr>
						<td width="80%">
							<%=(ba.getContent()).replace("\r\n", "<br>")%>
							<textarea id="contentUpdate"></textarea>
						</td>
						
						<td>
							<input type="button" id="commentDelete" value="삭제" onclick="location.href='<%=request.getContextPath()%>/QnA/commentDelete?commentNo=<%=ba.getCommentNo()%>'"/>												
							<!-- <input type="button" id="commentUpdate" value="수정" onclick="fn_commentUpdate()"/> -->
						</td>
					</tr>
				
			</table>
			</div>
			<%}%>				
		<%} %>					
	<%} %>
<%if(comment.size() > 0){ %>
		<div>
			<%=pageBar %>
		</div> 
	<%} %> 	
	</div>
	
		
   		
<%} %>

</section>	
<script>
	/* function fn_commentUpdate(){
		var btn=$('#commentUpdate');
		var ta=$('#contentUpdate');
		btn.on("click", function(){
			ta.css('display', 'inline-block');
		});
		
	} */

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
		
		$('#comment-container').toggle();	
		
	});
	
	$('#commentinsert-btn').click(function(){
		var con=confirm("등록하시겠습니까?");
		if(con==true){
			$("form[name=commentFrm]").submit();
		}
	});

</script>

<%@ include file="/views/common/footer.jsp" %>