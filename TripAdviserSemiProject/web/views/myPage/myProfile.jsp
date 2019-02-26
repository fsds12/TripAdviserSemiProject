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
		<%-- $.ajax({
			url: "<%=request.getContextPath()%>/myPage/myProfileImageChange?id=" + "<%=m.getMemberId() %>" ,
			type: "post",
			data: formData,
			dataType: "text",
			success: function(data) {
				console.log(data);
			},
			error: function(request, status, error) {
				
			}
		}); --%>
		
	}
	
	var file=document.querySelector('input[name=profile_up_file]');
	
	file.onchange = function(){
		var fileList = file.files;
		var reader = new FileReader();
		reader.readAsDataURL(fileList[0]);
		//로드 한 후
		reader.onload = function(){
			document.querySelector('#profile-img').src=reader.result;
			/* fn_img_save(); */
			uploadFile();
		};
	};
	
	
	function fn_img_save(){
		var url="<%=request.getContextPath()%>/myPage/myProfileImageChange";
		var id="<%=m.getMemberId()%>";
		
		profile_img_frm.hiddenid.value=id;
		profile_img_frm.method="post";
		profile_img_frm.action=url;
		profile_img_frm.submit();
	}
	
	function uploadFile(){
		var form=$('#FILE_FORM')[0];
		var formData = new FormData(form);
		formData.append("fileObj",$("#FILE_TAG")[0].files[0]);
		
		$.ajax({
			url:"<%=request.getContextPath()%>/myPage/myProfileImageChange",
			processData:false,
			contentType:false,
			data : formData,
			type:'POST',
			success : function(result){				
			}			
		});
	}

	function picturedelete(){
		var flag=confirm("삭제하시겠습니까?");
		
		
		if(flag){
		$.ajax({
			url:"<%=request.getContextPath()%>/myPage/imagedelete",
			data : {"id":"<%=m.getMemberId()%>"},
			type:'POST',
			success: function(result){
				defaultImage();
				
			}
			
		});
		
		}
		
	}
	
	function defaultImage(){
		document.querySelector('#profile-img').src="<%=request.getContextPath()%>/images/travel_detail_imgs/profile_default.gif";
	}

	
