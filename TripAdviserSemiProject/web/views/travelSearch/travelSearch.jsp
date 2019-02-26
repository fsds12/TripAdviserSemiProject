<%@page import="java.text.DecimalFormat"%>
<%@page import="tripAdviser.travel.search.controller.travelProductListAllServlet"%>
<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,tripAdviser.travel.product.model.vo.*,tripAdviser.travel.search.model.service.*" %>

<%@ include file="/views/common/header.jsp" %>
<link href="https://fonts.googleapis.com/css?family=Gaegu" rel="stylesheet">
   
<% 
	//검색어top3
	List<TravelProduct> toplist = (List)request.getAttribute("toplist");
	
	
	//System.out.println("되니??"+tplist.size());
	//tp=tplist.get(0);
	//숙박top3
	List<TravelProduct> sleeplist = (List)request.getAttribute("sleepList");
	System.out.println(sleeplist.size());
	//액티비티top3
	List<TravelProduct> aclist = (List)request.getAttribute("acList");
	System.out.println(aclist.size());
	
	//맛집top3
	List<TravelProduct> eatlist = (List)request.getAttribute("eatList");
	System.out.println(eatlist.size());
	
	String searchkey = (String)request.getAttribute("searchkey");

		
	/* DecimalFormat format = new DecimalFormat(".#"); */
	
			
%>

<style>
#starRateScore{
   display: inline-block;
   font-size: 25px;
}
section#search-before div.container div.card-group div.card {
	max-width: 33%;
}
section#search-before div.container #nosearch{
	font-size:50px;
	font-family:Gaegu;
	 color: #3E9D37; 
   
}


</style>


<section id="search-before">
    <form id="searchkey" action="<%=request.getContextPath()%>/travel/travelSearch" method="post">
  	<br>         
        <div style="display:block; width:800px;">
	         <input class="form-control" type="text" id="searchkey" name="searchkey"  placeholder="여행지 입력" value="<%=searchkey %>" style="display:inline-block">&nbsp;
	         <button type="submit" id="searchbtn1" name="searchbtn1" class="btn btn-secondary" style="padding: 0px;display:inline-block">여행지 검색</button>
        </div>
    </form>
<br><br><br><br>

&nbsp;&nbsp;&nbsp;<span style="font-family:Gaegu;font-size: 40px;">검색어 Top3</span> <%-- &nbsp;&nbsp;<a href="<%=request.getContextPath()%>/travelDetail">more</a> --%>
<hr id="hrf" >
<div class="box-padding-big light-bg" >
	<div class="container">	
		<div class="card-group">
<%if(toplist.size() > 0) {%>
<%for(int i=0; i<toplist.size(); i++){
	
	 if(i == 3) {
		break;
	 } 	 
%> 
	      
<div class="card">
	
<a href="<%= request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=toplist.get(i).getTrvNo()%>"><img class="card-img-top" src="<%=toplist.get(i).getTrvRepresentPic() %>" style="height:200px" ></a>

	 <div class="card-block">
	 <h5 class="card-title">&nbsp;&nbsp;&nbsp;<%=toplist.get(i).getTrvTitle() %></h5>
	 <p class="card-text">&nbsp;&nbsp;&nbsp;<%=toplist.get(i).getTrvAddress() %></p>
	 <p class="card-text"></p>	
		<div class="starRev">&nbsp;&nbsp;

<%    
   for(int k=0; k<(int)toplist.get(i).getAvgStarRate(); k++){
%>
<span class="starR on"></span>
   <% }
   for(int j=0; j<(5-(int)toplist.get(i).getAvgStarRate()); j++){
   %>
   <span class="starR"></span>
   <% } %>
<span id="starRateScore"><%=toplist.get(i).getAvgStarRate() %></span> Stars
  
		</div>
	
	</div>
</div>
	
	<%} %>
		</div>
		<%} else{ %>
		<img src="<%=request.getContextPath() %>/images/Symbol_logo_t.png" width="70px" height="70px" /><p id="nosearch">검색결과가 없습니다!!</p>
		<%} %>
	</div>
</div> 

    <br><br><br>

&nbsp;&nbsp;&nbsp;<span style="font-family:Gaegu;font-size: 40px">머물거리 Top3</span> &nbsp;&nbsp;
<%if(sleeplist.size()!=0) {%>
<a href="<%=request.getContextPath()%>/detail?category=CL01&searchkey=<%=searchkey %>">more</a>
<%} %>
<br>
<hr id="hrf" >
<div class="box-padding-big white-bg" >
	<div class="container">	
		<div class="card-group">
