<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,tripAdviser.travel.product.model.vo.*,tripAdviser.travel.search.model.service.*"%>

<%@ include file="/views/common/header.jsp" %>
<%

	List<TravelProduct> list = (List)request.getAttribute("searchCategoryDetailList");
	String pageBar=(String)request.getAttribute("pageBar");
	int cPage=(int)request.getAttribute("cPage");
	int numPerPage=(int)request.getAttribute("numPerPage");
	String searchKey = (String)request.getAttribute("searchKey");
%>
<style>
   #starRateScore{
      display: inline-block;
      font-size: 25px;
   }
  
   section#search-after div.container div.card-group div.card {
   max-width: 33%;
   }
</style>



<section id="search-after">
        <form id="searchkey" action="<%=request.getContextPath()%>/travel/travelSearch" method="post">
            <br>
             <div style="display:block; width:800px;">
	         <input class="form-control" type="text" id="searchkey" name="searchkey"  placeholder="여행지 입력" value="<%=searchKey %>" style="display:inline-block">&nbsp;
	         <button type="submit" id="searchbtn1" name="searchbtn1" class="btn btn-secondary" style="padding: 0px;display:inline-block">여행지 검색</button>
        </div>
        </form>
<br><br><br><br>
        
        
<%-- &nbsp;&nbsp;&nbsp;<span style="font-size: 25px;">검색어 : </span>	<span><%=searchKey %></span>  --%>	
&nbsp;&nbsp;&nbsp;<span style="font-size: 25px;">선택된 카테고리  : </span> <span><%=list.get(0).getTrvLargeCtg() %></span>
<hr id="hrf" >

<div class="container" >	
<%for(int i=0; i<list.size(); i++) {%>
<%if(i%3 == 0)  {%><br><br>
	<div class="card-group" id="sear-af">
<%} %>
 	
      <div class="card">
         <a href="<%= request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=list.get(i).getTrvNo()%>"><img class="card-img-top" src="<%=list.get(i).getTrvRepresentPic() %>" style="height:200px"></a>
         <div class="card-block">
            <h5 class="card-title">&nbsp;&nbsp;&nbsp;<%=list.get(i).getTrvTitle() %></h5>
			<p class="card-text">&nbsp;&nbsp;&nbsp;<%=list.get(i).getTrvAddress() %></p>
            <p class="card-text">
              <div class="starRev">&nbsp;&nbsp;

	<%    
	     for(int k=0; k<(int)list.get(i).getAvgStarRate(); k++){
	%>
	      <span class="starR on"></span>
	     <% }
	     for(int j=0; j<(5-(int)list.get(i).getAvgStarRate()); j++){
	     %>
	     <span class="starR"></span>
	     <% } %>
  <span id="starRateScore"><%=list.get(i).getAvgStarRate() %></span> Stars
  
			</div>
         </div>
      </div>
   
 <%if(i%3 == 2 || i == list.size()-1)  {%>     
  	 </div>
   <%} %>
  <%} %>
</div>
<br><br><br><br>
<nav>
	<%=pageBar %>
</nav>
</section>

<%@ include file="/views/common/footer.jsp" %>