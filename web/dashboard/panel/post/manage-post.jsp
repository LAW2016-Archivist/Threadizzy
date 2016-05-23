<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
    --%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Post"%>
<%@page import="model.Category"%>
<%@page import="model.User"%>
<%@page import="model.Thread"%>
    <html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Post</title>
    </head>

    <body class="">
         <%
            if (session.getAttribute("user") == null) {
            String site = session.getAttribute("baseUrl") + "login-form.jsp";
            response.sendRedirect(response.encodeRedirectURL(site));
            }
            //message from RegisterController
            HttpSession sessionUser=request.getSession(false);  
            User logginUser = (User) request.getSession().getAttribute("userObj");

            if(!request.getParameterMap().containsKey("data")) {
                String site = session.getAttribute("baseUrl") + "dashboard/panel/manage-thread.jsp";
                response.sendRedirect(response.encodeRedirectURL(site));
                return;
            }
            Post post = new Post();
            String test = request.getParameter("data");
            
            Thread data = new Thread();
            data.setId(Integer.parseInt(test));
            data.getThread();  
            
            post.setIdUser(logginUser.getId());
            post.setIdThread(data.getId());
            post.getUserPost();
            ArrayList<Integer> postList = post.getArrayId();
            
            
        %>
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-12 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Manage Post On Thread "<%=data.getJudul() %>"</div>
                     <%
   
                        if(postList.isEmpty()){
                            out.print("<div class=\"alert alert-success\">");
                            out.print("You don't have a Post in this thread or this is not your thread");
                            out.print("</div>"); 
                        }
                      %>
                    <div class="panel-body">
                       
                            
                            <% 
                                
                        
                        
                        for(int i = 0; i < postList.size(); i++) {
                            Post pst = new Post();
                            pst.setId(postList.get(i));
                            pst.getPost();
                            
                            %>
                            <div class='col-md-12'>
                                <h3><%=pst.getJudul()%> </h3>
                                <hr>
                                <p>Post at <%=pst.getDatel()%> </p>
                                <p> 
                                    <a href='<%=session.getAttribute("baseUrl")%>dashboard/panel/post/form-edit-post.jsp?post=<%=pst.getId()%>' 
                                       class='btn btn-primary'>
                                       <span class='glyphicon glyphicon-cog' aria-hidden='true'> </span> 
                                       EDIT
                                    </a>
                                       
                                    <a href="<%=session.getAttribute("baseUrl")%>PostController?action=delete&id=<%=pst.getId()%>" class='btn btn-danger'>
                                        <span class='glyphicon glyphicon-remove' aria-hidden='true'></span> 
                                        DELETE 
                                    </a>
                                </p>
                                <hr>
                            </div>
                            <%
                        }
                            %>    
                       
                        <center>
                            <ul class="pagination pagination-sm">
                                <li class="disabled"><a href="#">&laquo;</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&raquo;</a></li>
                            </ul>
                        </center>
                    </div>
                </div>

            </div>

        </div>

    </body>
    </html>
