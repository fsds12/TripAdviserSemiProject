<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tripAdviser.travel.product.model.vo.TravelProduct, tripAdviser.member.model.vo.Member" %>
<%@ include file="/views/common/header.jsp" %>

<%
	String id = "";	//세션에서 로그인한 사용자의 객체를 불러와서 초기화할예정 임시로 스트링객체선언
	Member m = (Member)session.getAttribute("loginMember");
	boolean logined = m == null? false:true;
	
	if(logined) {
		id = m.getMemberId();
	}
	
	boolean isScraped = (boolean)request.getAttribute("isScraped");
	TravelProduct tp = (TravelProduct)request.getAttribute("travelProduct");
	String pageBar = (String)request.getAttribute("pageBar");
	
	int cPage;
	try {
		cPage = Integer.parseInt(request.getParameter("cPage"));
	}
	catch(NumberFormatException e) {
		cPage = 1;
	}
%>
<script src="http://maps.googleapis.com/maps/api/js?&key=AIzaSyCDSMMBC3FVr1gSB2QtcPfMFJwHW0-m9WA"></script>
<script>
    function fn_scrap_insert() {
    	var logined = <%=logined %>;
    	if(logined == false) {
    		$('#error-message').html("<div class='alert alert-info'><button type='button' class='close' data-dismiss='alert'>&times;</button><a href='<%=request.getContextPath()%>/loginpage' class='alert-link'>로그인</a>후 스크랩하기 사용가능합니다.</div>");
    	}
    	else {
    		$.ajax({
    			url: "<%=request.getContextPath() %>/travel/myScrap?trvNo=<%=tp.getTrvNo() %>",
    			type: "post",
    			dataType: "text",
    			success: function(data) {
    				$('#travel-scrap-div').html(data);
    				$('#message .modal-body').text("여행정보를 스크랩 했습니다.");
    				$("#detail-modal-btn").css('display','inline-block');
    		        $("#detail-confirm-btn").css('display','none');
    		        $("#detail-cancel-btn").css('display','none');
    				$('#message').modal();
    			},
    			error: function(request, status, error) {
    				
    			}
    		});
    	}
    }
    
    function fn_scrap_delete() {
    	$.ajax({
			url: "<%=request.getContextPath() %>/travel/myScrapDelete?trvNo=<%=tp.getTrvNo() %>",
			type: "post",
			dataType: "text",
			success: function(data) {
				$('#travel-scrap-div').html(data);
				$('#message .modal-body').text("여행정보를 스크랩에서 제거했습니다.");
				$("#detail-modal-btn").css('display','inline-block');
		        $("#detail-confirm-btn").css('display','none');
		        $("#detail-cancel-btn").css('display','none');
				$('#message').modal();
			},
			error: function(request, status, error) {
				
			}
		});
    }

    function fn_travel_modify() {
        //상품수정서블릿으로 연결
        location.href = "<%=request.getContextPath() %>/travel/travelModify?trvNo=<%=tp.getTrvNo() %>";
    }

    function fn_travel_delete() {
    	$('#message .modal-body').text("이 여행지 정보를 삭제 하시겠습니까?");
        $("#detail-modal-btn").css('display','none');
        $("#detail-confirm-btn").css('display','inline-block');
        $("#detail-cancel-btn").css('display','inline-block');
        $("#detail-confirm-btn").attr("onclick", "location.href='<%=request.getContextPath() %>/travel/travelDelete?trvNo=<%=tp.getTrvNo() %>'");
        $("#message").modal();
    }
    
    $(function() {
    	$("#input-comment-ajax").click(function() {
    		var comment = $('textarea[name=comment]').val();
            var logined = <%=logined %>;
            
            if(comment.trim().length == 0) {
                $('#comment-message').html("<div class='alert alert-warning alert-dismissible fade show' style='display: block; width: 700px;'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>경고!</strong> <span>코멘트 내용을 입력해주세요!</span></div>");
            }
            else if(logined == false) {
                $('#comment-message').html("<div class='alert alert-warning alert-dismissible fade show' style='display: block; width: 700px;'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>경고!</strong> <span>로그인후 코멘트작성이 가능합니다!</span></div>");
            }
            else {
	            $('#message .modal-body').text("코멘트 작성을 하시겠습니까?");
	            $("#detail-modal-btn").css('display','none');
	            $("#detail-confirm-btn").css('display','inline-block');
	            $("#detail-cancel-btn").css('display','inline-block');
	            $("#detail-confirm-btn").attr("onclick", "fn_comment_input_ajax()");
				$('#message').modal();
    		}
    	});
    });

    function fn_comment_input_ajax() {
    	var formData = $('form[name=comment-frm]').serialize();
		$.ajax({
			url: "<%=request.getContextPath()%>/travel/travelCommentInsert",
			type: "post",
			data: formData,
			dataType: "html",
			success: function(data) {
				$(".close").click();
				$("textarea").val("");
				$("#comment-space").html(data);
				
				$.ajax({
    				url: "<%=request.getContextPath()%>/travel/travelRefreshRate?trvNo=<%=tp.getTrvNo() %>",
    				type: "post",
    				dataType: "text",
    				success: function(data) {
    					$("#travel-star-rate").text(data);
    				},
    				error: function(request, status, error) {
    					
    				}
    			});
			},
			error: function(request, status, error) {
				
			}
		});
    }
    
    function fn_comment_modify(commentNo, evaluation) {
        var selNo = commentNo;
        $(".comment-content-view").eq(selNo).css('display', 'none');
        $(".comment-evaluation").eq(selNo).css('display', 'none');
		$(".comment-modify-view:eq(" + selNo + ") [name=evaluation]:eq(" + (evaluation-1) + ")").prop("checked", true);
        $(".comment-modify-view").eq(selNo).css('display', 'flex');
    }
    
    function fn_comment_modify_ajax(selNo) {
    	var formData = $('form[name=comment-modify-frm]').eq(selNo).serialize();
		$.ajax({
			url: "<%=request.getContextPath()%>/travel/travelCommentModify",
			type: "post",
			data: formData,
			dataType: "html",
			success: function(data) {
				$("#comment-space").html(data);
				
				$.ajax({
    				url: "<%=request.getContextPath()%>/travel/travelRefreshRate?trvNo=<%=tp.getTrvNo() %>",
    				type: "post",
    				dataType: "text",
    				success: function(data) {
    					$("#travel-star-rate").text(data);
    				},
    				error: function(request, status, error) {
    					
    				}
    			});
			},
			error: function(request, status, error) {
				
			}
		});
    }
    
    function fn_comment_modify_cancel(commentNo) {
        var selNo = commentNo;
        $(".comment-modify-view").eq(selNo).css('display', 'none');
        $(".comment-content-view").eq(selNo).css('display', 'flex');
        $(".comment-evaluation").eq(selNo).css('display', 'block');
        return false;
    }
    
    function fn_comment_modal_delete(commentNo, trvNo, cPage) {
    	$('#message .modal-body').text("코멘트를 삭제 하시겠습니까?");
        $("#detail-modal-btn").css('display','none');
        $("#detail-confirm-btn").css('display','inline-block');
        $("#detail-cancel-btn").css('display','inline-block');
        $("#detail-confirm-btn").attr("onclick", "fn_comment_delete_ajax(" + commentNo + ", " + trvNo + ", " + cPage + ")");
		$('#message').modal();
    }
    
    function fn_comment_delete_ajax(commentNo, trvNo, cPage) {
        if(true) {
        	$.ajax({
    			url: "<%=request.getContextPath()%>/travel/commentDeleteAjax?commentNo=" + commentNo + "&trvNo=" + trvNo + "&cPage=" + cPage,
    			type: "post",
    			dataType: "html",
    			success: function(data) {
    				$(".close").click();
    				$("#comment-space").html(data);
    				
    				$.ajax({
        				url: "<%=request.getContextPath()%>/travel/travelRefreshRate?trvNo=<%=tp.getTrvNo() %>",
        				type: "post",
        				dataType: "text",
        				success: function(data) {
        					$("#travel-star-rate").text(data);
        				},
        				error: function(request, status, error) {
        					
        				}
        			});
    			},
    			error: function(request, status, error) {
    				
    			}
    		});
        }
    	
    }
    
    function initialize() {
    	  var lat = "<%=tp.getTrvGps().split(", ")[0] %>";
    	  var lng = "<%=tp.getTrvGps().split(", ")[1] %>";
    	  var LatLng = new google.maps.LatLng(lat, lng);
    	  var mapProp = {
    	    center: LatLng, // 위치
    	    zoom:15, // 어느정도까지 세세하게 볼 것인지.
    	    mapTypeId:google.maps.MapTypeId.ROADMAP
    	  };

    	  var map=new google.maps.Map(document.getElementById("travel-map-div"),mapProp);
    	  
    	  var marker = new google.maps.Marker({
    		position: LatLng,
    		map: map,
    	  });
    	}

    google.maps.event.addDomListener(window, 'load', initialize);
