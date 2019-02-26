<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tripAdviser.member.model.vo.Member" %>
<%
	Member loginMember=(Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>TripAdvisor</title>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
    <script src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
</head>
<style>
	
	#navbarDropdown, #menu {
/* 	text-shadow: -1px 0 #F2F1F6, 0 1px #F2F1F6, 1px 0 #F2F1F6, 0 -1px #F2F1F6; */
	text-shadow: 0 1px #F2F1F6;
	}
</style>
<script>
$(function(){
	htmlMenu(0);
});

function htmlMenu(choice)
{
	$.ajax({
		url:"<%=request.getContextPath()%>/category/menu.do",
		type : "POST",
		data : 'choice='+choice,
		dataType : "text",
		success : function(data){
			$("#mydiv").html(data);
	        document.getElementById('mydiv').scrollIntoView();
		},
		error:function(request,status,error){
		}
		
	})
	
	}
</script>


<body>
    <header>
        <div class="header">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent fixed" role="navigation">
                
                <img src="<%=request.getContextPath() %>/images/Symbol_logo_t.png" width="50px" height="50px" />
                <span>&nbsp;&nbsp;</span>
                <a class="navbar-brand" id="menu"  href="<%=request.getContextPath() %>/index.jsp">TripAdvisor</a>
   
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav mr-auto">
                              
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        휴식거리
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" onClick="htmlMenu(1)">호텔</a>
                                        <a class="dropdown-item" onClick="htmlMenu(2)">게스트하우스</a>
                                        <a class="dropdown-item" onClick="htmlMenu(3)">템플스테이</a>
                                    </div>
                                </li>
                                
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        즐길거리
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" onClick="htmlMenu(4)">볼거리</a>
                                        <!--<div class="dropdown-divider"></div>-->
                                        <a class="dropdown-item" onClick="htmlMenu(5)">놀거리</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        먹을거리
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" onClick="htmlMenu(6)">정식</a>
                                        <a class="dropdown-item" onClick="htmlMenu(7)">지역특산물</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" onClick="htmlMenu(8)">길거리음식</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        읽을거리
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="<%=request.getContextPath()%>/notice/noticeList">공지사항</a>
                                        <a class="dropdown-item" href="<%=request.getContextPath()%>/QnA/QnAList">Q/A</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">사이트소개</a>
                                    </div>
                                </li>
                            </ul>
              
                    <ul class="nav navbar-nav navbar-right">
                    <%if(loginMember==null){ %>
                        <li><input type="button" class="btn btn-outline-success my-2 my-sm-0" onclick="location.href='<%=request.getContextPath()%>/enrollpage'" value="Sign up"></li>
                        <li><input type="button" class="btn btn-outline-success my-2 my-sm-0" onclick="location.href='<%=request.getContextPath()%>/loginpage'" value="Log In"></li>
                         <%}else{ %>
                    <li><input type="button" class="btn btn-outline-success my-2 my-sm-0" value="MyPage" onclick="location.href='<%=request.getContextPath() %>/myPage'"></li>
                    <%if(loginMember != null && loginMember.getMemberId().equals("admin")) {%>
                    	<li><input type="button" class="btn btn-outline-success my-2 my-sm-0" value="TripManage" onclick="location.href='<%=request.getContextPath() %>/travel/TravelAdminListView'"></li> 
                    <%} %>
                    <li><input type="button" class="btn btn-outline-success my-2 my-sm-0" value="Logout" onclick="location.href='<%=request.getContextPath()%>/logout'"></li>
                    <%} %>
                    </ul>
                </div>
            </nav>


    </header>