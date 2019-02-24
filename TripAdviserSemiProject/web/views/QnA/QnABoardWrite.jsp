<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>    

<section id="noticeWrite-section" class="notice-section">	
	<div class="caption">글쓰기</div>
	<form name="qnaWriteFrm" action="<%=request.getContextPath()%>/QnA/insertQnA" method="post">
    <table align="center" class="write-tbl">    	
         	<tr>
            	<th>작성자</th>
            	<td>                
               		<input type="text" name="userId" value="semi" readonly/>               		
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
                 	<textarea name="content" id="content"></textarea>
                </td>
            </tr>                    
        </table>  
    <div id="btn-container">
        <input type="submit" value="등록" onclick="fn_submit()"/>
        <input type="button" value="취소" onclick="fn_cancle()"/>
    </div>
    </form>
</section>
<script>
	
	function fn_cancle(){
		alert("취소하시겠습니까?");
		location.href="<%=request.getContextPath()%>/QnA/QnAList";
	}
	
	$(function(){
		var text=document.getElementById('content');
		text.value+="관리자와 글쓴사람만 볼 수 있음";
		
	})
</script> 

<%@ include file="/views/common/footer.jsp" %>