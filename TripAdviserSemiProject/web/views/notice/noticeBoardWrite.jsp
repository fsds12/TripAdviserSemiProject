<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>
<style>
	div#alert{
		width: 90%;
		display: none; 
	}
</style>
<section id="noticeWrite-section" class="notice-section">	
	<div class="caption">글쓰기</div>
    <table align="center" class="write-tbl">
         	<tr>
            	<th>작성자</th>
            	<td>                
               		<input type="text" name="userId" ID="userId" value="admin"/>
            	</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                 	<input type="text" name="title" id="title"/>
                 	<div class="alert alert-warning alert-dismissible" id="alert">제목을 입력해주세요</div>
                </td>
            </tr>             
            <tr>
                <th>내용</th>
                <td>
                 	<textarea name="content" id="content"></textarea>
                 	<div class="alert alert-warning" id="alert">내용을 입력해주세요</div>
                </td>
            </tr>                     
        </table>  
    <div id="btn-container">
        <input type="button" value="등록" onclick="fn_submit()" data-toggle="modal" data-target="#myModal"/>
        <input type="button" value="취소" onclick="fn_cancle()" data-toggle="modal" data-target="#myModal"/>
    </div>
</section>
<script>
	function fn_submit(){
		var title=document.getElementById('#title');
		var content=document.getElementById('#content');
		
		alert("등록하시겠습니까?");
		location.href="<%=request.getContextPath()%>/notice/insertNotice";
	}
	function fn_cancle(){
		alert("취소하시겠습니까?");
		location.href="<%=request.getContextPath()%>/notice/noticeList";
	}
	
</script>    


<%@ include file="/views/common/footer.jsp" %>