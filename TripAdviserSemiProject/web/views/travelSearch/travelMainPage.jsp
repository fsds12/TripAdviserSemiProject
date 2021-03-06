<%@page import="java.util.ArrayList"%>
<%@page import="tripAdviser.travel.search.model.service.travelSearchService"%>
<%@page import="java.util.List"%>
<%@page import="tripAdviser.travel.product.model.vo.TravelProduct"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
List<TravelProduct> tplist = new ArrayList(); 
TravelProduct tp,tp1,tp2,tp3=new TravelProduct();
//tplist = new travelSearchService().travelSearchAll();
tplist=new travelSearchService().travelSearchCt(0);
tp1=tplist.get(0);
tp2=tplist.get(1);
tp3=tplist.get(2);
%>
<style>
	#starRateScore {
		display: inline-block;
		font-size: 25px;
	}
	
div.card div img{width:100%; height:200px;}
</style>


<div class="box-padding-big light-bg">
	<div class="container">
		<h4 class="category-title">전체 최고 별점 Best things in our website</h4>
		<p class="category-sub">별점순 최고 랭킹 Top 3 The most popular products
			selected by our guests.</p>
		<div class="card-group">
			<div class="card">
				<div style="background: #333; height: 200px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp1.getTrvNo()%>"><img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp1.getTrvRepresentPic() %>" /></a></div>
				<div class="card-block">
					<h5 class="card-title"><%=tp1.getTrvTitle() %></h5>
					<p class="card-text"><i class="fa fa-map-marker"></i> <%=tp1.getTrvProvince()+"&nbsp;"+tp1.getTrvCity()+"&nbsp;"+tp1.getTrvAddress() %>.</p>
					<p class="card-text">
						<%
						int starRate=0;
						if(tp1.getAvgStarRate()<0||tp1.getAvgStarRate()>5){starRate=0;}
						else{starRate=(int)tp1.getAvgStarRate();}
						for (int i=0;i<starRate;++i){
						%>
						<i class="fa fa-star"></i>
						<% }
						for(int j=0;j<(5-starRate);++j){
						%>
						<i class="fa fa-star-o"></i>
						<% } %>
						<span id="starRateScore"><%=tp1.getAvgStarRate() %></span> Stars
					</p>
				</div>
			</div>
			<div class="card">
				<div style="background: #333; height: 200px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp2.getTrvNo()%>"><img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp2.getTrvRepresentPic() %>" /></a></div>
				<div class="card-block">
					<h5 class="card-title"><%=tp2.getTrvTitle() %></h5>
					<p class="card-text"><i class="fa fa-map-marker"></i> <%=tp2.getTrvProvince()+"&nbsp;"+tp2.getTrvCity()+"&nbsp;"+tp2.getTrvAddress() %>.</p>
					<p class="card-text">

						<%
						if(tp2.getAvgStarRate()<0||tp2.getAvgStarRate()>5){starRate=0;}
						else{starRate=(int)tp2.getAvgStarRate();}
						for (int i=0;i<starRate;++i){
						%>
						<i class="fa fa-star"></i>
						<% }
						for(int j=0;j<(5-starRate);++j){
						%>
						<i class="fa fa-star-o"></i>
						<% } %>
						<span id="starRateScore"><%=tp2.getAvgStarRate() %></span> Stars
					</p>
				</div>
				</p>
			</div>
			<div class="card">
				<div style="background: #333; height: 200px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp3.getTrvNo()%>"><img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp3.getTrvRepresentPic() %>" /></a></div>
				<div class="card-block">
					<h5 class="card-title" display="inline-block"><%=tp3.getTrvTitle() %></h5>
					<p class="card-text" display="inline-block"><i class="fa fa-map-marker"></i>
						<%=tp3.getTrvProvince()+"&nbsp;"+tp3.getTrvCity()+"&nbsp;"+tp3.getTrvAddress() %>.</p>
					<p class="card-text" display="inline-block">
						<%
						if(tp3.getAvgStarRate()<0||tp3.getAvgStarRate()>5){starRate=0;}
						else{starRate=(int)tp3.getAvgStarRate();}
						for (int i=0;i<starRate;++i){
						%>
						<i class="fa fa-star"></i>
						<% }
						for(int j=0;j<(5-starRate);++j){
						%>
						<i class="fa fa-star-o"></i>
						<% } %>
						<span id="starRateScore"><%=tp3.getAvgStarRate() %></span> Stars
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<BR>

