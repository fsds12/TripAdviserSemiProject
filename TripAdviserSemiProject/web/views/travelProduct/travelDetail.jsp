<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tripAdviser.travel.product.model.vo.TravelProduct, tripAdviser.member.model.vo.Member" %>
<%@ include file="/views/common/header.jsp" %>

<%
	String id = "admin";	//세션에서 로그인한 사용자의 객체를 불러와서 초기화할예정 임시로 스트링객체선언
	Member m = (Member)session.getAttribute("loginMember");
	boolean logined = m == null? true:false;
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
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
    function fn_comment_confirm() {
        var comment = $('textarea[name=comment]').val();
        var logined = <%=logined %>;
        
        if(comment.trim().length == 0) {
            $('#comment-message').html("<div class='alert alert-warning alert-dismissible fade show' style='display: block; width: 700px;'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>경고!</strong> <span>코멘트 내용을 입력해주세요!</span></div>");
            return false;
        }
        else if(logined == false) {
            $('#comment-message').html("<div class='alert alert-warning alert-dismissible fade show' style='display: block; width: 700px;'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>경고!</strong> <span>로그인후 코멘트작성이 가능합니다!</span></div>");
            return false;
        }
        else {
            var conf = confirm("코멘트 작성을 하시겠습니까?");
            if(conf == true) {
            	return true;
            }
            else {
                return false;
            }
        }
    }

    function fn_scrap(trvNo) {
        var conf = confirm("이 여행상품을 마이스크랩에 담으시겠습니까?");

        if(conf == true) {
            location.href = "<%=request.getContextPath() %>/myPage/scrap?trvNo=" + trvNo;
        }
    }

    function fn_modify() {
        //상품수정서블릿으로 연결
        console.log();
        //location.href = "<%=request.getContextPath() %>/travel/travelModify?trvNo=<%=tp.getTrvNo() %>";
    }

    function fn_delete() {
        var conf = confirm("이 여행상품을 삭제하시겠습니까?");

        if(conf == true) {
            location.href = "<%=request.getContextPath() %>/travel/travelDelete?trvNo=<%=tp.getTrvNo() %>";
        }
    }

    function fn_comment_modify(commentNo, evaluation) {
        var selNo = commentNo;
        $(".comment-content-view").eq(selNo).css('display', 'none');
        $(".comment-evaluation").eq(selNo).css('display', 'none');
		$(".comment-modify-view:eq(" + selNo + ") [name=evaluation]:eq(" + (evaluation-1) + ")").prop("checked", true);
        $(".comment-modify-view").eq(selNo).css('display', 'flex');
    }
    function fn_comment_modify_cancel(commentNo) {
        var selNo = commentNo;
        $(".comment-modify-view").eq(selNo).css('display', 'none');
        $(".comment-content-view").eq(selNo).css('display', 'flex');
        $(".comment-evaluation").eq(selNo).css('display', 'block');
        return false;
    }

    function fn_comment_delete(commentNo, trvNo, cPage) {
        var conf = confirm("이 코멘트를 삭제하시겠습니까?");

        if(conf == true) {
            location.href = "<%=request.getContextPath() %>/travel/commentDelete?commentNo=" + commentNo + "&trvNo=" + trvNo + "&cPage=" + cPage;
        }
    }
    
    function initialize() {
    	  var LatLng = new google.maps.LatLng(37.560658, 126.985484);
    	  
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
<style>
section#travel-detail-container {
	padding-top: 20px; padding-bottom: 20px; border-bottom: 1px solid lightgray; border-top: 2px solid lightgray;
}
article#travel-description-space {max-width: 926.44px; margin: auto;}
article#travel-description-space div#travel-address-box {display: inline-block; width:70%;}
article#travel-description-space div#travel-manage-btn-box {display: inline-block; text-align: right; width:30%;}
article#travel-description-space div#travel-album-review-space {display: flex; border:0.5px solid lightgray;}
article#travel-description-space div#travel-album-carausel-box {display: inline-block; width: 70%; height:380px;}
article#travel-description-space div#travel-review-box {display: flex; flex-direction: column; width: 30%;}
article#travel-description-space div#travel-evul-div {display: inline-block; width: 100%; height: 50%;}
article#travel-description-space div#travel-map-div {display: inline-block; width: 100%; height: 40%;}
article#travel-description-space div#travel-scrap-div {display: inline-block; width: 100%;}
article#travel-description-space div#travel-content-container {display: block; margin-top: 20px; padding-top: 10px; border:0.5px solid lightgray;}

