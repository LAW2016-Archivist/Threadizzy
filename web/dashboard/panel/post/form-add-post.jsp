<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
--%>

<%@page import="model.User"%>
<%@page import="model.Thread"%>
<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Post</title>
    </head>

    <body class="">
        <%
            HttpSession sessionUser=request.getSession(false);  
            User logginUser = (User) request.getSession().getAttribute("userObj");
            
            if(!request.getParameterMap().containsKey("id")) {
                String site = session.getAttribute("baseUrl") + "dashboard/panel/manage-thread.jsp";
                response.sendRedirect(response.encodeRedirectURL(site));
                return;
            }
            
            Thread thread = new Thread();
            thread.setId(Integer.parseInt(request.getParameter("id")));
            thread.getThread();  

            if(logginUser.getId() != thread.getIdUser()) {
                String site = session.getAttribute("baseUrl") + "dashboard/panel/manage-thread.jsp";
                response.sendRedirect(response.encodeRedirectURL(site));
                return;
            }
        %>
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-12 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Add Post On Thread "<%=thread.getJudul() %>"</div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <script src="http://cdn.tinymce.com/4/tinymce.min.js"></script>
                            <script>tinymce.init({selector: 'textarea', plugins : 'advlist autolink link media image lists charmap'});</script>
                            <form role="form" action="<% out.print(session.getAttribute("baseUrl")); %>PostController" method="post">
                                <input type="text" name="id_user" value="<%=logginUser.getId() %>" hidden/>
                                <input type="text" name="id_thread" value="<%=request.getParameter("id")%>" hidden />
                                
                                <p>JUDUL :</p>
                                <input type="text" name="judul" class="form-control" required/>
                                <br>
                                <p>ISI :</p>
                                <textarea name="isi" required>
                             
                                </textarea>
                                
                              
                                 <br>
                                 <button type="submit" class="btn btn-primary form-control">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