<%
tplist=new travelSearchService().travelSearchCt(1);
tp1=tplist.get(0);
tp2=tplist.get(1);
tp3=tplist.get(2);

%>


<div class="box-padding-big white-bg">
	<div class="container">
		<h4 class="category-title">최고 휴식거리 top 3 Best accomodations</h4>
		<p class="category-sub">별점순 랭킹 top 3 The most popular accomodations selected by our guests.</p>
		<div class="card-group">
				<div class="card">
					<div style="background: #333; height: 200px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp1.getTrvNo()%>"><img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp1.getTrvRepresentPic() %>" /></a></div>
					<div class="card-block">
						<h5 class="card-title"><%=tp1.getTrvTitle() %></h5>
						<p class="card-text"><i class="fa fa-map-marker"></i> <%=tp1.getTrvProvince()+"&nbsp;"+tp1.getTrvCity()+"&nbsp;"+tp1.getTrvAddress() %>.</p>
						<p class="card-text">
							<%
							starRate=0;
							if(tp1.getAvgStarRate()<0||tp1.getAvgStarRate()>5){starRate=0;}
							else{starRate=(int)tp1.getAvgStarRate();}
							for (int i=0;i<starRate;++i){
							%>
							<i class="fa fa-star"></i>
							<% }
							for(int j=0;j<(5-starRate);++j){
							%>
							<i class="fa fa-star-o"></i>
							<% } %>
							<span id="starRateScore"><%=tp1.getAvgStarRate() %></span> Stars
						</p>
					</div>
				</div>
				<div class="card">
					<div style="background: #333; height: 200px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp2.getTrvNo()%>"><img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp2.getTrvRepresentPic() %>" /></a></div>
					<div class="card-block">
						<h5 class="card-title"><%=tp2.getTrvTitle() %></h5>
						<p class="card-text"><i class="fa fa-map-marker"></i> <%=tp2.getTrvProvince()+"&nbsp;"+tp2.getTrvCity()+"&nbsp;"+tp2.getTrvAddress() %>.</p>
						<p class="card-text">
	
							<%
							if(tp2.getAvgStarRate()<0||tp2.getAvgStarRate()>5){starRate=0;}
							else{starRate=(int)tp2.getAvgStarRate();}
							for (int i=0;i<starRate;++i){
							%>
							<i class="fa fa-star"></i>
							<% }
							for(int j=0;j<(5-starRate);++j){
							%>
							<i class="fa fa-star-o"></i>
							<% } %>
							<span id="starRateScore"><%=tp2.getAvgStarRate() %></span> Stars
						</p>
					</div>
					</p>
				</div>
				<div class="card">
					<div style="background: #333; height: 200px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp3.getTrvNo()%>"><img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp3.getTrvRepresentPic() %>" /></a></div>
					<div class="card-block">
						<h5 class="card-title" display="inline-block"><%=tp3.getTrvTitle() %></h5>
						<p class="card-text" display="inline-block"><i class="fa fa-map-marker"></i>
								<%=tp3.getTrvProvince()+"&nbsp;"+tp3.getTrvCity()+"&nbsp;"+tp3.getTrvAddress() %>.</p>
						<p class="card-text" display="inline-block">
							<%
							if(tp3.getAvgStarRate()<0||tp3.getAvgStarRate()>5){starRate=0;}
							else{starRate=(int)tp3.getAvgStarRate();}
							for (int i=0;i<starRate;++i){
							%>
							<i class="fa fa-star"></i>
							<% }
							for(int j=0;j<(5-starRate);++j){
							%>
							<i class="fa fa-star-o"></i>
							<% } %>
							<span id="starRateScore"><%=tp3.getAvgStarRate() %></span> Stars
						</p>
					</div>
				</div>
			</div>
	</div>
