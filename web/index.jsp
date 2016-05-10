<%-- 
    Document   : index
    Created on : 10-Apr-2016, 23:07:23
    Author     : saufi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Thread"%>

<html>
    <head>
        <jsp:include page="head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Threadizzy : Welcome Express Your Mind with Thread </title>
    </head>
    <body class="container-fluid bg-home">
        <div class="container">
            <div class="col-md-5">
                <div class="panel panel-default home-user-1">
                    <div class="panel-heading"><h4>Popular Public Thread Today</h4></div>
                    <div class="panel-body">
                        <div class="list-group">
                            
                            <% 

                                String test = request.getParameter("id");
                                Thread data = new Thread();
                                data.getPublicThread();

                                ArrayList<Integer> publicThread = data.getArrayId();
                                
                        for(int i = 0; i < publicThread.size(); i++) {
                            Thread thd = new Thread();
                            thd.setId(publicThread.get(i));
                            thd.getThread();
                            
                            
                            out.println("<a href='#' class='list-group-item'><h4 class='list-group-item-heading'>");
                            out.println(thd.getJudul());
                            out.println("<p class='list-group-item-text'>xx Likes ");
                            out.println(thd.getDatel());
                            out.println("</p></a>");
                        }
                            %>  
                            
                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-7 home-user-1">

                <div class="col-md-12  home" >
                    <h3>Welcome To Threadizzy Connect People with Your Thread</h3>

                    <p><a class="btn btn-primary btn-lg" href="register/" role="button">SIGN UP</a></p>
                    <p style="color: #fff">Have an account? login <a href="<%out.print(session.getAttribute("baseUrl"));%>login-form.jsp">here</a></p>
                </div>
            </div>

        </div>

    </body>
</html>
