<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
--%>

<%@page import="model.Category"%>
<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category Thread</title>
    </head>

    <body class="">
        <%
            if (session.getAttribute("user") == null) {
            String site = session.getAttribute("baseUrl") + "login-form.jsp";
            response.sendRedirect(response.encodeRedirectURL(site));
            }
            //message from RegisterController
            int id = Integer.parseInt(request.getParameter("id"));
            Category category = new Category();
            category.setId(id);
            category.getCategory();  
            
        %>
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-6 col-md-offset-3 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Edit Category Thread</div>
                    <div class="panel-body">
                        <div class="col-md-12">
                          
                            <form role="form" action="<% out.print(session.getAttribute("baseUrl")); %>CategoryController?action=edit" method="post">
                                <p>CATEGORY NAME :</p>
                                <input type="text" name="idd" hidden value="<%=id%>"/>
                                <input type="text" name="nama" class="form-control" value="<%=category.getNama()%>" />
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
