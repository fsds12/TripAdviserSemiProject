<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginMember");
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>
<script>
	
	function fn_cancle(){
		if(confirm('취소하시겠습니까?')){
			location.href="<%=request.getContextPath()%>/QnA/QnAList";
		}else{
			return;
		}		
	}	
</script>     

<section id="noticeWrite-section" class="notice-section">	
	<div class="caption">글쓰기</div>
	<form name="qnaWriteFrm" action="<%=request.getContextPath()%>/QnA/insertQnA" onsubmit="return fn_validate()" method="post">
    <table align="center" class="write-tbl">    	
         	<tr>
            	<th>작성자</th>
            	<td>                
               		<input type="text" name="userId" value="<%=loginMember.getMemberId()%>" readonly/>               		
            	</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                 	<input type="text" name="title" id="title" required placeholder="제목을 입력하세요"/>
                </td>
            </tr>             
            <tr>
                <th>내용</th>
                <td>
                 	<textarea name="content" id="content" required placeholder="내용을 입력하세요"></textarea>
                </td>
            </tr>                    
        </table>  
    <div id="btn-container">
        <input type="submit" value="등록" onclick="fn_submit()"/>
        <input type="button" value="취소" onclick="fn_cancle()"/>
    </div>
    </form>
</section>


<%@ include file="/views/common/footer.jsp" %>