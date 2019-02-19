<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="tripAdviser.board.model.vo.Board"%>
<%
	Board b=(Board)request.getAttribute("Board");
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>

<section id="noticeWrite-section" class="notice-section">	
	<div class="caption">글수정</div>
    <table align="center" class="write-tbl">    	
         	<tr>
            	<th>작성자</th>
            	<td>                
               		<input type="text" name="userId" id="id" value="<%=b.getMemberId()%>" required/>
            	</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                 	<input type="text" name="title" id="title" value="<%=b.getTitle()%>"/>
                </td>
            </tr>             
            <tr>
                <th>내용</th>
                <td>
                 	<textarea><%=b.getContent() %></textarea>
                </td>
            </tr>                     
        </table>  
    <div id="btn-container">
        <input type="button" value="등록" onclick="fn_submit()"/>
        <input type="button" value="취소" onclick="fn_cancle()"/>
    </div>
</section>

<script>
	function fn_submit(){
		alert("등록하시겠습니까?");
		
	}
	function fn_cancle(){
		location.href="<%=request.getContextPath()%>/notice/noticeList";
	}
</script>


<%@ include file="/views/common/footer.jsp" %>