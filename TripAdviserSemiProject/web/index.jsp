<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/vegas.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<%=request.getContextPath() %>/css/vegas.min.js"></script>
<script>
	$(function () {
		$("#div-mainpage").vegas(
			{
				slides: [{
					src: 'images/introPoster.png',
					video: {
						src: ['images/IntroVideo_long.mp4', 'images/IntroVideo_long.webm',
							'images/IntroVideo_long.ogv'],
						loop: true,
						mute: true
					}
				}]
			});
	});
</script>
<section id='mainpage-container'>
	<div class="box-padding-big white-bg" id="div-mainpage">

		<style>
			#title_font {
				color: white;
				text-align: center;
			}

			.lg_text {
				padding-top: 200px;
				font-weight: bold;
				font-size: 80px;
			}

			.sm_text {
				margin: 5px auto;
				font-size: 25px;

			}

			.category-title {
				color: black;
			}

			.category-sub {
				color: black;
			}

			.search-container {
				text-align: center;
				display: inline-block;
			}
		</style>
		<div class="lg_text" id="title_font">떠나 볼까요?</div>
		<div class="sm_text" id="title_font">Where do you want to go?</div>
		<div class="search-container">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-3" id="searchName" type="search" placeholder="검색어입력" list="datalist"
					aria-label="Search">
				<datalist id="datalist">
					<!-- 자동완성기능 부분 -->
				</datalist>
				<button class="btn btn-outline-light my-2 my-sm-0" type="submit" style="margin: auto;">검색</button>

			</form>
			<!-- 자동완성 스크립트 -->
			<script>
				$(function () {
					$("#searchName").keyup(function () {
						$.ajax({
							url: "<%=request.getContextPath()%>/js.data.do",
							type: "post",
							data: { "search": $("#searchName").val() },
							success: function (data) {
								var html = "";
								var list = data.split(",");
								for (var i = 0; i < list.length; i++) {
									html += '<option>' + list[i] + '</option>';
								}
								$("#datalist").html(html);
							}
						});
					});
				});
			</script>
		</div>
	</div>
	
	<%@ include file="views/travelSearch/travelMainPage.jsp"%>

	<BR>

</section>

<%@ include file="views/common/footer.jsp"%>