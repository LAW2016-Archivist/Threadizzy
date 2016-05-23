<%-- 
Document   : view-other-user-profile.jsp
Created on : 24-Apr-2016, 14:17:48
Author     : seryuzaki-woorld
--%>
<%@page import="model.Post"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Thread"%>
<%@page import="model.User"%>
<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Thread</title>
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
            
            Thread thread = new Thread();
            thread.setIdUser(logginUser.getId());
            thread.getUserThread();
            ArrayList<Integer> id_thread = thread.getArrayId();
            
          
        %>
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-12 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Manage Thread</div>
                    <%
                        if (session.getAttribute("threadSuccess") != null){
                        out.print("<div class=\"alert alert-success\">");
                        out.print(session.getAttribute("threadSuccess"));
                        out.print("</div>"); 
                        session.removeAttribute("threadSuccess");
                        }
                        
                        if(id_thread.isEmpty()){
                            out.print("<div class=\"alert alert-success\">");
                            out.print("You don't have a Thread. Make one first");
                            out.print("</div>"); 
                        }
                      %>
                    <div class="panel-body"> 


                        <%
                            
                            for (int i = 0; i < id_thread.size(); i++) {
                                Thread data = new Thread();
                                data.setId(id_thread.get(i));

                                data.getThread();

                                Post post = new Post();
                                post.setIdThread(data.getId());
                                post.setIdUser(logginUser.getId());
                                post.getUserPost();
                                
                                Category category = new Category();
                                category.setId(data.getIdCategory());
                                category.getCategory();
                        %>
                            <div class='col-md-12'>
                                <div class='col-md-5'> 
                                    <h3><%= data.getJudul()%> </h3> 
                                    <p>Created at <%=data.getDatel()%> </p>
                                </div>
                                <div class='col-md-3'>
                                    <p>xx Comment</p>
                                    <p>xx Likers</p>
                                    <p><%=post.getArrayId().size()%> Post</p>
                                    <p class='btn btn-warning'><%=category.getNama()%></p>
                                </div>
                                <div class='col-md-4' style='margin-top: 4%'>
                                    <a href='<%=session.getAttribute("baseUrl")%>dashboard/panel/post/form-add-post.jsp?id=<%=data.getId()%>' class='btn btn-info'>
                                        <span class='glyphicon glyphicon-plus' aria-hidden='true'>
                                        </span> 
                                        ADD POST
                                    </a>

                                <a href='<%=session.getAttribute("baseUrl")%>dashboard/panel/post/manage-post.jsp?data=<%=data.getId()%>' class='btn btn-info'>
                                    <span class='glyphicon glyphicon-erase' aria-hidden='true'>
                                    </span> 
                                    MANAGE POST</a> <br><br>

                                <a href='<%=session.getAttribute("baseUrl")%>dashboard/panel/form-edit-thread.jsp?id=<%=data.getId()%>' class='btn btn-primary'>
                                    <span class='glyphicon glyphicon-cog' aria-hidden='true'></span> 
                                    EDIT </a>

                                <a href='<%=session.getAttribute("baseUrl")%>dashboard/thread/view-thread.jsp?id=<%=data.getId()%>' class='btn btn-success'>
                                    <span class='glyphicon glyphicon-new-window' aria-hidden='true'></span> 
                                    VIEW</a> 
                                <a href="<%=session.getAttribute("baseUrl")%>ThreadController?action=delete&id=<%=data.getId()%>" class='btn btn-danger'>
                                        <span class='glyphicon glyphicon-remove' aria-hidden='true'></span> 
                                        DELETE 
                                </a>

                                </div> <div class='col-md-12'> <hr></div></div>
                        <% 
                            }
                        %>




                        <!--------------------------------------------------------------------------------------------------------------------------------------------------->
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
