<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("<%=request.getAttribute("msg") %>");
	<%-- location.href = "<%=request.getContextPath() + request.getAttribute("loc") %>"; --%>
	location.href = "<%=request.getContextPath() %><%=request.getAttribute("loc") %>";
	<%=request.getAttribute("script") %>
</script>
</head>
<body>

</body>
</html>