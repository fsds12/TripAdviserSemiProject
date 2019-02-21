<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="tripAdviser.member.model.vo.Member"%>
<%
	Member m = (Member)session.getAttribute("loginMember");
	String id = ""; 
	if(m != null) {
		id = m.getMemberId();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page Main</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/myPage.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$('#tab1').click(function() {
			$.ajax({
				url: "<%=request.getContextPath()%>/myPage/myProfile",
				type: "post",
				dataType: "html",
				success: function(data) {
					$("#my-info").html(data);
				},
				error: function(request, status, error) {
					
				}
			});
		});
		
		$('#tab2').click(function() {
			$.ajax({
				url: "<%=request.getContextPath()%>/myPage/myScrap?id=" + "<%=id %>",
				type: "post",
				dataType: "html",
				success: function(data) {
					$("#my-scraps").html(data);
				},
				error: function(request, status, error) {
					
				}
			});
		});
		
		$('#tab3').click(function() {
			$.ajax({
				url: "<%=request.getContextPath()%>/myPage/myComment?id=" + "<%=id %>",
				type: "post",
				dataType: "html",
				success: function(data) {
					$("#my-comments").html(data);
				},
				error: function(request, status, error) {
					
				}
			});
		});
		/*
		$('#tab4').click(function() {
			$.ajax({
				url: "<%=request.getContextPath()%>/",
				type: "post",
				dataType: "html",
				success: function(data) {
					$("#my-follows").html(data);
				},
				error: function(request, status, error) {
					
				}
			});
		});
		
		<%if(id.equals("admin")) {%>
			$('#tab5').click(function() {
				$.ajax({
					url: "<%=request.getContextPath()%>/",
					type: "post",
					dataType: "html",
					success: function(data) {
						$("#add-trip").html(data);
					},
					error: function(request, status, error) {
						
					}
				});
			});
			
			$('#tab6').click(function() {
				$.ajax({
					url: "<%=request.getContextPath()%>/",
					type: "post",
					dataType: "html",
					success: function(data) {
						$("#trips-list").html(data);
					},
					error: function(request, status, error) {
						
					}
				});
			});
		<%}%>
		*/
	});
</script>
</head>
<body>
<div class="mypage-header">
	<span class="mypage-spacer"> </span>
	<img src="<%=request.getContextPath() %>/images/Symbol_logo_t.png" width="50px" height="50px" />
	<span>&nbsp;&nbsp;</span>
	<a id="menu"  href="<%=request.getContextPath() %>/index.jsp">TripAdvisor</a>
</div>
<section id='mypage-main-section'>
	<article id='main'>    
		<input id="tab1" type="radio" name="tabs">
		<label for="tab1">My Info</label>
		  
		<input id="tab2" type="radio" name="tabs">
		<label for="tab2">My Scraps</label>
		  
		<input id="tab3" type="radio" name="tabs">
		<label for="tab3">My Comments</label>
		  
		<!-- <input id="tab4" type="radio" name="tabs">
		<label for="tab4">My Follows</label> -->
	    
		<%if(id.equals("admin")) {%>  
			<input id="tab5" type="radio" name="tabs">
			<label for="tab5">Add Trip</label>
			  
			<input id="tab6" type="radio" name="tabs">
			<label for="tab6">Trips List</label>
		<%} %>
	    
	    
	    
	  
		<div id="my-info" class='tab'>
		</div>
		    
		<div id="my-scraps" class='tab'>
		</div>
		    
		<div id="my-comments" class='tab'>
		</div>
		  
		<div id="my-follows" class='tab'>
		</div>

		<%if(id.equals("admin")) {%>
			<div id="add-trip" class='tab'>
			</div>
	
			<div id="trips-list" class='tab'>
			</div>
		<%} %>
	</article>
</section>
<%@ include file="/views/common/footer.jsp" %>
