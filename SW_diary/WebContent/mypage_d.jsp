<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="diary.DiaryDAO" %>
<%@ page import="diary.Diary" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<title>Diary</title>
<style type="text/css">

body{
	margin: 0px auto;
	background-color: #FFFFFF;
	box-sizing : border-box;
}


div.top{
	background: #00218c;
    position: fixed;
	top:0;
    left: 0;
    right: 0;
	box-sizing : border-box;
    height: 70px;
    z-index: 1;
    margin: 0;
    padding: 0;
}
p.top{
	position: relative;
	padding-top: 20%;
	text-align: center;

}
div.login{
	position: relative;
	text-align: center;
	z-index: -1;
}

input{
	z-index: 1;
	position: absolute;
	text-align: left;
	position: absolute;
	font-size: 100%;
	border:none;

}

input.b24{
	top: 63%;
	left: 33%;
	font-size: 100%;
	width: 10%;
	height: 9%;
	border:none;
	padding: 0%;
	opacity: 0;


}

input.b25{
	top: 63%;
	left: 45%;
	font-size: 100%;
	width: 10%;
	border:none;
	height: 9%;
	padding: 0%;
	opacity: 0;

}


</style>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
        }
        int pageNumber =1;
        if(request.getParameter("pageNumbe")!=null){
        	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }
    %>
    
    <div class="top"></div>
		<p class="top">
			<img src="images/calendar_top.png" style="max-width: 80%; height: auto;" >
		</p>
		
		<div class="login">
		<img src="images/calendar_middle.png" style="max-width: 85%; height:auto;">
		</div>
		
		<%
                	DiaryDAO diaryDAO = new DiaryDAO();
                	ArrayList<Diary> list = diaryDAO.getMylist(pageNumber, userID);
                	for(int i=0;i<list.size();i++){
                %>
    	<a href="view_d.jsp?diaryID=<%= list.get(i).getDiaryID() %>"><input class="b25" type="button" name="25b" value=""></a>
    <%} %>
    
    <hr style="border: solid 2px #353c54; margin-top: 10;">
			<div class="bottom_bar" style="padding-top:3%;">
				<a href="day.jsp"><img src="images/home_1.png" style="max-width: 10%;height: auto; padding-left:12% ;padding-top:2px;"></a>
				<a href="mypage_d.jsp"><img src="images/my_diary.png" style="max-width:15%; height: auto; padding-left: 18%;padding-top:3px;"></a>
				<a href="logoutAction_d.jsp"><img src="images/logout.png" style="max-width: 14%; height: auto;padding-left: 18%;"></a>
			</div>

</body>
</html>