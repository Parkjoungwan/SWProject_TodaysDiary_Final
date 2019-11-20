<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="diary.Diary" %>
<%@ page import="diary.DiaryDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Diary</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
        }
        if(userID==null){
        	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.'.)");
			script.println("location.href='login.jsp'");
			script.println("</script>");
        }
        int diaryID = 0;
        if(request.getParameter("diaryID")!=null)
        {
        	diaryID = Integer.parseInt(request.getParameter("diaryID"));
        }
        if(diaryID==0){
        	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.'.)");
			script.println("location.href='diary.jsp'");
			script.println("</script>");
        }
        Diary diary = new DiaryDAO().getDiary(diaryID);
        if(!userID.equals(diary.getUserID())){
        	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.'.)");
			script.println("location.href='diary.jsp'");
			script.println("</script>");
        }
    %>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navar-collapse-1" aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">게시판 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-numbar-collapse-1">
			<ul class="nav navbar-nav"> 
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="diary.jsp">게시판</a></li>
            </ul>
            <%
                if(userID==null){
            %>
            <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle"
                            data-toggle="dropdown" role="button" aria-haspopup="true"
                            aria-expanded="false">회원관리<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="logoutAction.jsp">로그아웃</a></li>
                        </ul>
                </ul>
                <%
            }
                %>
		</div>
    </nav>
    <div class="container">
        <div class="row">
        	<form method="post" action="updateAction.jsp?diaryID=<%=diaryID%>">
            <table class= "table table-striped" style="text-align: center; border: 1px solid #dddddd";>
                <thead>
                    <tr>
                        <th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>

                    </tr>
                </thead>
                <tbody>
                   	<tr>
              			<td><textarea class="form-control" placeholder="글 내용" name="diaryContent" maxlength="2048" style="height: 350px;"><%= diary.getDiaryContent() %></textarea></td>
                    </tr>
                </tbody>                      
            </table>
            	 <input type="submit" class="btn btn-primary pull-right" value="글 수정">
			</form>
        </div>
    </div>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>