</script>
<section id='myProfile-view-container'>
<%if(m != null) {%>
	<article id="profile-container">
		<div id="profile-img-container">
			<div id="profile-img-space">
				<%-- <img class="img-thumbnail mx-auto d-block img-fluid" src="<%=request.getContextPath() %>/images/travel_detail_imgs/profile_default.gif" /> --%>
				<img id='profile-img' class="img-thumbnail mx-auto d-block img-fluid" src="<%=request.getContextPath()%>/images/myPage-imgs/<%=m.getMemberPictureUrl() %>"/>
			</div>
			<div id="profile-img-btn-space">
				<button type="button" id="up_file" class="btn btn-secondary" onclick="fn_change_profile_img()">사진 변경</button>
				<!-- <button type="button" id="filesave" class="btn btn-secondary" onclick="fn_img_save()">저장</button> --> 				
				<button type="button" onclick="picturedelete()" class="btn btn-danger">제거</button>
				<div style="visibility:hidden">
					<form action="" name="profile_img_frm" id="FILE_FORM" method="post" enctype="multipart/form-data">
						<input type="hidden" name="hiddenid"/>
						<input type="file" id="FILE_TAG" name="profile_up_file" />
					</form>
					
				</div>
			</div>
		</div>
		<script>
		
		</script>
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
				<button type="button" class="btn btn-secondary" onclick="fn_withdrawal()">회원 탈퇴</button>
				<button type="button" class="btn btn-secondary" onclick="fn_profile_modify()">내 정보 수정</button>
			</div>
		</div>
	</article>
	<article id="profile-update-container" class="container">
		
		
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">회원정보수정</h5>
                        <form action="<%=request.getContextPath() %>/mypage/profileupdate" onsubmit="return formstrans();" class="form-signin" method="POST">
                            <div class="form-label-group">
                                <input type="text" id="inputEmail" name="inputEmail" class="form-control" placeholder="아이디" value="<%=m.getMemberId()%>"
                                    readonly>
                                <label class="inputlabel" for="inputEmail">아이디</label>
                            </div>
							
                           
                            
                            <div class="form-label-group">
                                <input type="email" id="email" name="email" class="form-control" placeholder="이메일" value="<%=m.getEmail() %>"
                                    required>
                                <label id="emaillabel" class="inputlabel" for="email">이메일</label>
                                
                                <button type="button" id="cknumbergo" onclick="emailgo()"
											class="btn btn-outline-light text-dark">인증번호 보내기</button>
											<span style="display: inline-block; font-size: 9px;">&nbsp;회원정보를 수정하려면 이메일 인증을 받아야 합니다.</span>
                            </div>
                            
                            <div class="form-label-group">
										<input type="text" id="cknumber" name="cknumber"
											class="form-control" placeholder="인증번호"> <label class="inputlabel" 
											for="cknumber">인증번호</label>
										<button type="button" id="cknumbere"
											class="btn btn-outline-light text-dark">인증번호 확인</button>
										<input type="hidden" id="united2" value="0" />
									</div>
                            
                            <div class="form-label-group">
                                <input type="text" id="name" name="name" class="form-control" placeholder="이름"
                                   value="<%=m.getName()%>" readonly>
                                <label for="name">이름</label>
                            </div>
                            
                            <div class="form-label-group">
                                <input type="text" id="postal-code" name="postal-code" readonly class="form-control" placeholder="우편번호" value="<%=m.getPostalCode() %>"
                                    required>
                                <label for="postal-code">우편번호</label>
                                <button type="button" id="postalbutton" onclick="sample4_execDaumPostcode()" class="btn btn-outline-light text-dark">우편번호 검색</button>
											
                            </div>
                            
                            <div class="form-label-group">
                                <input type="text" id="address" name="address" class="form-control" readonly placeholder="주소" value="<%=m.getAddress() %>"
                                    required>
                                <label for="address">주소</label>
                            </div>
                            
                            <div class="form-label-group">
                                <input type="text" id="address2" name="address2" class="form-control" placeholder="상세주소" value="<%=m.getAddressDetail() %>"
                                    required>
                                <label id="address2label" class="inputlabel" for="address2">상세주소</label>
                            </div>
                            
                            <div class="btn-group">
                           </div>          
                            <div class="btn-container">
                            <button type="button" id="pwChange" name="pwChange" onclick="changePw()" class="btn btn-secondary">비밀번호변경</button>                                            
                            <button class="btn btn-lg btn-secondary text-uppercase" id="profileupdate" type="submit">정보수정</button>
                            <button type="button" class="btn btn-secondary" onclick="fn_profile_modify_close()">취소</button>
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
                    <form name="emailgoFrm" method="post">
					<input type="hidden" name="email" /> <input type="hidden"
						name="code_check" />
				</form>
				<form name="withFrm" method="post">
				<input type="hidden" name="userId" id="userId" value="<%=m.getMemberId()%>">
				
				</form>
                </div>
            </div>
        </div>
    <script>
    
    				$("#cknumbere").click(function(){
    					var number=$("#cknumber").val().trim();
    					var code=$("#code_check").val();
    		       		var flag=$("#united").val();
    		       		if(number!=code){
    		       			alert("인증번호가 일치하지 않습니다.");
    		       			flag=$("#united").val(0);
    		       			console.log(flag.val());
    		       			$("#cknumber").val("");
    		       			$("#cknumber").focus();
    		       			return flag;
    		       		}else{
    		       			alert("인증번호가 일치합니다.");
    		       			flag=$("#united2").val(1);       			
    		       			console.log(flag.val());
    		       			return flag;
    		       		}
				
    				})
    
    
    
    
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
                    function formstrans(){
                    	var tfnumber=$("#united").val();         ;           	
                    	if(tfnumber==0){
                    		alert("인증번호를 확인해주세요");
                    		return false;
                    	}else if(tfnumber==1){
                    		return true;                    		
                    	}                   	
                    }                    
                     function fn_withdrawal(){
                    	
                    	var flag=confirm("정말루 탈퇴하시겠어여?");
             			if(flag)
             			{
             			location.href="<%=request.getContextPath()%>/member/with?userId=<%=m.getMemberId()%>";	
             			}
                     }
                     
                     $("#emaillabel").click(function(){
                    	 $("#email").val("");
                     });
                     $("#email").click(function(){
                    	 $("#email").val("");
                     });
                     $("#address2label").click(function(){
                    	 $("#address2").val("");
                     });
                     $("#address2").click(function(){
                    	 $("#address2").val("");
                     })
                     
                     
                    </script>
                    
                    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                    <script>
                    function sample4_execDaumPostcode() {
                        new daum.Postcode({
                            oncomplete: function(data) {
                                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                var roadAddr = data.roadAddress; // 도로명 주소 변수
                                var extraRoadAddr = ''; // 참고 항목 변수

                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                    extraRoadAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if(extraRoadAddr !== ''){
                                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                                }

                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                document.getElementById('postal-code').value = data.zonecode;
                                document.getElementById("address").value = roadAddr;
                                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                                
                                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                                if(roadAddr !== ''){
                                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                                } else {
                                    document.getElementById("sample4_extraAddress").value = '';
                                }

                                var guideTextBox = document.getElementById("guide");
                                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                                if(data.autoRoadAddress) {
                                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                                    guideTextBox.style.display = 'block';

                                } else if(data.autoJibunAddress) {
                                    var expJibunAddr = data.autoJibunAddress;
                                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                                    guideTextBox.style.display = 'block';
                                } else {
                                    guideTextBox.innerHTML = '';
                                    guideTextBox.style.display = 'none';
                                }
                            }
                        }).open();
                    }
       	
        </script>
	</article>
<%}%>
</section>