</div>
<BR>
<%
tplist=new travelSearchService().travelSearchCt(2);
tp1=tplist.get(0);
tp2=tplist.get(1);
tp3=tplist.get(2);

%>

<div class="box-padding-big light-bg">
	<div class="container">
		<h4 class="category-title">최고 즐길거리 top 3 Best things to enjoy</h4>
		<p class="category-sub">별점순 랭킹 The most popular enjoy place
			selected by our guests.</p>
		<div class="card-group">
			<div class="card">
				<div style="background: #333; height: 200px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp1.getTrvNo()%>"><img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp1.getTrvRepresentPic() %>" /></a></div>
				<div class="card-block">
					<h5 class="card-title"><%=tp1.getTrvTitle() %></h5>
					<p class="card-text"><i class="fa fa-map-marker"></i> <%=tp1.getTrvProvince()+"&nbsp;"+tp1.getTrvCity()+"&nbsp;"+tp1.getTrvAddress() %>.</p>
					<p class="card-text">
						<%
						if(tp1.getAvgStarRate()<0||tp1.getAvgStarRate()>5){starRate=0;}
						else{starRate=(int)tp1.getAvgStarRate();}
						for (int i=0;i<starRate;++i){
						%>
						<i class="fa fa-star"></i>
						<% }
						for(int j=0;j<(5-starRate);++j){
						%>
						<i class="fa fa-star-o"></i>
						<% } %>
						<span id="starRateScore"><%=tp1.getAvgStarRate() %></span> Stars
					</p>
				</div>
			</div>
			<div class="card">
				<div style="background: #333; height: 200px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp2.getTrvNo()%>"><img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp2.getTrvRepresentPic() %>" /></a></div>
				<div class="card-block">
					<h5 class="card-title"><%=tp2.getTrvTitle() %></h5>
					<p class="card-text"><i class="fa fa-map-marker"></i> <%=tp2.getTrvProvince()+"&nbsp;"+tp2.getTrvCity()+"&nbsp;"+tp2.getTrvAddress() %>.</p>
					<p class="card-text">
						<%
						if(tp2.getAvgStarRate()<0||tp2.getAvgStarRate()>5){starRate=0;}
								else{starRate=(int)tp2.getAvgStarRate();}
								for (int i=0;i<starRate;++i){
								%>
						<i class="fa fa-star"></i>
						<% }
								for(int j=0;j<(5-starRate);++j){
								%>
						<i class="fa fa-star-o"></i>
						<% } %>
						<span id="starRateScore"><%=tp2.getAvgStarRate() %></span> Stars
					</p>
				</div>
			</div>
			<div class="card">
				<div style="background: #333; height: 200px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp3.getTrvNo()%>"><img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp3.getTrvRepresentPic() %>" /></a></div>
				<div class="card-block">
					<h5 class="card-title"><%=tp3.getTrvTitle() %></h5>
					<p class="card-text"><i class="fa fa-map-marker"></i> <%=tp3.getTrvProvince()+"&nbsp;"+tp3.getTrvCity()+"&nbsp;"+tp3.getTrvAddress() %>.</p>
					<p class="card-text">
						<%
						if(tp1.getAvgStarRate()<0||tp1.getAvgStarRate()>5){starRate=0;}
						else{starRate=(int)tp3.getAvgStarRate();}
						for (int i=0;i<starRate;++i){
						%>
						<i class="fa fa-star"></i>
						<% }
						for(int j=0;j<(5-starRate);++j){
						%>
						<i class="fa fa-star-o"></i>
						<% } %>
						<span id="starRateScore"><%=tp3.getAvgStarRate() %></span> Stars
					</p>
				</div>
			</div>
			
		</div>
	</div>