</script>
<!-- The Modal -->
  <div class="modal fade" id="message">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Message</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
           	모달 내용
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" id="detail-modal-btn" class="btn btn-secondary" data-dismiss="modal">확인</button>
          <button type="button" id="detail-confirm-btn" class="btn btn-primary" style="display:none;">예</button>
          <button type="button" id="detail-cancel-btn" class="btn btn-danger" onclick="$('.close').click()" style="display:none;">아니오</button>
        </div>
        
      </div>
    </div>
  </div>

<section id='travel-detail-container'>
    <article id="travel-description-space">
    	<div id="travel-title-container" style="display: block;">
    		<h2 id="travel-title" style="font-weight: bold; margin-bottom: 1px;">여행지: <%=tp.getTrvTitle() %></h2>
    	</div>
    	<div id="travel-intro-container" style="display: block;">
    		<div id="travel-address-btn-space" style="display: flex;">
    			<div id="travel-address-box">
    				<span class="glyphicon glyphicon-map-marker">&#xe062;</span><span><%=tp.getTrvProvince() %></span> <span><%=tp.getTrvCity() %></span> <span><%=tp.getTrvAddress() %></span>
    			</div>
    			<div id="travel-manage-btn-box" >
    			<%if(id.equals("admin") || tp.getMemberId().equals(id))  {%>
    				<button class="btn btn-dark" style="width: ;" onclick='fn_travel_modify()'>수정하기</button> <button class="btn btn-dark" style="width: ;" onclick='fn_travel_delete()'>삭제</button>
    			<%} %>
    			</div>
    		</div>
    		<div id="travel-album-review-space">
    			<div id="travel-album-carausel-box" class="carousel slide" data-ride="carousel">
    				 <!-- Indicators -->
					<ul class="carousel-indicators">
					  <li data-target="#travel-album-carausel-box" data-slide-to="0" class="active"></li>
					  <%for(int i=0; i<tp.getAlbumUrls().size(); i++) { %>
						  <li data-target="#travel-album-carausel-box" data-slide-to="<%=(i+1) %>"></li>
					  <%} %>
					</ul>
						
					<!-- The slideshow -->
					<div class="carousel-inner">
					  <div class="carousel-item active">
					    <img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp.getTrvRepresentPic() %>" alt="Travel Represent Pic" width="100%" height="380px" />
					  </div>
					  <%for(int i=0; i<tp.getAlbumUrls().size(); i++) { %>
						  <div class="carousel-item">
						    <img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp.getAlbumUrls().get(i) %>" alt="Travel Album Pic" width="100%" height="380px" />
						  </div>
					  <%} %>
					</div>
					
					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#travel-album-carausel-box" data-slide="prev">
					  <span class="carousel-control-prev-icon"></span>
					</a>
					<a class="carousel-control-next" href="#travel-album-carausel-box" data-slide="next">
					  <span class="carousel-control-next-icon"></span>
					</a>
    			</div>
    			<div id="travel-review-box">
    				<div id="travel-evul-intro-div">
    					<p>
    						<span class="starR on"></span><span id="travel-star-rate" style="font-size: 24px;"><%=Math.floor(tp.getAvgStarRate()*10)/10 %>평점</span><br>
    					</p>
    					<p>
    						<span>카테고리: <%=tp.getTrvLargeCtg() %> - <%=tp.getTrvSmallCtg() %></span>
    					</p>
    				</div>
    				<div id="travel-map-div">
    					google map
    				</div>
    				<div id="travel-scrap-div">
    				<%if(!isScraped) {%>
    					<button class="btn btn-primary" style="width: 100%;" id='is-scrap' onclick='fn_scrap_insert();'>스크랩하기</button>
    					<!-- <button class="btn btn-primary" style="width: 100%;" id='is-scrap'>스크랩하기</button> -->
    				<%}else {%>
    					<button class="btn btn-outline-danger" style="width: 100%;" id='is-scrap-delete' onclick='fn_scrap_delete()'>스크랩제거</button>
    					<!-- <button class="btn btn-outline-danger" style="width: 100%;" id='is-scrap-delete'>스크랩제거</button> -->
    				<%} %>
    				</div>
    			</div>
    		</div>
    	</div>
    	<div id="error-message" style="margin-top: 3px;">
    	</div>
    	<div id="travel-content-container" style="min-height: 250px;">
    		<%=tp.getTrvReview() %>
    	</div>
    </article>
