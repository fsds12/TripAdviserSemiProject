<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Collections, java.util.List, java.util.ArrayList, java.util.HashSet, tripAdviser.travel.product.model.vo.TravelProduct" %>
<%
	@SuppressWarnings (value="unchecked")
	List<TravelProduct> scrapList = (List<TravelProduct>)request.getAttribute("scrapList");
	List<String> trvProvinceList = new ArrayList<String>();
	for(TravelProduct tp : scrapList) {
		trvProvinceList.add(tp.getTrvProvince());
	}
	HashSet<String> distinctData = new HashSet<String>(trvProvinceList);
	trvProvinceList = new ArrayList<String>(distinctData);
	Collections.sort(trvProvinceList);
%>
<style>
section#my-scrap-container {
	border: 0px solid red;
	width: 100%;
}
section#my-scrap-container article {
	display: block;
	max-width: 800px;
	margin: auto;
	border: 0px solid yellow;
}
section#my-scrap-container div {
	border: 0px solid black;
}
section#my-scrap-container div.scrap-row {
	display: flex;
}
section#my-scrap-container div.scrap-col {
	display: inline-block;
	width: 25%;
	height: 150px;
}
section#my-scrap-container div.card-group div {
}
</style>
<section id='my-scrap-container'>
	<article>
	<%-- <%for(int i=0; i<12; i++) {%>
		<%if(i%4 == 0) {%>
			<div class='scrap-row'>
		<%} %>
		<%if(i == 0) {%>
				<div id='scrap-default-folder' class='scrap-col'>
					기본폴더
				</div>
		<%} else{ %>
				<div class='scrap-col'>
					추가될폴더
				</div>
		<%} %>
		<%if(i%4 == 3) {%>
			</div>
		<%} %>
	<%} %> --%>
	<%if(scrapList != null) {
		for(int i=0; i<trvProvinceList.size(); i++){%>
			<p><span style="font-size: 20px; font-weight: bold;"><%=trvProvinceList.get(i) %></span></p><br>
			<div class='card-group'>
			<%for(int j=0; j<scrapList.size(); j++) {
				TravelProduct tp = scrapList.get(j);
			%>
				<%if(tp.getTrvProvince().equals(trvProvinceList.get(i))) {%>
					<div class="card" style="max-width:33%; border:1px solid lightgray" onclick="location.href='<%=request.getContextPath() %>/travel/travelProductDetail?trvNo=<%=tp.getTrvNo() %>'">
						<img class="card-img-top" src="<%=tp.getTrvRepresentPic() %>" alt="sfsf" style="width:100%; height:170px;">
						<div class="card-body" style="padding:5px;">
							<h6 class="card-title" style="text-align: left; font-weight: bold;"><%=tp.getTrvTitle() %></h6>
							<p class="card-text"><i class="fa fa-map-marker"></i><%=tp.getTrvProvince()+"&nbsp;"+tp.getTrvCity()+"&nbsp;"+tp.getTrvAddress() %>.</p>
							<p class="card-text">
								<%
								int starRate=0;
								if(tp.getAvgStarRate()<0||tp.getAvgStarRate()>5){starRate=0;}
								else{starRate=(int)tp.getAvgStarRate();}
								for (int k=0;k<starRate;++k){
								%>
								<i class="fa fa-star"></i>
								<% }
								for(int k=0;k<(5-starRate);++k){
								%>
								<i class="fa fa-star-o"></i>
								<% } %>
								<span id="starRateScore"><%=Math.floor(tp.getAvgStarRate()*10)/10 %></span> Stars
							</p>
						</div>
					</div>
				<%} %>
			<%}%>
			</div>
			<hr />
		<%} %> 
	<%}%>
	</article>
	<%-- <%if(scrapList != null) {
	for(TravelProduct tp : scrapList) {%>
		<p><%=tp.getTrvTitle() %>&nbsp;&nbsp; <%=tp.getAvgStarRate() %></p>
	<%}
	} else {%>
		<p>스크랩이 없습니다!</p>
	<%} %> --%>
</section>