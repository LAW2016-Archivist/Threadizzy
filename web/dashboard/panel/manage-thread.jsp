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
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-12 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Manage Thread</div>
                    <div class="panel-body"> 


                        <%
                            Thread thread = new Thread();
                            HttpSession sessionUser = request.getSession(false);
                            User logginUser = (User) request.getSession().getAttribute("userObj");

                            thread.setIdUser(logginUser.getId());
                            thread.getUserThread();
                            ArrayList<Integer> id_thread = thread.getArrayId();
                            for (int i = 0; i < id_thread.size(); i++) {
                                Thread data = new Thread();
                                data.setId(id_thread.get(i));

                                data.getThread();

                                Post post = new Post();
                                post.setIdThread(data.getId());
                                post.setIdUser(logginUser.getId());
                                post.getUserPost();

                                out.println(" <div class='col-md-12'><div class='col-md-5'> <h3>");
                                out.println(data.getJudul());
                                out.println("</h3> <p>Created at ");
                                out.println(data.getDatel());
                                out.println("</p></div><div class='col-md-3'><p>");
                                out.println("");
                                out.println("xx Comment</p><p>xx Likers</p><p>");
                                out.println(post.getArrayId().size());
                                out.println(" Post</p><p class='btn btn-warning'>");
                                Category category = new Category();
                                category.setId(data.getIdCategory());
                                category.getCategory();
                                out.print(category.getNama());
                                out.println("</p></div>");
                                out.println("<div class='col-md-4' style='margin-top: 4%'>");

                                out.println("<a href='");
                                out.println(session.getAttribute("baseUrl"));
                                out.println("dashboard/panel/post/form-add-post.jsp?id=");
                                out.print(data.getId());
                                out.println("' class='btn btn-info'><span class='glyphicon glyphicon-plus' aria-hidden='true'></span> ADD POST</a>");

                                out.println("<a href='");
                                out.println(session.getAttribute("baseUrl"));
                                out.println("dashboard/panel/post/manage-post.jsp?id=");
                                out.println(data.getId());
                                out.println("' class='btn btn-info'><span class='glyphicon glyphicon-erase' aria-hidden='true'></span> MANAGE POST</a><br><br>");

                                out.println("<a href='");
                                out.println(session.getAttribute("baseUrl"));
                                out.println("dashboard/panel/form-edit-thread.jsp' class='btn btn-primary'><span class='glyphicon glyphicon-cog' aria-hidden='true'></span> EDIT</a>");

                                out.println("<a href='");
                                out.println(session.getAttribute("baseUrl"));
                                out.println("dashboard/thread/view-thread.jsp?id=");
                                out.print(data.getId());
                                out.println("' class='btn btn-success'><span class='glyphicon glyphicon-new-window' aria-hidden='true'></span> VIEW</a>");
                                out.println("<a class='btn btn-danger'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> DELETE </a>");
                                out.println("</div> <div class='col-md-12'> <hr></div></div>");

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

    </div>

</body>
</html>
