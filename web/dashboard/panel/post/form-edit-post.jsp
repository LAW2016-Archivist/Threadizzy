<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
--%>

<%@page import="model.Post"%>
<%@page import="model.User"%>
<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Post</title>
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
            
            if(!request.getParameterMap().containsKey("post")) {
                String site = session.getAttribute("baseUrl") + "dashboard/user-home.jsp";
                response.sendRedirect(response.encodeRedirectURL(site));
                return;
            }
            
            
            Post post = new Post();
            post.setId(Integer.parseInt(request.getParameter("post")));
            post.getPost();
            if(post.getIdUser()!= logginUser.getId()) {
                session.setAttribute("postSuccess", "You can't edit another user's Post");
                String site = session.getAttribute("baseUrl") + "dashboard/user-home.jsp";
                response.sendRedirect(response.encodeRedirectURL(site));
            }
            
          
        %>
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-12 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Edit post "<%=post.getJudul() %>"</div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <script src="http://cdn.tinymce.com/4/tinymce.min.js"></script>
                            <script>tinymce.init({selector: 'textarea', plugins : 'advlist autolink link media image lists charmap'});</script>
                            <form role="form" action="<% out.print(session.getAttribute("baseUrl")); %>PostController?action=edit" method="post">
                                <input type="text" name="id" value="<%=post.getId() %>" hidden>
                                
                                <p>JUDUL :</p>
                                <input type="text" name="judul" class="form-control" value="<%=post.getJudul() %>"/>
                                <br>
                                <p>ISI :</p>
                                <textarea name="isi" required >
                                <%=post.getIsi()%>
                                </textarea>
                               
                              
                                 <br>
                                <input type="submit" class="btn btn-primary form-control" />
                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
