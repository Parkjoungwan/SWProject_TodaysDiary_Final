<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<title>오늘의 교환일기_main</title>
	<meta http-equiv="Content-Type" charset="UTF-8" name=viewport
		content="width=device-width, initial-scale=1, user-scalable=0">
	<style type="text/css">
		body {
			margin: 0px auto;
			background-color: #FFFFFF;
			box-sizing: border-box;
		}
		div.top {
			background: #00218c;
			position: fixed;
			top: 0;
			left: 0;
			right: 0;
			box-sizing: border-box;
			height: 50px;
			z-index: 1;
			margin: 0;
			padding: 0;
		}
		p.appname {
			position: relative;
			padding-top: 35%;
			padding-left: 30%;

		}
		footer {
			position: relative;
			padding-top: 50;
			bottom: 0;
			width: 100%;
			text-align: center;
		}
	</style>
</head>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
        }
    %>
	<div>
			<div class="top"></div>
			<div class="image">
				<p class="appname">
					<a href="javascript:void(window.open('login_d.jsp', 'new', 'width=400,height=800,status=no,scrollbars=yes,menubar=no,resizable=no,'))"><img src="images/appname.png" style="max-width: 90%; height: auto;"></a>
				</p>

				<footer>
					<img src="images/logo.png" style="max-width: 10%;">
				</footer>
			</div>
	</div>
</body>
</html>