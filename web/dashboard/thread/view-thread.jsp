<%@page import="java.util.ArrayList"%>
<%@page import="model.Post"%>
<%@page import="model.Category"%>
<%@page import="model.User"%>
<%@page import="model.Thread"%>
<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Threadizzy: TItle Thread</title>
    </head>

    <body class="">
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            
            <div class="col-md-12 home-user-1 box-user-thread" >
                <%
             if (session.getAttribute("postSuccess") != null){
                out.print("<div class=\"alert alert-success\">");
                out.print(session.getAttribute("postSuccess"));
                out.print("</div>"); 
                session.removeAttribute("postSuccess");
                }
             %>
                <div class="col-md-12 thread-head">
                    <div class="col-md-3">
                        
                        <center>
                            <p>
                                <img  height="120" width="120" class="img-circle" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"/>
                            </p>
                            <p>by 
                            <% 
                                  if (session.getAttribute("user") == null) {
                                    String site = session.getAttribute("baseUrl") + "login-form.jsp";
                                    response.sendRedirect(response.encodeRedirectURL(site));
                                  }
            
                                HttpSession sessionUser=request.getSession(false);  

                                User logginUser = (User) request.getSession().getAttribute("userObj");
                                out.print(logginUser.getNama());
                                String test = request.getParameter("id");
                                Thread data = new Thread();
                                data.setId(Integer.parseInt(test));

                                data.getThread();  
                                if(data.getJudul().equals("")) {
                                    String site = session.getAttribute("baseUrl") + "dashboard/panel/manage-thread.jsp";
                                    session.setAttribute("threadSuccess", "That is a private thread and it's not yours");
                                    response.sendRedirect(response.encodeRedirectURL(site));
                                }
                                if(data.getIdUser() != logginUser.getId() && data.getStatus() == 2) {
                                    String site = session.getAttribute("baseUrl") + "dashboard/panel/manage-thread.jsp";
                                    session.setAttribute("threadSuccess", "That is a private thread and it's not yours");
                                    response.sendRedirect(response.encodeRedirectURL(site));
                                }
                            %>    
                                </p>
                            <p>category 
                            <% 
                                
                                Category category = new Category();
                                category.setId(data.getIdCategory());
                                category.getCategory();
                                out.print(category.getNama());
                            %>
                            </p>

                        </center>
                    </div>
                            
                    
                    <div class="col-md-9">
                        <h1><% out.print(data.getJudul()); %></h1>
                        <div class="col-md-12" style="text-align: right">
                            <a class="btn btn-info">Like</a>
                            <a class="btn btn-default">xx Likers</a>
                        </div>  
                    </div>


                    <div class="col-md-12">
                        <hr>
                    </div>
                </div>
               
                <%
                        Post post = new Post();
                        post.setIdUser(logginUser.getId());
                        post.setIdThread(data.getId());
                        post.getUserPost();
                        
                        ArrayList<Integer> postList = post.getArrayId();
                        if(postList.isEmpty()) {
                            
                            out.print("<div class='col-md-12'>");
                            out.print("<div class=\"alert alert-success\">");
                            out.print("This thread is empty!");
                            out.print("</div>");
                            out.print("</div>");
                        }
                        for(int i = 0; i < postList.size(); i++) {
                            Post pst = new Post();
                            pst.setId(postList.get(i));
                            pst.getPost();
                %>
                            <div class='col-md-12'>
                                <h3><%=pst.getJudul()%></h3>
                            
                                
                                <hr>
                                <p>Post at<%=pst.getDatel()%></p>
                                <hr>
                                <div class='content'>
                                    <%=pst.getIsi()%>
                                </div>
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

    </body>
</html>
