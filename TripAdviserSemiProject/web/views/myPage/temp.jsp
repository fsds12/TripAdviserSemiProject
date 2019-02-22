<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, tripAdviser.travel.product.model.vo.TravelProduct" %>
<%
	@SuppressWarnings (value="unchecked")
	List<TravelProduct> scrapList = (List<TravelProduct>)request.getAttribute("scrapList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(scrapList != null) {
	for(TravelProduct tp : scrapList) {%>
		<p><%=tp.getTrvTitle() %>&nbsp;&nbsp; <%=tp.getAvgStarRate() %></p>
	<%}
} else {%>
	<p>스크랩이 없습니다!</p>
<%} %>
</body>
</html>