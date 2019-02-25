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
	
	var file=document.querySelector('input[name=profile_up_file]');
	
	file.onchange = function(){
		var fileList = file.files;
		var reader = new FileReader();
		reader.readAsDataURL(fileList[0]);
		//로드 한 후
		reader.onload = function(){
			document.querySelector('#profile-img').src=reader.result;
		};	
	};
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
				<button type="button" id="up_file" class="btn btn-secondary" onclick="fn_change_profile_img()">사진 변경</button> 			
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
	<article id="profile-update-container" class="container">
		<button type="button" class="btn btn-secondary" onclick="fn_profile_modify_close()">수정Article 닫기</button>
		
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">회원정보수정</h5>
                        <form action="<%=request.getContextPath() %>/mypage/profileupdate" class="form-signin" method="POST">
                            <div class="form-label-group">
                                <input type="text" id="inputEmail" name="inputEmail" class="form-control" placeholder="아이디" value="<%=m.getMemberId()%>"
                                    readonly>
                                <label for="inputEmail">아이디</label>
                            </div>

                           
                            
                            <div class="form-label-group">
                                <input type="email" id="email" name="email" class="form-control" placeholder="이메일"
                                    required>
                                <label for="email">이메일</label>
                                <button type="button" id="cknumbergo" onclick="emailgo()"
											class="btn btn-secondary">인증번호 &nbsp보내기</button>
                            </div>
                            
                            <div class="form-label-group">
                                <input type="text" id="name" name="name" class="form-control" placeholder="이름"
                                   value="<%=m.getName()%>" readonly>
                                <label for="name">이름</label>
                            </div>
                            
                            <div class="form-label-group">
                                <input type="text" id="postal-code" name="postal-code" class="form-control" placeholder="우편번호"
                                    required>
                                <label for="postal-code">우편번호</label>
                            </div>
                            
                            <div class="form-label-group">
                                <input type="text" id="address" name="address" class="form-control" placeholder="주소"
                                    required>
                                <label for="address">주소</label>
                            </div>
                            
                            <div class="form-label-group">
                                <input type="text" id="address2" name="address2" class="form-control" placeholder="상세주소"
                                    required>
                                <label for="address2">상세주소</label>
                            </div>
                            
                            <div class="btn-group">
                          <button type="button" id="pwChange" name="pwChange" onclick="changePw()" class="btn btn-secondary">비밀번호변경</button>                       
                            
                           </div>
          
                            <div class="btn-container">
                            <button class="btn btn-lg btn-secondary text-uppercase" id="profileupdate" type="submit">정보수정</button>
                            <br>
                            </div>
                            
                           <input type="hidden" readonly="readonly" name="code_check"
										id="code_check" value="<%=getRandom()%>" />
									<%!public String getRandom() {
										int random = 0;
										random = (int) Math.floor((Math.random() * (99999 - 10000 + 1))) + 100000;
										return String.valueOf(random);
	}%>
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
    <script>
                    function changePw(){
                    var url="<%=request.getContextPath()%>/changePassword?userId=<%=m.getMemberId()%>";
                    var title="ChangePassword";
                    var option="left=300px, top=300px,width=500px,height=500px";
                    var popup=window.open(url,title,option);
                    }
                    
                    function emailgo(){
                    	var email=$("#email").val().trim();
            			var code=$("#code_check").val();
            			console.log(email);
            			console.log(code);
            			var url="<%=request.getContextPath()%>/mypageemail";
            			var title="인증번호";
            			var option="left=500px, top=100px, width=300px, height=200px, menubar=no, status=no, scrollbars=yes";
            			var popup=window.open("",title,option);
            			emailgoFrm.email.value=email;
            			emailgoFrm.code_check.value=code;
            			emailgoFrm.target=title;
            			emailgoFrm.action=url;
            			emailgoFrm.method="post";
            			emailgoFrm.submit();
                    }
                    </script>
	</article>
<%}%>
</section>