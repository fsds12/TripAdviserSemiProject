<%@page import="java.util.ArrayList"%>
<%@page import="tripAdviser.travel.search.model.service.travelSearchService"%>
<%@page import="java.util.List"%>
<%@page import="tripAdviser.travel.product.model.vo.TravelProduct"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
List<TravelProduct> tplist = new ArrayList(); 
TravelProduct tp=new TravelProduct();
tplist = new travelSearchService().travelSearchAll();

//tp=tplist.get(1);
System.out.println("성공?"+tp);

%>
    <form id="#form">
    
    </form>

$(#form).summit()

<div class="box-padding-big light-bg">
		<div class="container">
			<h4 class="category-title">전체 최고 별점 Best things in our website</h4>
			<p class="category-sub">별점순 최고 랭킹 op 3 The most popular products
				selected by our guests.</p>
			<div class="card-group">
				<div class="card">
					<div style="background: #333; height: 300px;"></div>
					<div class="card-block">
						<h5 class="card-title">Sun island resort</h5>
						<p class="card-text">A dreamers paradise. Wake up to the cool
							breeze of Indian ocean.</p>
						<p class="card-text">
							<i class="fa fa-star" aria-hidden="false">1</i>
							<i class="fa fa-star" aria-hidden="true">2</i>
							<i class="fa fa-star" hidden="true">3</i>
							<i class="fa fa-star" hidden="false">4</i>
							<i class="fa fa-star" >5</i> 5 Stars
						</p>
					</div>
				</div>
				<div class="card">
					<div style="background: #333; height: 300px;"></div>
					<div class="card-block">
						<h5 class="card-title">Holiday island resort</h5>
						<p class="card-text">A dreamers paradise. Wake up to the cool
							breeze of Indian ocean.</p>
						<p class="card-text">
							<i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i> 5 Stars
						</p>
					</div>
				</div>
				<div class="card">
					<div style="background: #333; height: 300px;"></div>
					<div class="card-block">
						<h5 class="card-title">Veligandu island</h5>
						<p class="card-text">A dreamers paradise. Wake up to the cool
							breeze of Indian ocean.</p>
						<p class="card-text">
							<i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i> 5 Stars
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<BR>
	<div class="box-padding-big white-bg">
		<div class="container">
			<h4 class="category-title">최고 숙박 업소 top 3 Best accomodations</h4>
			<p class="category-sub">별점순 랭킹 top 3 The most popular accomodations selected by our guests.</p>
			<div class="card-group">
				<div class="card">
					<div style="background: #333; height: 300px;"></div>
					<div class="card-block">
						<h5 class="card-title">Sun island resort</h5>
						<p class="card-text">A dreamers paradise. Wake up to the cool
							breeze of Indian ocean.</p>
						<p class="card-text">
							<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
								class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
								aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i> 5 Stars
						</p>
					</div>
				</div>
				<div class="card">
					<div style="background: #333; height: 300px;"></div>
					<div class="card-block">
						<h5 class="card-title">Holiday island resort</h5>
						<p class="card-text">A dreamers paradise. Wake up to the cool
							breeze of Indian ocean.</p>
						<p class="card-text">
							<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
								class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
								aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i> 5 Stars
						</p>
					</div>
				</div>
				<div class="card">
					<div style="background: #333; height: 300px;"></div>
					<div class="card-block">
						<h5 class="card-title">Veligandu island</h5>
						<p class="card-text">A dreamers paradise. Wake up to the cool
							breeze of Indian ocean.</p>
						<p class="card-text">
							<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
								class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
								aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i> 5 Stars
						</p>
					</div>
				</div>
			</div>
		</div>

	</div>
	<BR>
	<div class="box-padding-big light-bg">
		<div class="container">
			<h4 class="category-title">최고 즐길거리 top 3 Best things to play</h4>
			<p class="category-sub">최고 즐길거리 top 3 The most popular play place
				selected by our guests.</p>
			<div class="card-group">
				<div class="card">
					<div style="background: #333; height: 300px;"></div>
					<div class="card-block">
						<h5 class="card-title">Sun island resort</h5>
						<p class="card-text">A dreamers paradise. Wake up to the cool
							breeze of Indian ocean.</p>
						<p class="card-text">
							<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
								class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
								aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i> 5 Stars
						</p>
					</div>
				</div>
				<div class="card">
					<div style="background: #333; height: 300px;"></div>
					<div class="card-block">
						<h5 class="card-title">Holiday island resort</h5>
						<p class="card-text">A dreamers paradise. Wake up to the cool
							breeze of Indian ocean.</p>
						<p class="card-text">
							<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
								class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
								aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i> 5 Stars
						</p>
					</div>
				</div>
				<div class="card">
					<div style="background: #333; height: 300px;"></div>
					<div class="card-block">
						<h5 class="card-title">Veligandu island</h5>
						<p class="card-text">A dreamers paradise. Wake up to the cool
							breeze of Indian ocean.</p>
						<p class="card-text">
							<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
								class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
								aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i> 5 Stars
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<BR>
	<div class="box-padding-big white-bg">
		<div class="container">
			<h4 class="category-title">전체 최고 먹을거리 top 3 Best things to eat</h4>
			<p class="category-sub">먹을거리 top 3 The most popular enjoying
				foods selected by our guests.</p>
			<div class="card-group">
				<div class="card">
					<div style="background: #333; height: 300px;"></div>
					<div class="card-block">
						<h5 class="card-title">Sun island resort</h5>
						<p class="card-text">A dreamers paradise. Wake up to the cool
							breeze of Indian ocean.</p>
						<p class="card-text">
							<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
								class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
								aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i> 5 Stars
						</p>
					</div>
				</div>
				<div class="card">
					<div style="background: #333; height: 300px;"></div>
					<div class="card-block">
						<h5 class="card-title">Holiday island resort</h5>
						<p class="card-text">A dreamers paradise. Wake up to the cool
							breeze of Indian ocean.</p>
						<p class="card-text">
							<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
								class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
								aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i> 5 Stars
						</p>
					</div>
				</div>
				<div class="card">
					<div style="background: #333; height: 300px;"></div>
					<div class="card-block">
						<h5 class="card-title">Veligandu island</h5>
						<p class="card-text">A dreamers paradise. Wake up to the cool
							breeze of Indian ocean.</p>
						<p class="card-text">
							<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i
								class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star"
								aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i> 5 Stars
						</p>
					</div>
				</div>
			</div>
		</div>

	</div>