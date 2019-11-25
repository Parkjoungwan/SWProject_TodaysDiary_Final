<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.UserDAO"%>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="user" class="user.User" scope="page">
   		<jsp:setProperty property="userID" name="user"/>
    	<jsp:setProperty property="userPassword" name="user"/>
    	<jsp:setProperty property="userEmail" name="user"/>
    	<jsp:setProperty property="userAge" name="user"/>
    </jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary</title>
</head>
<body>
	<%
        session.invalidate();
    %>
    <script>
        location.href = 'login_d.jsp'
    </script>
</body>
</html>