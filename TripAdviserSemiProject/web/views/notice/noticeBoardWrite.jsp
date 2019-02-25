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
                 	<input type="text" name="title" required="제목을 입력하세요"/>
                 	<div class="alert alert-warning alert-dismissible" id="tAlert">제목을 입력해주세요</div>
                </td>
            </tr>             
            <tr>
                <th>내용</th>
                <td>
                 	<textarea name="content" id="content" required="내용을 입력하세요"></textarea>
                 	<div class="alert alert-warning" id="cAlert">내용을 입력해주세요</div>
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
	<%-- function fn_submit(){		
		alert("등록하시겠습니까?");
		location.href="<%=request.getContextPath()%>/notice/insertNotice";
	} --%>
	/* $('[name=noticeWriteFrm]').on('click', function(){
		var len=$('text[name=text]'.trim().length);
		var len2=$('textarea[name=content]'.trim().length);
		if(len==0){
			$('#tAlert').css('display', 'inline-block');
			$('text[name=text]').focus();
		}
		if(len2==0){
			$('#cAlert').css('display', 'inline-block');
		};
		
	}) */		
	
	function fn_cancle(){
		if(confirm('취소하시겠습니까')){
			location.href="<%=request.getContextPath()%>/notice/noticeList";
		}else{
			return;
		}		
	}
	
</script>    


<%@ include file="/views/common/footer.jsp" %>