<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tripAdviser.travel.product.model.vo.TravelProduct" %>
<%@ include file="/views/common/header.jsp" %>

<%
	String id = "admin";	//세션에서 로그인한 사용자의 객체를 불러와서 초기화할예정 임시로 스트링객체선언
	TravelProduct tp = (TravelProduct)request.getAttribute("travelProduct");
%>
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
    function fn_comment_confirm() {
        var comment = $('textarea[name=comment]').val();
        
        if(comment.trim().length == 0) {
            alert("코멘트 내용을 입력해주세요.");
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
        location.href = "<%=request.getContextPath() %>/travel/travelModify?trvNo=1";
    }

    function fn_delete() {
        var conf = confirm("이 여행상품을 삭제하시겠습니까?");

        if(conf == true) {
            location.href = "<%=request.getContextPath() %>/travel/travelDelete?trvNo=1";
        }
    }

    function fn_comment_modify(commentNo) {
        var selNo = commentNo + 1;
        console.log(selNo);
    }

    function fn_comment_delete(commentNo) {
        var conf = confirm("이 코멘트를 삭제하시겠습니까?");

        if(conf == true) {
            location.href = "<%=request.getContextPath() %>/travel/commentDelete?commentNo=" + commentNo;
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
	padding-top: 20px; padding-bottom: 20px; border-bottom: 1px solid lightgray; border-bottom-style: double;
}
article#travel-description-space {width: 92%; margin: auto;}
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
    		<h2 id="travel-title" style="font-weight: bold; margin-bottom: 1px;">여행지 제목</h2>
    	</div>
    	<div id="travel-intro-container" style="display: block;">
    		<div id="travel-address-btn-space" style="display: flex;">
    			<div id="travel-address-box">
    				<span class="glyphicon glyphicon-map-marker">&#xe062;</span><span>ㅇㅇㅇ시 ㅇㅇㅇㅇ ㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span>
    			</div>
    			<div id="travel-manage-btn-box" >
    				<button class="btn btn-dark" style="width: ;">수정하기</button> <button class="btn btn-dark" style="width: ;">삭제</button>
    			</div>
    		</div>
    		<div id="travel-album-review-space">
    			<div id="travel-album-carausel-box">
    				<img src="<%=request.getContextPath() %>/images/test.png" width="100%" height="100%" />
    			</div>
    			<div id="travel-review-box">
    				<div id="travel-evul-div">
    					<i class="fas fa-star">★</i>
    				</div>
    				<div id="travel-map-div">
    					google map
    				</div>
    				<div id="travel-scrap-div">
    					<button class="btn btn-primary" style="width: 100%;">스크랩하기</button>
    				</div>
    			</div>
    		</div>
    	</div>
    	<div id="travel-content-container" style="height: 250px;">
    		본문(여행상품세부묘사)
    	</div>
    </article>
</section> 

<section style="padding-top: 20px; padding-bottom: 20px;">
    <article id='travel-comment-container' style="display: block; max-width: 880px; margin: auto; background-color: white">
    	<form action="<%=request.getContextPath() %>/travel/inputComment" method="post" class="form-inline" onsubmit="return fn_comment_confirm()">
			평점 :&nbsp;<input type="radio" name="evaluation" id="star1" value="1" />
			<label for="star1">★</label>&nbsp;
			<input type="radio" name="evaluation" id="star2"  value="2" />
			<label for="star2">★★</label>&nbsp;
			<input type="radio" name="evaluation" id="star3" value="3" />
			<label for="star3">★★★</label>&nbsp;
			<input type="radio" name="evaluation" id="star4" value="4" />
			<label for="star4">★★★★</label>&nbsp;
			<input type="radio" name="evaluation" id="star5" value="5" checked /> 
			<label for="star5">★★★★★</label>
			<br>
			<label class="sr-only" for="comment">Comment</label>
			<div id='travel-comment-input-container' style="display: flex; max-width:">
				<div style="display:inline-block;">
					<textarea name="comment" class="form-control" style="max-width: 657px; height: 100%; margin: 0;" cols="70" rows="2" maxlength="100" placeholder="코멘트입력"></textarea>
				</div>
				<div style="display: inline-block;">
					<div style="display: block;">&nbsp;</div>
					<div style="display:inline-block;"><input type="submit" class="btn btn-light" value="코멘트작성" /></div>
				</div>
				<!-- <div style="display: block; width: 100%;">
					<span>로그인후 코멘트 작성이 가능합니다!</span>
				</div> -->
			</div>
		</form>
		<hr />
		<!-- 세션아이디랑 코멘트작성자와 비교해서 맞거나 admin계정이면 hidden삭제 아니면 hidden속성추가해서 넣기  -->
		<%if(1>0) {	//이 여행상품에 코멘트가있을시 값들을 로드한다.%>
		<%for(int i=0; i<5; i++) {%>
			<div class="comment-container">
				<div class='comment-profile'>
					<img src="<%=request.getContextPath() %>/images/travel_detail_imgs/profile_default.gif" alt="" width="74px" height="84px" style="margin: 1px" />
					<div class="comment-writer"><span>isaia11</span></div>
				</div>
				<div class="comment-date">
					<span><sub>2019.02.09</sub></span>
				</div>
				<div class="comment-content">
					<p>★</p>
					<%if(i != 4) {%>
					<p>테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트테스트코멘트</p>
					<%} else{ %>
					<p>코멘트틀</p>
					<%} %>
				</div>
				<div class="comment-btn-container">
					<p>&nbsp;</p>
					<%if(id.equals("admin") || id.equals("commentWriter")) {//로그인한사용자가 코멘트작성자 이거나 관리자일시 버튼생성%>
					<div class="comment-btn">
						<button class='btn btn-primary' onclick="fn_comment_modify(<%=i %>)">수정</button> <button class='btn btn-light' onclick="fn_comment_delete(<%=i %>)">삭제</button>
					</div>
					<%} else{ %>
					<span class="comment-btn">
						&nbsp;
					</span>
					<%} %>
				</div>
			</div>
		<%} %>
		<nav id="pageBar">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
			</ul> 
		</nav>
		<%} %>
    </article>
</section>


<%@ include file="/views/common/footer.jsp" %>