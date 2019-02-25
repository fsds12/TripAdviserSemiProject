<%@page import="java.util.ArrayList"%>
<%@page import="tripAdviser.travel.search.model.service.travelSearchService"%>
<%@page import="java.util.List"%>
<%@page import="tripAdviser.travel.product.model.vo.TravelProduct"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
List<TravelProduct> tplist = new ArrayList(); 
TravelProduct tp=new TravelProduct();
tplist=new travelSearchService().travelSearchCt(8);


%>
<style>
	#starRateScore {
		display: inline-block;
		font-size: 25px;
	}

	div.card div img {
		width: 100%;
		height: 300px;
	}
</style>


<div class="box-padding-big light-bg">
	<div class="container">
		<h4 class="category-title">전체 놀거리 최고 별점 Best play spots in our website</h4>
		<p class="category-sub">별점순 최고 놀거리 랭킹 Top ranking The most popular play spots selected by our guests.</p>

		<%for(int t=0; t<tplist.size(); t++) {%>
		<%
		System.out.println(t);
		if(t%3 == 0)  {
		System.out.println("걸림"+t);%>
		<div class="card-group">
			<%} tp=tplist.get(t); %>

			<div class="card">
				<div style="background: #333; height: 300px;"><a
						href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp.getTrvNo()%>"><img
							src="<%=tp.getTrvRepresentPic()%>" /></a></div>
				<div class="card-block">
					<h5 class="card-title"><%=tp.getTrvTitle() %></h5>
					<p class="card-text"><i class="fa fa-map-marker"></i>
						<%=tp.getTrvProvince()+"&nbsp;"+tp.getTrvCity()+"&nbsp;"+tp.getTrvAddress() %>.</p>
					<p class="card-text">
						<%
						int starRate=0;
						if(tp.getAvgStarRate()<0||tp.getAvgStarRate()>5){starRate=0;}
						else{starRate=(int)tp.getAvgStarRate();}
						for (int i=0;i<starRate;++i){
						%>
						<i class="fa fa-star"></i>
						<% }
						for(int j=0;j<(5-starRate);++j){
						%>
						<i class="fa fa-star-o"></i>
						<% } %>
						<span id="starRateScore"><%=tp.getAvgStarRate() %></span> Stars
					</p>
				</div>
			</div>
			<%if(t%3 == 2)  {%>
		</div>
		<%} %>
		<%} %>

	</div>
</div>
<BR>
</div>