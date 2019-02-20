<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="tripAdviser.board.model.vo.Board"%>
<%
	Board b=(Board)request.getAttribute("Board");
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>

<section id="noticeWrite-section" class="notice-section">	
	<div class="caption">글수정</div>
	<form action="<%=request.getContextPath()%>/notice/noticeUpdateEnd" method="post">
    <table align="center" class="write-tbl">    	
         	<tr>
         		
            	<th>작성자</th>
            	<td>                
               		<input type="text" name="userId" value="<%=b.getMemberId()%>" required/>
               		<input type="hidden" name="boardNo" value="<%=b.getBoardNo()%>"/>
            	</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                 	<input type="text" name="title" value="<%=b.getTitle()%>"/>
                </td>
            </tr>             
            <tr>
                <th>내용</th>
                <td>
                 	<textarea name="content"><%=b.getContent() %></textarea>
                </td>
            </tr>                                 
        </table>  
    <div id="btn-container">
        <input type="submit" value="수정"/>
        <input type="button" value="취소" onclick="fn_cancle()"/>                
    </div>
    </form>
</section>

<script>
	/* function fn_submit(){
		alert("수정하시겠습니까?");
		
	} */
	function fn_cancle(){
		location.href="<%=request.getContextPath()%>/notice/noticeList";
	}
</script>


<%@ include file="/views/common/footer.jsp" %>