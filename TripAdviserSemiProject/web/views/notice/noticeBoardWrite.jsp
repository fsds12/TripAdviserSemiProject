<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>     
<%-- <%@ include file="/views/notice/nav.jsp" %> --%>    

<section id="noticeWrite-section" class="notice-section">	
	<div class="caption">글쓰기</div>
    <table align="center" class="write-tbl">    	
         	<tr>
            	<th>작성자</th>
            	<td>                
               		<input type="text" name="userId" value="admin" readonly/>
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
                 	<textarea name="content"></textarea>
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
		location.href="<%=request.getContextPath()%>/notice/insertNotice";
	}
	function fn_cancle(){
		alert("취소하시겠습니까?");
		location.href="<%=request.getContextPath()%>/notice/noticeList";
	}
</script>    


<%@ include file="/views/common/footer.jsp" %>