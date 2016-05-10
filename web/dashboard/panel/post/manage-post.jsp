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
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-12 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Manage Post On Thread "Title Thread"</div>
                    <div class="panel-body">
                       
                            
                            <% 
                                HttpSession sessionUser=request.getSession(false);  
                              User logginUser = (User) request.getSession().getAttribute("userObj");

                                String test = request.getParameter("id");
                                Thread data = new Thread();
                                data.setId(Integer.parseInt(test));

                                data.GetThread();  

                        Post post = new Post();
                        post.setIdUser(logginUser.getId());
                        post.setIdThread(data.getId());
                        post.getUserPost();
                        
                        ArrayList<Integer> postList = post.getArrayId();
                        for(int i = 0; i < postList.size(); i++) {
                            Post pst = new Post();
                            pst.setId(postList.get(i));
                            pst.GetPost();
                            
                            
                            out.println("<div class='col-md-12'><h3>");
                            out.println(pst.getJudul());
                            out.println("</h3><hr><p>Post at");
                            out.println(pst.getDatel());
                            out.println(" </p><p> <a href='");
                            out.println(session.getAttribute("baseUrl"));
                            out.print("dashboard/panel/post/form-edit-post.jsp?post=");
                            out.print(pst.getId());
                            out.println("'class='btn btn-primary'><span class='glyphicon glyphicon-cog' aria-hidden='true'></span> EDIT</a>");
                            out.println("<a class='btn btn-danger'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> DELETE </a></p><hr></div>");
                            
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
