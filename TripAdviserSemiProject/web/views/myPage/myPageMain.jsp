<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page Main</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/myPage.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="mypage-header">
          <span class="mypage-spacer"> </span>
                <img src="<%=request.getContextPath() %>/images/Symbol_logo_t.png" width="50px" height="50px" />
                <span>&nbsp;&nbsp;</span>
                <a id="menu"  href="<%=request.getContextPath() %>/index.jsp">TripAdvisor MyPages</a>
          
                </div>
<main>
  
  <input id="tab1" type="radio" name="tabs" checked>
  <label for="tab1">My Info</label>
    
  <input id="tab2" type="radio" name="tabs">
  <label for="tab2">My Scraps</label>
    
  <input id="tab3" type="radio" name="tabs">
  <label for="tab3">My Comments</label>
    
  <input id="tab4" type="radio" name="tabs">
  <label for="tab4">My Follows</label>
    
    
  <input id="tab5" type="radio" name="tabs">
  <label for="tab5">Add Trip</label>
    
  <input id="tab6" type="radio" name="tabs">
  <label for="tab6">Trips List</label>
    
    
    
    
  <section id="content1">
    <p>
      1111111111111 
    </p>
  </section>
    
  <section id="content2">
    <p>
     22222222222222
    </p>
  </section>
    
   <section id="content3">
    <p>
     3333333333333333333
    </p>
  </section>
  
   <section id="content4">
    <p>
     4444444444444444444
    </p>
  </section>
   <section id="content5">
<%@ include file="/views/travelManage/travelUpdate.jsp" %>

  </section>
     <section id="content6">
<%@ include file="/views/travelManage/travelUpdate.jsp" %>

  </section>
</main>

<%@ include file="/views/common/footer.jsp" %>
