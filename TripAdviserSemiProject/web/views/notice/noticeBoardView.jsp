<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<%@ include file="/views/common/header.jsp" %>
<%-- <%@ include file="/views/notice/nav.jsp" %> --%>

<section id="noticeView-section" class="notice-section">
	<div class="caption">
		<img src="<%=request.getContextPath()%>/images/notice.png" width="800px"/>
	</div>        
	<table class="noticeView-tbl" align="center">
		<tr height="60px">
			<td colspan="2" id="title-td">홈페이지 서비스 중단</td>
		</tr>
		<tr height="20px">
			<td id="writer-td">admin</td>
			<td id="date-td">19.02.12</td>
		</tr>
		<tr>
			<td colspan="2" id="content-td">
				<p>
					시스템 자료백업으로 인하여 홈페이지 서비스가 아래와 같이 중단 되오니 참고하시기 바랍니다.<br>

					- 중단일시 : 2019. 2. 12.(화) 18:30 ~ 2. 13(수) 09:00<br>

					- 중단서비스 <br>

						: 볼거리, 먹거리<br>

					* 문의처 : tripAdviser 개발팀<br>
				</p>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="30px" id="btn-td">
				<input type="button" value="삭제" onclick="fn_delete()"/>
				<input type="button" value="수정" onclick="fn_update()"/>
				<input type="button" value="목록" onclick="fn_return()"/>           	
			</td>
		</tr>
	</table>  
</section>
<script>
	function fn_return(){
		location.href="<%=request.getContextPath()%>/notice/noticeList";
	}	
	function fn_update(){
		alert("수정하시겠습니까?");
		location.href="<%=request.getContextPath()%>/notice/updateNotice";
	}
	function fn_delete(){
		alert("삭제하시겠습니까?");
		location.href="<%=request.getContextPath()%>/notice/deleteNotice";
	}
</script>

<%@ include file="/views/common/footer.jsp" %>