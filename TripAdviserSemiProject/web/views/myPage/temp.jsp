<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, tripAdviser.travel.product.model.vo.TravelProduct" %>
<%
	@SuppressWarnings (value="unchecked")
	List<TravelProduct> scrapList = (List<TravelProduct>)request.getAttribute("scrapList");
%>
<style>
section#my-scrap-container {
	border: 1px solid red;
	width: 100%;
}
section#my-scrap-container article {
	display: block;
	max-width: 800px;
	margin: auto;
	border: 1px solid yellow;
}
section#my-scrap-container div {
	border: 1px solid black;
}
section#my-scrap-container div.scrap-row {
	display: flex;
}
section#my-scrap-container div.scrap-col {
	display: inline-block;
	width: 25%;
	height: 150px;
}
</style>
<section id='my-scrap-container'>
	<article>
	<%for(int i=0; i<12; i++) {%>
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
	<%} %>
	</article>
	<%-- <%if(scrapList != null) {
	for(TravelProduct tp : scrapList) {%>
		<p><%=tp.getTrvTitle() %>&nbsp;&nbsp; <%=tp.getAvgStarRate() %></p>
	<%}
	} else {%>
		<p>스크랩이 없습니다!</p>
	<%} %> --%>
</section>