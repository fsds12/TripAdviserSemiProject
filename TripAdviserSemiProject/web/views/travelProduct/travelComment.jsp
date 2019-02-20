<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, tripAdviser.member.model.vo.Comment, tripAdviser.member.model.vo.Member"%>

<%
	List<Comment> list = (List<Comment>)request.getAttribute("commentList");
	Member m = (Member)session.getAttribute("loginMember");
	String id = "admin";
	int trvNo = (int)request.getAttribute("trvNo");
	int cPage = (int)request.getAttribute("cPage");
	String pageBar = (String)request.getAttribute("pageBar");
%>

<%for(int i=0; i<list.size(); i++) {%>
	<div class="comment-container" style="min-height:110px;">
		<div class='comment-profile'>
			<img src="<%=request.getContextPath() %>/images/travel_detail_imgs/profile_default.gif" alt="" width="74px" height="84px" style="margin: 1px" />
			<div class="comment-writer"><span><%=list.get(i).getMemberId() %></span></div>
		</div>
		<div class="comment-date">
			<span><sub><%=list.get(i).getCommentDate() %></sub></span>
		</div>
		<div class="comment-content-test" style="display: inline-block; width:743px;">
			<div class="comment-evaluation" style="display: block; padding-bottom: 1rem;">
				<%for(int j = 0; j < list.get(i).getTrvEvaluation(); j++) {%>
					<span class="starR on"></span>
				<%} %>
				<%for(int j=0; j < 5-list.get(i).getTrvEvaluation(); j++) {%>
					<span class="starR"></span>
				<%} %>
			</div>
			<div class="comment-content-view" style="display:flex; width:100%;">
				<div class="comment" style="display:inline-block; width:83%;">
					<%=list.get(i).getCommentContent() %>
				</div>
				<%if(id.equals("admin") || list.get(i).getMemberId().equals(id)) {%>
				<div class="comment-btn" style="display:inline-block; width:17%; text-align: center;">
					<button class='btn btn-primary' onclick="fn_comment_modify(<%=i %>, <%=list.get(i).getTrvEvaluation() %>)">수정</button> <button class='btn btn-light' onclick="fn_comment_delete(<%=list.get(i).getCommentNo() %>, <%=trvNo %>, <%=cPage %>)">삭제</button>
				</div>
				<%}else {%>
					<div class="comment-btn" style="display:inline-block; width:17%; text-align: center;">
						<span>&nbsp;</span>
					</div>
				<%} %>
			</div>
			<div class="comment-modify-view" style="display: none;">
				<form action="<%=request.getContextPath() %>/travel/travelCommentModify" method="post" style="display: inline-block;">
					<div style="display:block;">
						평점 :&nbsp;<input type="radio" name="evaluation" id="star1" value="1" />
						<label for="star1"><span class="starR on"></span></label>&nbsp;&nbsp;
						<input type="radio" name="evaluation" id="star2"  value="2" />
						<label for="star2"><span class="starR on"></span><span class="starR on"></span></label>&nbsp;&nbsp;
						<input type="radio" name="evaluation" id="star3" value="3" />
						<label for="star3"><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span></label>&nbsp;&nbsp;
						<input type="radio" name="evaluation" id="star4" value="4" />
						<label for="star4"><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span></label>&nbsp;&nbsp;
						<input type="radio" name="evaluation" id="star5" value="5"/> 
						<label for="star5"><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span></label>
					</div>
					<div style="display:flex;">
						<div class="comment-modify" style="display:inline-block; width:80%;">
							<input type="hidden" name="commentNo" value="<%=list.get(i).getCommentNo() %>" />
							<input type="hidden" name="trvNo" value="<%=trvNo %>" />
							<input type="hidden" name="commentWriter" value="" />
							<input type="hidden" name="cPage" value="<%=cPage %>" />
							<textarea name="comment" class="form-control" style="max-width: 657px; height: 100%; margin: 0;" cols="70" rows="2" maxlength="100"><%=list.get(i).getCommentContent() %></textarea>
						</div>
						<div class="comment-modify-btn" style="display:inline-block; width:20%; text-align: center;">
							<div>&nbsp;</div>
							<input type="submit" class="btn btn-primary btn-sm" value="코멘트수정" style="width:80px;" />
							<button class="btn btn-outline-danger btn-sm" style="width:48px;" onclick="return fn_comment_modify_cancel(<%=i %>);">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
<%} %>
<nav id="pageBar">
	<ul class="pagination justify-content-center">
		<%=pageBar %>
	</ul> 
</nav>