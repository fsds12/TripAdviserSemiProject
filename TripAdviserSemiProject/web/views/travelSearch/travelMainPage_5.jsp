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
tplist=new travelSearchService().travelSearchCt(5);
tp1=tplist.get(0);
tp2=tplist.get(1);
tp3=tplist.get(2);

System.out.println("1성공?"+tp1+tp2+tp3);

%>
<style>
	#starRateScore {
		display: inline-block;
		font-size: 25px;
	}
	
div.card div img{width:370px; height:300px;}
</style>


<div class="box-padding-big light-bg">
	<div class="container">
		<h4 class="category-title">전체 최고 별점 Best things in our website</h4>
		<p class="category-sub">별점순 최고 호텔 랭킹 Top 3 The most popular Hotels
			selected by our guests.</p>
		<div class="card-group">
			<div class="card">
				<div style="background: #333; height: 300px;"><a href="<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp1.getTrvNo()%>"><img src="<%=tp1.getTrvRepresentPic()%>" /></a></div>
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
		</div>
	</div>
</div>
<BR>

<%
tplist=new travelSearchService().travelSearchCt(1);
tp1=tplist.get(0);
tp2=tplist.get(1);
tp3=tplist.get(2);

System.out.println("cate 1 성공?"+tp1+tp2+tp3);
%>


</div>