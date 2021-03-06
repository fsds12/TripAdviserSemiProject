<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, tripAdviser.member.model.vo.Comment, tripAdviser.member.model.vo.Member"%>

<%
	@SuppressWarnings (value="unchecked")
	List<Comment> list = (List<Comment>)request.getAttribute("commentList");
	Member m = (Member)session.getAttribute("loginMember");
	String id = "";
	if(m != null) {
		id = m.getMemberId();
	}
	int trvNo = (int)request.getAttribute("trvNo");
	int cPage = (int)request.getAttribute("cPage");
	String pageBar = (String)request.getAttribute("pageBar");
%>

<div id="comment-space">
		<%if(list.size() > 0) {	//이 여행상품에 코멘트가있을시 값들을 로드한다.%>
		<%for(int i=0; i<list.size(); i++) {%>
			<div class="comment-container" style="min-height:110px;">
				<div class='comment-profile'>
					<%-- <img src="<%=request.getContextPath() %>/images/travel_detail_imgs/profile_default.gif" alt="" width="74px" height="84px" style="margin: 1px" /> --%>
					<img src="<%=request.getContextPath() %>/images/myPage_imgs/<%=list.get(i).getMemberPictureUrl() %>" alt="" width="74px" height="84px" style="margin: 1px" />
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
							<button class='btn btn-primary' onclick="fn_comment_modify(<%=i %>, <%=list.get(i).getTrvEvaluation() %>)">수정</button> <button class='btn btn-light' onclick="fn_comment_modal_delete(<%=list.get(i).getCommentNo() %>, <%=trvNo %>, <%=cPage %>)">삭제</button>
						</div>
						<%}else {%>
							<div class="comment-btn" style="display:inline-block; width:17%; text-align: center;">
								<span>&nbsp;</span>
							</div>
						<%} %>
					</div>
					<div class="comment-modify-view" style="display: none;">
						<form name="comment-modify-frm" method="post" style="display: inline-block;">
							<div style="display:block;">
								평점 :&nbsp;<input type="radio" name="evaluation" id="star<%=i %>1" value="1" />
								<label for="star<%=i %>1"><span class="starR on"></span></label>&nbsp;&nbsp;
								<input type="radio" name="evaluation" id="star<%=i %>2"  value="2" />
								<label for="star<%=i %>2"><span class="starR on"></span><span class="starR on"></span></label>&nbsp;&nbsp;
								<input type="radio" name="evaluation" id="star<%=i %>3" value="3" />
								<label for="star<%=i %>3"><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span></label>&nbsp;&nbsp;
								<input type="radio" name="evaluation" id="star<%=i %>4" value="4" />
								<label for="star<%=i %>4"><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span></label>&nbsp;&nbsp;
								<input type="radio" name="evaluation" id="star<%=i %>5" value="5"/> 
								<label for="star<%=i %>5"><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span></label>
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
									<input type="button" class="btn btn-primary btn-sm" style="width:85px;" value="코멘트수정" onclick="fn_comment_modify_ajax(<%=i %>)" />
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
		<%} %>
		</div>