</section> 

<section style="padding-top: 20px; padding-bottom: 20px;">
    <article id='travel-comment-container'>
    	<form action="<%=request.getContextPath() %>/travel/inputComment" method="post" name="comment-frm" class="form-inline" onsubmit="return fn_comment_confirm()">
			평점 :&nbsp;<input type="radio" name="evaluation" id="star1" value="1" />
			<label for="star1"><span class="starR on"></span></label>&nbsp;&nbsp;
			<input type="radio" name="evaluation" id="star2"  value="2" />
			<label for="star2"><span class="starR on"></span><span class="starR on"></span></label>&nbsp;&nbsp;
			<input type="radio" name="evaluation" id="star3" value="3" />
			<label for="star3"><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span></label>&nbsp;&nbsp;
			<input type="radio" name="evaluation" id="star4" value="4" />
			<label for="star4"><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span></label>&nbsp;&nbsp;
			<input type="radio" name="evaluation" id="star5" value="5" checked /> 
			<label for="star5"><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span><span class="starR on"></span></label>
			<br>
			<label class="sr-only" for="comment">Comment</label>
			<div id='travel-comment-input-container' style="display: flex; max-width:">
				<div style="display:inline-block;">
					<textarea name="comment" class="form-control" style="max-width: 657px; height: 100%; margin: 0;" cols="70" rows="2" maxlength="100" placeholder="코멘트입력"></textarea>
					<input type="hidden" name="commentWriter" value="<%=id %>" />
					<input type="hidden" name="commentRefTrvNo" value="<%=tp.getTrvNo() %>" />
				</div>
				<div style="display: inline-block;">
					<div style="display: block;">&nbsp;</div>
					<div style="display:inline-block;"><input type="button" id="input-comment-ajax" class="btn btn-light" value="코멘트작성" /></div>
				</div>
			</div>
			<div id="comment-message">
			</div>
		</form>
		<hr />
		<!-- 세션아이디랑 코멘트작성자와 비교해서 맞거나 admin계정이면 hidden삭제 아니면 hidden속성추가해서 넣기  -->
		<div id="comment-space">
		<%if(tp.getCommentLists().size() > 0) {	//이 여행상품에 코멘트가없을시 값들을 로드한다.%>
		<%for(int i=0; i<tp.getCommentLists().size(); i++) {%>
			<div class="comment-container" style="min-height:110px;">
				<div class='comment-profile'>
					<img src="<%=request.getContextPath() %>/images/myPage_imgs/<%=tp.getCommentLists().get(i).getMemberPictureUrl() %>" alt="" width="74px" height="84px" style="margin: 1px" />
					<div class="comment-writer"><span><%=tp.getCommentLists().get(i).getMemberId() %></span></div>
				</div>
				<div class="comment-date">
					<span><sub><%=tp.getCommentLists().get(i).getCommentDate() %></sub></span>
				</div>
				<div class="comment-content-test" style="display: inline-block; width:743px;">
					<div class="comment-evaluation" style="display: block; padding-bottom: 1rem;">
						<%for(int j = 0; j < tp.getCommentLists().get(i).getTrvEvaluation(); j++) {%>
							<span class="starR on"></span>
						<%} %>
						<%for(int j=0; j < 5-tp.getCommentLists().get(i).getTrvEvaluation(); j++) {%>
							<span class="starR"></span>
						<%} %>
					</div>
					<div class="comment-content-view" style="display:flex; width:100%;">
						<div class="comment" style="display:inline-block; width:83%;">
							<%=tp.getCommentLists().get(i).getCommentContent() %>
						</div>
						<%if(id.equals("admin") || tp.getCommentLists().get(i).getMemberId().equals(id)) {%>
						<div class="comment-btn" style="display:inline-block; width:17%; text-align: center;">
							<button class='btn btn-primary' onclick="fn_comment_modify(<%=i %>, <%=tp.getCommentLists().get(i).getTrvEvaluation() %>)">수정</button> <button class='btn btn-light' onclick="fn_comment_modal_delete(<%=tp.getCommentLists().get(i).getCommentNo() %>, <%=tp.getTrvNo() %>, <%=cPage %>)">삭제</button>
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
									<input type="hidden" name="commentNo" value="<%=tp.getCommentLists().get(i).getCommentNo() %>" />
									<input type="hidden" name="trvNo" value="<%=tp.getTrvNo() %>" />
									<input type="hidden" name="commentWriter" value="" />
									<input type="hidden" name="cPage" value="<%=cPage %>" />
									<textarea name="comment" class="form-control" style="max-width: 657px; height: 100%; margin: 0;" cols="70" rows="2" maxlength="100"><%=tp.getCommentLists().get(i).getCommentContent() %></textarea>
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
    </article>
</section>

<%@ include file="/views/common/footer.jsp" %>