</style>
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
    			<%if(id.equals("admi") || tp.getMemberId().equals(id))  {%>
    				<button class="btn btn-dark" style="width: ;">수정하기</button> <button class="btn btn-dark" style="width: ;">삭제</button>
    			<%} %>
    			</div>
    		</div>
    		<div id="travel-album-review-space">
    			<div id="travel-album-carausel-box" class="carousel slide" data-ride="carousel">
    				<%-- <img src="<%=tp.getTrvRepresentPic() %>" width="100%" height="100%" /> --%>
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
					    <img src="<%=tp.getTrvRepresentPic() %>" alt="Travel Represent Pic" width="100%" height="380px" />
					  </div>
					  <%for(int i=0; i<tp.getAlbumUrls().size(); i++) { %>
						  <div class="carousel-item">
						    <img src="<%=tp.getAlbumUrls().get(i) %>" alt="Travel Album Pic" width="100%" height="380px" />
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
    				<div id="travel-evul-div">
    					<span class="starR on"></span><span style="font-size: 24px;"><%=Math.floor(tp.getAvgStarRate()*10)/10 %>평점</span>
    				</div>
    				<div id="travel-map-div">
    					google map
    				</div>
    				<div id="travel-scrap-div">
    				<%if(!isScraped) {%>
    					<button class="btn btn-primary" style="width: 100%;">스크랩하기</button>
    				<%}else {%>
    					<button class="btn btn-outline-danger" style="width: 100%;">스크랩제거</button>
    				<%} %>
    				</div>
    			</div>
    		</div>
    	</div>
    	<div id="travel-content-container" style="height: 250px;">
    		<%=tp.getTrvReview() %>
    	</div>
    </article>
</section> 

<section style="padding-top: 20px; padding-bottom: 20px;">
    <article id='travel-comment-container' style="display: block; max-width: 880px; margin: auto; background-color: white">
    	<form action="<%=request.getContextPath() %>/travel/inputComment" method="post" class="form-inline" onsubmit="return fn_comment_confirm()">
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
					<div style="display:inline-block;"><input type="submit" class="btn btn-light" value="코멘트작성" /></div>
				</div>
			</div>
			<div id="comment-message">
			</div>
		</form>
		<hr />
		<!-- 세션아이디랑 코멘트작성자와 비교해서 맞거나 admin계정이면 hidden삭제 아니면 hidden속성추가해서 넣기  -->
		<%if(tp.getCommentLists().size() > 0) {	//이 여행상품에 코멘트가있을시 값들을 로드한다.%>
		<%for(int i=0; i<tp.getCommentLists().size(); i++) {%>
			<div class="comment-container" style="min-height:110px;">
				<div class='comment-profile'>
					<img src="<%=request.getContextPath() %>/images/travel_detail_imgs/profile_default.gif" alt="" width="74px" height="84px" style="margin: 1px" />
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
							<button class='btn btn-primary' onclick="fn_comment_modify(<%=i %>, <%=tp.getCommentLists().get(i).getTrvEvaluation() %>)">수정</button> <button class='btn btn-light' onclick="fn_comment_delete(<%=tp.getCommentLists().get(i).getCommentNo() %>, <%=tp.getTrvNo() %>, <%=cPage %>)">삭제</button>
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
									<input type="hidden" name="commentNo" value="<%=tp.getCommentLists().get(i).getCommentNo() %>" />
									<input type="hidden" name="trvNo" value="<%=tp.getTrvNo() %>" />
									<input type="hidden" name="commentWriter" value="" />
									<input type="hidden" name="cPage" value="<%=cPage %>" />
									<textarea name="comment" class="form-control" style="max-width: 657px; height: 100%; margin: 0;" cols="70" rows="2" maxlength="100"><%=tp.getCommentLists().get(i).getCommentContent() %></textarea>
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
		<%} %>
		
		<%-- <div class="comment-container" style="min-height:110px;">
				<div class='comment-profile'>
					<img src="<%=request.getContextPath() %>/images/travel_detail_imgs/profile_default.gif" alt="" width="74px" height="84px" style="margin: 1px" />
					<div class="comment-writer"><span>test</span></div>
				</div>
				<div class="comment-date">
					<span><sub>2019-02-18</sub></span>
				</div>
				<div class="comment-content-test" style="display: inline-block; width:743px;">
					<div style="display: block; padding-bottom: 1rem;">
						<%for(int j = 0; j < 3; j++) {%>
							<span class="starR on"></span>
						<%} %>
						<%for(int j=0; j < 5-3; j++) {%>
							<span class="starR"></span>
						<%} %>
					</div>
					<div class="comment-content-view" style="display:flex; width:100%;">
						<div class="comment" style="display:inline-block; width:83%; border: 0px solid black;">
							코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트
						</div>
						<div class="comment-btn" style="display:inline-block; border: 0px solid black; width:17%; text-align: center;">
							<button class='btn btn-primary' onclick="fn_comment_modify(5)">수정</button> <button class='btn btn-light' onclick="fn_comment_delete(5)">삭제</button>
						</div>
					</div>
					<div class="comment-modify-view" style="display: none;">
						<form action="/travel/travelModify" method="post" style="display: flex;">
							<div class="comment-modify" style="display:inline-block; width:83%;">
								<input type="hidden" name="commentNo" value="32" />
								<input type="hidden" name="trvNo" value="1" />
								<textarea name="comment" class="form-control" style="max-width: 657px; height: 100%; margin: 0;" cols="70" rows="2" maxlength="100">코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트코멘트</textarea>
							</div>
							<div class="comment-modify-btn" style="display:inline-block; width:17%; text-align: center;">
								<input type="submit" class="btn btn-primary" value="코멘트수정" />
							</div>
						</form>
					</div>
				</div>
			</div> --%>
    </article>
</section>


<%@ include file="/views/common/footer.jsp" %>