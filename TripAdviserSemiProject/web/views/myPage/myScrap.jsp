<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
section#myScrap-container {
	width: 100%;
	justify-content: center;
	align-content: center;
}
section#myScrap-container > div.card-group {
	width: 800px;
	margin: auto;
}
</style>

<section id="myScrap-container">
	<h1 style="text-align: center;">마이 스크랩</h1>
	<div style="text-align: center;">
		<div id="search-box" style="display: inline-block;">
		<form class="form-inline">
			<select class="form-control" id="" name="">
				<option>카테고리</option>
				<option>제목</option>
				<option>일정</option>
				<option>ㅇㅇ</option>
			</select>
			<input type="text" id="" name="" class="form-control"/>
			<input type="submit" name="" class="form-control" value="검색" />
		</form>
		</div>
	</div>
	<%for(int i=0; i<2; i++) {%>
	<h4 style="text-align: center;">카테고리<%=(i+1) %></h4>
	<div class="card-group">
		<div class="card">
			<div style="background:#333; height:300px;"></div>
			<div class="card-block">
				<h5 class="card-title">Sun island resort</h5>
				<p class="card-text">A dreamers paradise. Wake up to the cool breeze of Indian ocean.</p>
				<p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
						aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
						class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
					5 Stars</p>
			</div>
		</div>
		<div class="card">
			<div style="background:#333; height:300px;"></div>
			<div class="card-block">
				<h5 class="card-title">Holiday island resort</h5>
				<p class="card-text">A dreamers paradise. Wake up to the cool breeze of Indian ocean.</p>
				<p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
						aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
						class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
					5 Stars</p>
			</div>
		</div>
		<div class="card">
			<div style="background:#333; height:300px;"></div>
			<div class="card-block">
				<h5 class="card-title">Veligandu island</h5>
				<p class="card-text">A dreamers paradise. Wake up to the cool breeze of Indian ocean.</p>
				<p class="card-text"><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
						aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
						class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
					5 Stars</p>
			</div>
		</div>
	</div>
	<%} %>
</section>