</div>
<BR>
<%
tplist=new travelSearchService().travelSearchCt(3);
tp1=tplist.get(0);
tp2=tplist.get(1);
tp3=tplist.get(2);

%>

<div class="box-padding-big white-bg">
	<div class="container">
		<h4 class="category-title">전체 최고 먹을거리 top 3 Best things to eat</h4>
		<p class="category-sub">별점순 랭킹 top 3 The most popular eating
			foods selected by our guests.</p>
		<div class="card-group">
			<div class="card">
				<div style="background: #333; height: 200px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp1.getTrvNo()%>"><img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp1.getTrvRepresentPic() %>" /></a></div>
				<div class="card-block">
					<h5 class="card-title"><%=tp1.getTrvTitle() %></h5>
					<p class="card-text"><i class="fa fa-map-marker"></i> <%=tp1.getTrvProvince()+"&nbsp;"+tp1.getTrvCity()+"&nbsp;"+tp1.getTrvAddress() %>.</p>
					<p class="card-text">
						<%
						if(tp1.getAvgStarRate()<0||tp1.getAvgStarRate()>5){starRate=0;}
						else{starRate=(int)tp1.getAvgStarRate();}
						for (int i=0;i<starRate;++i){
						%>
						<i class="fa fa-star"></i>
						<% }
						for(int j=0;j<(5-starRate);++j){
						%>
						<i class="fa fa-star-o"></i>
						<% } %>
						<span id="starRateScore"><%=tp1.getAvgStarRate() %></span> Stars
					</p>
				</div>
			</div>
			<div class="card">
				<div style="background: #333; height: 200px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp2.getTrvNo()%>"><img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp2.getTrvRepresentPic() %>" /></a></div>
				<div class="card-block">
					<h5 class="card-title"><%=tp2.getTrvTitle() %></h5>
					<p class="card-text"><i class="fa fa-map-marker"></i> <%=tp2.getTrvProvince()+"&nbsp;"+tp2.getTrvCity()+"&nbsp;"+tp2.getTrvAddress() %>.</p>
					<p class="card-text">
						<%
						if(tp2.getAvgStarRate()<0||tp2.getAvgStarRate()>5){starRate=0;}
						else{starRate=(int)tp2.getAvgStarRate();}
						for (int i=0;i<starRate;++i){
						%>
						<i class="fa fa-star"></i>
						<% }
						for(int j=0;j<(5-starRate);++j){
						%>
						<i class="fa fa-star-o"></i>
						<% } %>
						<span id="starRateScore"><%=tp2.getAvgStarRate() %></span> Stars
					</p>
				</div>
			</div>
			<div class="card">
				<div style="background: #333; height: 200px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp3.getTrvNo()%>"><img src="<%=request.getContextPath() %>/images/travel_upload_imgs/<%=tp3.getTrvRepresentPic() %>" /></a></div>
				<div class="card-block">
					<h5 class="card-title"><%=tp3.getTrvTitle() %></h5>
					<p class="card-text"><i class="fa fa-map-marker"></i> <%=tp3.getTrvProvince()+"&nbsp;"+tp1.getTrvCity()+"&nbsp;"+tp3.getTrvAddress() %>.</p>
					<p class="card-text">
						<%
							if(tp3.getAvgStarRate()<0||tp3.getAvgStarRate()>5){starRate=0;}
							else{starRate=(int)tp3.getAvgStarRate();}
							for (int i=0;i<starRate;++i){
							%>
						<i class="fa fa-star"></i>
						<% }
							for(int j=0;j<(5-starRate);++j){
							%>
						<i class="fa fa-star-o"></i>
						<% } %>
						<span id="starRateScore"><%=tp3.getAvgStarRate() %></span> Stars
					</p>
				</div>
			</div>
		</div>
	</div>

</div>