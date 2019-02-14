<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>
<%-- <%@ include file="/views/notice/nav.jsp" %> --%>

<section id="noticeWrite-section" class="notice-section">	
	<div class="caption">글수정</div>
    <table align="center" class="write-tbl">    	
         	<tr>
            	<th>작성자</th>
            	<td>                
               		<input type="text" name="userId" id="id" value=" user01" required/>
            	</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                 	<input type="text" name="title" id="title"/>
                </td>
            </tr>             
            <tr>
                <th>내용</th>
                <td>
                 	<textarea></textarea>
                </td>
            </tr>
            <tr>
                <th>파일첨부</th>
                <td>
                 	<input type="file" name="up_file"/>
                </td>
            </tr>
            <tr>
                <th>파일첨부</th>
                <td>
                 	<input type="file" name="up_file"/>
                </td>
            </tr>         
        </table>  
    <div id="btn-container">
        <input type="button" value="등록" onclick="fn_submit()"/>
        <input type="button" value="취소" onclick="location.href='<%=request.getContextPath()%>/views/QnA/QnABoard.jsp'"/>
    </div>

</section>

<%@ include file="/views/common/footer.jsp" %>