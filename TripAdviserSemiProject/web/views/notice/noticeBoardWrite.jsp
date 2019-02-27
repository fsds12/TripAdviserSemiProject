<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>
<style>
	div#cAlert{
		width: 90%;
		display: none; 
	}
	div#tAlert{
		width: 90%;
		display: none; 
	}
</style>
<section id="noticeWrite-section" class="notice-section">	
	<div class="caption">글쓰기</div>
	<form name="noticeWriteFrm" action="insertNotice"  method="post">
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
                 	<input type="text" name="title" required placeholder="제목을 입력하세요"/>                 	
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
        <input type="submit" value="등록" id="submit-btn"/>
        <input type="button" value="취소" onclick="fn_cancle()"/>
    </div>
    </form>
</section>
<script>
	$('#submit-btn').on('click', function(){
		if(confirm('등록?')){
			location.href="<%=request.getContextPath()%>/notice/insertNotice";
		}else{
			return;
		}		
	}}	
	
	function fn_cancle(){
		if(confirm('취소하시겠습니까')){
			location.href="<%=request.getContextPath()%>/notice/noticeList";
		}else{
			return;
		}		
	}
	
</script>    


<%@ include file="/views/common/footer.jsp" %>