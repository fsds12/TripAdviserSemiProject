<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>
<%-- <%@ include file="/views/notice/nav.jsp" %> --%>

<section id="noticeWrite-section" class="notice-section">	
	<div class="caption">글수정</div>
    <table align="center" class="write-tbl">    	
         	<tr>
            	<th>작성자</th>
            	<td>                
               		<input type="text" name="userId" id="id" value=" admin" required/>
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
                <th>파일업로드</th>
                <td>
                 	<input type="file" name="fileUpload"/>
                </td>
            </tr>
            <tr>
                <th>파일업로드2</th>
                <td>
                 	<input type="file" name="fileUpload"/>
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