<%if(sleeplist.size() > 0)  {%>
<%for(int i=0; i<sleeplist.size(); i++){
	if(i == 3){
		break;
	}
%> 
	      
			<div class="card">			
<a href="<%= request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=sleeplist.get(i).getTrvNo()%>"><img class="card-img-top" src="<%=sleeplist.get(i).getTrvRepresentPic() %>" style="height:200px"></a>
	
	<div class="card-block">
			<h5 class="card-title">&nbsp;&nbsp;&nbsp;<%=sleeplist.get(i).getTrvTitle() %></h5>
			<p class="card-text">&nbsp;&nbsp;&nbsp;<%=sleeplist.get(i).getTrvAddress() %></p>
			<p class="card-text"></p>
			
<div class="starRev">&nbsp;&nbsp;

<%    
     for(int k=0; k<(int)sleeplist.get(i).getAvgStarRate(); k++){
%>
<span class="starR on"></span>
<% }
	for(int j=0; j<(5-(int)sleeplist.get(i).getAvgStarRate()); j++){
%>
<span class="starR"></span>
<% } %>
<span id="starRateScore"><%=sleeplist.get(i).getAvgStarRate() %></span> Stars

</div>
					
	</div>
		</div>

			<%} %>
		</div>
		<%} else{ %>
		<img src="<%=request.getContextPath() %>/images/Symbol_logo_t.png" width="70px" height="70px" /><p id="nosearch">검색결과가 없습니다!!</p>
		<%} %>
	</div>
</div> 
        <br><br><br>

&nbsp;&nbsp;&nbsp;<span style="font-family:Gaegu;font-size: 40px">즐길거리 Top3</span> &nbsp;&nbsp;
<%if(aclist.size()!=0) {%>
<a href="<%=request.getContextPath() %>/detail?category=CL02&searchkey=<%=searchkey %>">more</a>
<%} %>
<hr id="hrf" >
<div class="box-padding-big light-bg" >
	<div class="container">
		<div class="card-group">
<%if(aclist.size() > 0) {%>
<%for(int i=0; i<aclist.size(); i++){
	if(i == 3){
		break;
	}
%> 

<div class="card">
	
<a href="<%= request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=aclist.get(i).getTrvNo()%>"><img class="card-img-top" src="<%=aclist.get(i).getTrvRepresentPic() %>" style="height:200px"></a>

	<div class="card-block">



<h5 class="card-title">&nbsp;&nbsp;&nbsp;<%=aclist.get(i).getTrvTitle() %></h5>
<p class="card-text">&nbsp;&nbsp;&nbsp;<%=aclist.get(i).getTrvAddress() %></p>
<p class="card-text"></p>
			
<div class="starRev">&nbsp;&nbsp;

<%    
    for(int k=0; k<(int)aclist.get(i).getAvgStarRate(); k++){
%>
<span class="starR on"></span>
	     <% }
	     for(int j=0; j<(5-(int)aclist.get(i).getAvgStarRate()); j++){
	     %>
	     <span class="starR"></span>
	     <% } %>
<span id="starRateScore"><%=aclist.get(i).getAvgStarRate() %></span> Stars
 
</div>
					
			</div>
		</div>

			<%} %>
		</div>
		<%} else{ %>
		<img src="<%=request.getContextPath() %>/images/Symbol_logo_t.png" width="70px" height="70px" /><p id="nosearch">검색결과가 없습니다!!</p>
		<%} %>
	</div>
</div> 
<br><br><br>

&nbsp;&nbsp;&nbsp; <span style="font-family:Gaegu;font-size: 40px">먹을거리 Top3</span> &nbsp;&nbsp;
<%if(eatlist.size()!=0) {%>
<a href="<%=request.getContextPath()%>/detail?category=CL03&searchkey=<%=searchkey %>">more</a>
<%} %>
  <hr id="hrf" >
<div class="box-padding-big white-bg" >
	<div class="container" >
		<div class="card-group" >
<%if(eatlist.size() > 0) {%>
<%for(int i=0; i<eatlist.size(); i++){
	if(i == 3){
		break;
	}
%> 
	      
			<div class="card">
				
			<a href="<%= request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=eatlist.get(i).getTrvNo()%>"><img class="card-img-top" src="<%=eatlist.get(i).getTrvRepresentPic() %>" style="height:200px"></a>
	
				<div class="card-block">
<h5 class="card-title">&nbsp;&nbsp;&nbsp;<%=eatlist.get(i).getTrvTitle() %></h5>
<p class="card-text">&nbsp;&nbsp;&nbsp;<%=eatlist.get(i).getTrvAddress() %></p>
<p class="card-text"></p>	
			
<div class="starRev">&nbsp;&nbsp;

<%    
     for(int k=0; k<(int)eatlist.get(i).getAvgStarRate(); k++){
%>
   	<span class="starR on"></span>
	     <% }
	     for(int j=0; j<(5-(int)eatlist.get(i).getAvgStarRate()); j++){
	     %>
	     <span class="starR"></span>
	     <% } %>
	<span id="starRateScore"><%=eatlist.get(i).getAvgStarRate() %></span> Stars
  
</div>
				
			</div>
		</div>

			<%} %>
		</div>
		<%} else{ %>
		<img src="<%=request.getContextPath() %>/images/Symbol_logo_t.png" width="70px" height="70px" /><p id="nosearch">검색결과가 없습니다!!</p>
		<%} %>
	</div>
</div> 
<br><br><br>
</section>
    
    
    
 <!--    <script>
    	function sleeptp(){
    		var url=""
    	}
    </script> -->
    
    <!-- <script>
    $('.starRev span').click(function(){
    	  $(this).parent().children('span').removeClass('on');
    	  $(this).addClass('on').prevAll('span').addClass('on');
    	  return false;
    	});
    </script>
    
     -->
    
    
    
    
    
    
    
    
    

<%@ include file="/views/common/footer.jsp" %>