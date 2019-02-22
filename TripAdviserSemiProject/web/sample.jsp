<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<a href="<%=request.getContextPath() %>/travel/travelProductDetail?trvNo=1">test</a>
<form action="<%=request.getContextPath() %>/travel/travelSearch">
	<input type="text" name="searchInput" />
	<input type="submit" value="검색" /> <br>
	<input type="file" />
</form>
<section>
<div class="container mt-3">
  <h2>탭</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" href="#home">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#menu1">Menu 1</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#menu2">Menu 2</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="container tab-pane fade"><br>
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="container tab-pane fade"><br>
      <%@include file="/views/travelManage/travelWrite.jsp" %>
    </div>
  </div>
</div>

<br><br><BR><BR><BR><BR>
<style>
	div.box-padding-big div.container div.card-group div.card {
		max-width: 300px;
	}
</style>
<div class="box-padding-big white-bg" >
	<div class="container" >
		<div class="card-group" >

         <%for(int i=0; i<2; i++){
            if(i == 3){
               break;
            }
         %> 
         
			<div class="card">
            
            	<a href=""><img class="card-img-top" src="http://korad.ecatalog.kr/file/webzine/79/wz_79_12_4_1505640412.jpg" style="height:300px"></a>
   
			<div class="card-block">
      
   
   
	         <h5 class="card-title">&nbsp;&nbsp;&nbsp;제목</h5>
	         <p class="card-text">&nbsp;&nbsp;&nbsp;내용</p>
	         <p class="card-text"><div class="starRev">&nbsp;&nbsp;
			<%    
	        for(int k=0; k<2; k++){
			%>
				<span class="starR on"></span>
			        <% }
			        for(int j=0; j<5-2; j++){
			        %>
			        <span class="starR"></span>
			        <% } %>
				<span id="starRateScore">3.0</span> Stars
  
			</div>
         	</p>      
      </div>
      </div>

         <%} %>
      </div>
   </div>
</div> 

<script>
$(document).ready(function(){
  $(".nav-tabs a").click(function(){
    $(this).tab('show');
  });
});
</script>
	
</section>
</body>
</html>