<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, tripAdviser.myPage.model.vo.MyPageComment" %>
<%
	@SuppressWarnings (value="unchecked")
	List<MyPageComment> myCommentList = (List<MyPageComment>)request.getAttribute("myCommentList");
	String pageBar = (String)request.getAttribute("pageBar");
	int cPage = (Integer)request.getAttribute("cPage");
	String id = (String)request.getAttribute("id");
%>
<script>
	function fn_change_page(pageNo) {
		$.ajax({
			url: "<%=request.getContextPath()%>/myPage/myComment?cPage=" + pageNo + "&id=" + 'admin' ,
			type: "post",
			dataType: "html",
			success: function(data) {
				$("#my-comments").html(data);
				var offset = $('.mypage-header').offset();
				$('html, body').animate({scrollTop:offset.top}, 0);
			},
			error: function(request, status, error) {
				
			}
		});
	}
</script>
<section id="myComment-section">
	<article id="myComment-container" style="width: 100%;">
	<div style="margin: auto; max-width:880px;">
	<%for(int i=0; i<myCommentList.size(); i++) {%>
		<div class="comment-space" style="margin-bottom: 5px; padding:2px; border: 1px solid black; max-width:880px; height: 110px;">
			<div class=""><h6>여행지제목: <span><%=myCommentList.get(i).getTrvTitle() %></span></h6></div>
			<div class="" style="margin-bottom: 5px;">별점: 
			<%for(int j = 0; j < myCommentList.get(i).getTrvEvaluation(); j++) {%>
				<span class="starR on"></span>
			<%} %>
			<%for(int j=0; j < 5-myCommentList.get(i).getTrvEvaluation(); j++) {%>
				<span class="starR"></span>
			<%} %>
			</div>
			<div class="" style="display: flex;">
				<div style="display: inline-block; width:85%; border:">
					<span><%=myCommentList.get(i).getCommentContent() %></span>
				</div> 
				 <div style="display: inline-block; width:15%; text-align: center;">
				 <button class='btn btn-dark'>수정</button> <button class='btn btn-danger'>삭제</button>
				</div>
			</div>
		</div>
		<%} %>
		<nav id="pageBar">
			<%=pageBar %>
		</nav>
	</div>
	</article>
</section>