<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/vegas.min.css">
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">

<nav id="notice-menu">
	<div id="menu-container">            
    	<button onclick="location.href='<%=request.getContextPath()%>/views/notice/noticeBoard.jsp'">NOTICE</button>
        <button onclick="location.href='<%=request.getContextPath()%>/views/QnA/QnABoard.jsp'">Q&A</button>
     </div>
 </nav> 
 
