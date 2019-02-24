<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tripAdviser.member.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("member");
%>
<script>
	function fn_profile_modify() {
		$('#profile-update-container').css('display','inline-block');
		var offset = $('#profile-update-container').offset();
		$('html, body').animate({scrollTop:offset.top}, 0);
	}
	function fn_profile_modify_close() {
		$('#profile-update-container').css('display','none');
		var offset = $('div.mypage-header').offset();
		$('html, body').animate({scrollTop:offset.top}, 0);
	}
	function fn_change_profile_img() {
		$('input[name=profile_up_file]').click();
		var formData = $('form[name=profile_img_frm]');
		$.ajax({
			url: "<%=request.getContextPath()%>/myPage/myProfileImageChange?id=" + "<%=m.getMemberId() %>" ,
			type: "post",
			data: formData,
			dataType: "text",
			success: function(data) {
				console.log(data);
			},
			error: function(request, status, error) {
				
			}
		});
	}
</script>
<section id='myProfile-view-container'>
<%if(m != null) {%>
	<article id="profile-container">
		<div id="profile-img-container">
			<div id="profile-img-space">
				<%-- <img class="img-thumbnail mx-auto d-block img-fluid" src="<%=request.getContextPath() %>/images/travel_detail_imgs/profile_default.gif" /> --%>
				<img id='profile-img' class="img-thumbnail mx-auto d-block img-fluid" src="<%=m.getMemberPictureUrl() %>" />
			</div>
			<div id="profile-img-btn-space">
				<button type="button" class="btn btn-secondary" onclick="fn_change_profile_img()">사진 변경</button> 
				<button type="button" class="btn btn-danger">제거</button>
				<div style="visibility:hidden">
					<form action="" name="profile_img_frm" method="post">
						<input type="file" name="profile_up_file" />
					</form>
				</div>
			</div>
		</div>
		<div id="profile-info-container">
			<div id="profile-info-space" style="height: 84%; padding-top:15px;">
				<div><div class="info-label">아이디</div> <div class="info-content"><%=m.getMemberId() %></div></div>
				<div><div class="info-label">이름</div> <div class="info-content"><%=m.getName() %></div></div>
				<div><div class="info-label">주소</div> <div class="info-content"><span><%=m.getAddress() %> <%=m.getAddressDetail() %></span></div></div>
				<div><div class="info-label">이메일</div> <div class="info-content"><%=m.getEmail() %></div></div>
				<div><div class="info-label">연락처</div> <div class="info-content"><%=m.getPhone() %></div></div>
				<div><div class="info-label">회원등급</div> <div class="info-content"><%=m.getMemberGrade() %></div></div>
				<div><div class="info-label">가입일</div> <div class="info-content"><%=m.getEnrollDate() %></div></div>
			</div>
			<div id="profile-modify-btn-space">
				<button type="button" class="btn btn-secondary" onclick="fn_profile_modify()">내 정보 수정</button>
			</div>
		</div>
	</article>
	<article id="profile-update-container">
		<button type="button" class="btn btn-secondary" onclick="fn_profile_modify_close()">수정Article 닫기</button>
	</article>
<%}%>
</section>