<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, tripAdviser.myPage.model.vo.MyPageComment" %>
<%
	@SuppressWarnings (value="unchecked")
	List<MyPageComment> myCommentList = (List<MyPageComment>)request.getAttribute("myCommentList");
	String pageBar = ""; 
	//String msg = (String)request.getAttribute("msg");
%>
<%if(myCommentList != null) {
	pageBar = (String)request.getAttribute("pageBar");
	int cPage = (Integer)request.getAttribute("cPage");
	String id = (String)request.getAttribute("id");
%>
<script>
	var id = "<%=id %>";
	var cPage = <%=cPage %>;
	function fn_change_page(pageNo) {
		$.ajax({
			url: "<%=request.getContextPath()%>/myPage/myComment?cPage=" + pageNo + "&id=" + id ,
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
	
	function fn_delete_comment() {
		$('.modal .close').click();
		var commentNo = $("#commentNoData").val();
		$.ajax({
			url: "<%=request.getContextPath()%>/myPage/myCommentDelete?cPage=" + cPage + "&id=" + id + "&commentNo=" + commentNo,
			type: "post",
			dataType: "html",
			success: function(data) {
				$("#my-comments").html(data);
			},
			error: function(request, status, error) {
				
			}
		});
	}
	
	function fn_delete_confirm(no) {
		var no = no;
		var commentNo = $("input[name=commentNo]").eq(no).val();
		$("#commentNoData").val(commentNo);
		$('#confirm-delete-comment').modal();
	}
</script>
<%} %>
<section id="myComment-section">
	<article id="myComment-container" style="width: 100%;">
	<div style="margin: auto; max-width:880px;">
	<%if(myCommentList != null) {%>
	<%for(int i=0; i<myCommentList.size(); i++) {%>
		<div class="comment-space" style="margin-bottom: 5px; padding:2px; border: 0.5px solid lightgray; border-radius:0px; max-width:880px; height: 110px;">
			<div class=""><h6>여행지제목: <span><a href="<%=request.getContextPath() %>/travel/travelProductDetail?trvNo=<%=myCommentList.get(i).getTrvNo() %>" style="text-decoration: none; color: black;"><%=myCommentList.get(i).getTrvTitle() %></a></span></h6></div>
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
				 <input type="hidden" name="commentNo" value="<%=myCommentList.get(i).getCommentNo() %>" />
				 <!-- <button class='btn btn-dark'>수정</button>  --><button class='btn btn-danger' onclick="fn_delete_confirm(<%=i %>)">코멘트 삭제</button>
				</div>
			</div>
		</div>
		<%} %>
		<nav id="pageBar">
			<%=pageBar %>
		</nav>
	<%}else{ %>
	<span>코멘트가없습니다!</span>
	<%} %>
	</div>
	</article>
</section>
<!-- The Modal -->
  <div class="modal" id="confirm-delete-comment">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title" style="font-weight: bold;">Message</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	이 코멘트를 삭제하시겠습니까?
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input type="hidden" id="commentNoData" value="" />
          <button type="button" class="btn btn-primary" id="delete-confirm" onclick="fn_delete_comment()">네 삭제합니다.</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">아니요.</button>
        </div>
        
      </div>
    </div>
  </div>