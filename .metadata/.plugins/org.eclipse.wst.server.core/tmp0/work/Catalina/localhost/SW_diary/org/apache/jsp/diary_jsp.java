/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.53
 * Generated at: 2019-11-24 08:58:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.PrintWriter;
import diary.DiaryDAO;
import user.UserDAO;
import diary.Diary;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Random;
import javax.servlet.http.HttpSession;

public final class diary_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("javax.servlet.http.HttpSession");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("java.util.ArrayList");
    _jspx_imports_classes.add("java.util.Random");
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("diary.Diary");
    _jspx_imports_classes.add("diary.DiaryDAO");
    _jspx_imports_classes.add("user.UserDAO");
    _jspx_imports_classes.add("java.util.Date");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width-device-width\", initial-scale=\"1\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/bootstrap.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/custom.css\">\r\n");
      out.write("<title>Diary</title>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("a, a:hover{\r\n");
      out.write("\tcolor: #000000;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("}</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    ");

        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
        }
        Boolean canWrite = false;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
            //해당 유저 아이디로 글을 검색하는데 마지막 작성일을 가져와야해요.
            UserDAO userDAO = new UserDAO();
            Diary diary = userDAO.getDiaryByUserID(userID);
            if(diary == null){//글이 없는 경우
               //글쓰기 가능
               System.out.println("글쓰기 가능");
               canWrite = true;
            }else {
               String diaryDate = diary.getDiaryDate().split(" ")[0];
               
               Date nowDate = new Date();
               SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
               
               String nowFormatedDate = sdf.format(nowDate);

               if(diaryDate.equals(nowFormatedDate)){//글이 있는데 마지막 작성일 날짜가 과거일때
                  //글쓰기 불가능
                  System.out.println("글쓰기 불가능");
                  canWrite = false;
               }else {//글이 있는데 날짜가 작성일 오늘일때
                  //글쓰기 가능
                  System.out.println("글쓰기 가능");
                  canWrite = true;
               }
            }
        } else {
           // 로그인이 안되어있을때
        }
        int pageNumber =1;
        if(request.getParameter("pageNumbe")!=null){
        	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }
    
      out.write("\r\n");
      out.write("\t<nav class=\"navbar navbar-default\">\r\n");
      out.write("\t\t<div class=\"navbar-header\">\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#bs-example-navar-collapse-1\" aria-expanded=\"false\">\r\n");
      out.write("\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t</button>\r\n");
      out.write("\t\t\t<a class=\"navbar-brand\" href=\"main.jsp\">게시판 사이트</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"collapse navbar-collapse\" id=\"bs-example-numbar-collapse-1\">\r\n");
      out.write("\t\t\t<ul class=\"nav navbar-nav\"> \r\n");
      out.write("\t\t\t\t<li><a href=\"main.jsp\">메인</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"active\"><a href=\"diary.jsp\">게시판</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("            ");

                if(userID==null){
            
      out.write("\r\n");
      out.write("\t\t\t<ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("\t\t\t\t<li class=\"dropdown\">\r\n");
      out.write("\t\t\t\t\t<a href=\"#\" class=\"dropdown-toggle\"\r\n");
      out.write("\t\t\t\t\t\tdata-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\"\r\n");
      out.write("\t\t\t\t\t\taria-expanded=\"false\">접속하기<span class=\"caret\"></span></a>\r\n");
      out.write("\t\t\t\t\t<ul class=\"dropdown-menu\">\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"login.jsp\">로그인</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"join.jsp\">회원가입</a></li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("            </ul>\r\n");
      out.write("            ");

                } else{   
            
      out.write("\r\n");
      out.write("            <ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("                    <li class=\"dropdown\">\r\n");
      out.write("                        <a href=\"#\" class=\"dropdown-toggle\"\r\n");
      out.write("                            data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\"\r\n");
      out.write("                            aria-expanded=\"false\">회원관리<span class=\"caret\"></span></a>\r\n");
      out.write("                        <ul class=\"dropdown-menu\">\r\n");
      out.write("                            <li><a href=\"logoutAction.jsp\">로그아웃</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                </ul>\r\n");
      out.write("                ");

            }
                
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("    </nav>\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <table class= \"table table-striped\" style=\"text-align: center; border: 1px solid #dddddd\";>\r\n");
      out.write("                <thead>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th style=\"background-color: #eeeeee; text-align: center;\">번호</th>\r\n");
      out.write("                        <th style=\"background-color: #eeeeee; text-align: center;\">작성자</th>\r\n");
      out.write("                        <th style=\"background-color: #eeeeee; text-align: center;\">나이대</th>\r\n");
      out.write("                        <th style=\"background-color: #eeeeee; text-align: center;\">작성일</th>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </thead>\r\n");
      out.write("                <tbody>\r\n");
      out.write("                ");

                	DiaryDAO diaryDAO = new DiaryDAO();
                	ArrayList<Diary> list = diaryDAO.getList(pageNumber);
                	for(int i=0;i<list.size();i++){
                
      out.write("\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td><a href=\"view.jsp?diaryID=");
      out.print( list.get(i).getDiaryID() );
      out.write('"');
      out.write('>');
      out.print( list.get(i).getDiaryID() );
      out.write("</a></td>\r\n");
      out.write("                        <td>");
      out.print( list.get(i).getUserID() );
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print( list.get(i).getUserAge() );
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print( list.get(i).getDiaryDate().substring(0,11)+list.get(i).getDiaryDate().substring(11,13)+"시"+list.get(i).getDiaryDate().substring(14,16)+"분" );
      out.write("</td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    ");
}
                	
      out.write("\r\n");
      out.write("                </tbody>\r\n");
      out.write("            </table>\r\n");
      out.write("            ");

            	if(pageNumber!=1)
            	{
            
      out.write("\r\n");
      out.write("            \t\t<a href=\"diary.jsp?pageNumber=");
      out.print(pageNumber - 1 );
      out.write("\" class=\"btn btn-success btn-arrow-left\">이전</a>\r\n");
      out.write("            ");

            	}if(diaryDAO.nextPage(pageNumber +1)){
            
      out.write("\r\n");
      out.write("            \t<a href=\"diary.jsp?pageNumber=");
      out.print(pageNumber + 1 );
      out.write("\" class=\"btn btn-success btn-arrow-left\">다음</a>\r\n");
      out.write("            ");

            	}
            
      out.write("\r\n");
      out.write("            ");

            if(canWrite == true)
            {
            
      out.write("\r\n");
      out.write("            \t  <a href=\"write.jsp\" class=\"btn btn-primary pull-right\">글쓰기</a>\r\n");
      out.write("           \t");

            }
            else{
            if(userID!=null)
            {
            	String userAge=null;
            	userAge = (String)session.getAttribute("userAge");
            	ArrayList<Integer> IDlist= null;
            	Random random = new Random();
            	int rannum=0;
            	IDlist = diaryDAO.getRAN(userID, userAge);
            	if(IDlist.size()!=0)
            	{
                	rannum = random.nextInt(IDlist.size());
           	
      out.write("\r\n");
      out.write("             \t<a href=\"view.jsp?diaryID=");
      out.print(IDlist.get(rannum) );
      out.write("\" class=\"btn btn-primary pull-right\">교환</a>\r\n");
      out.write("            ");
}
            }
            }
            
      out.write("\r\n");
      out.write("           \r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("<script src=\"https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js\"></script>\r\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
