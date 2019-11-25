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
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Diary</title>
<style type="text/css">
		a, a:hover{
			color: #000000;
			text-decoration: none;
		}
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
	
    <div class="container">
        <div class="row">
            <table class= "table table-striped" style="text-align: center; border: 1px solid #dddddd";>
                <thead>
                    <tr>
                        <th style="background-color: #eeeeee; text-align: center;">번호</th>
                        <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                        <th style="background-color: #eeeeee; text-align: center;">나이대</th>
                        <th style="background-color: #eeeeee; text-align: center;">작성일</th>
                    </tr>
                </thead>
                <tbody>
                <%
                	DiaryDAO diaryDAO = new DiaryDAO();
                	ArrayList<Diary> list = diaryDAO.getMylist(pageNumber, userID);
                	for(int i=0;i<list.size();i++){
                %>
                    <tr>
                        <td><a href="view_d.jsp?diaryID=<%= list.get(i).getDiaryID() %>"><%= list.get(i).getDiaryID() %></a></td>
                        <td><%= list.get(i).getUserID() %></td>
                        <td><%= list.get(i).getUserAge() %></td>
                        <td><%= list.get(i).getDiaryDate().substring(0,11)+list.get(i).getDiaryDate().substring(11,13)+"시"+list.get(i).getDiaryDate().substring(14,16)+"분" %></td>
                    </tr>
                    <%}
                	%>
                </tbody>
            </table>
            <%
            	if(pageNumber!=1)
            	{
            %>
            		<a href="diary.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
            <%
            	}if(diaryDAO.nextPage(pageNumber +1)){
            %>
            	<a href="diary.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
            <%
            	}
            %>
		        
    </div>
   

</body>
</html>