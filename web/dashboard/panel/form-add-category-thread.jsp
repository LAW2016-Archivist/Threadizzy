<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
--%>

<%@page import="model.User"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Category"%>
<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make Category Thread</title>
    </head>

    <body class="">
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-6 col-md-offset-3 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Make Category Thread</div>
                    <div class="panel-body">
                         <%
                    //message from RegisterController
                if (session.getAttribute("categorySuccess") != null){
                out.print("<div class=\"alert alert-success\">");
                out.print(session.getAttribute("categorySuccess"));
                out.print("</div>"); 
                session.removeAttribute("categorySuccess");
                }
                %>
                        <div class="col-md-12">
                          <%
                                HttpSession sessionUser=request.getSession(false);  
                                User logginUser = (User) request.getSession().getAttribute("userObj");
                                
                                %>
                            <form role="form" action="<% out.print(session.getAttribute("baseUrl")); %>CategoryController" method="post">
                                <p>CATEGORY NAME :</p>
                                <input type="text" name="nama" class="form-control" />
                                <input type="hidden" name="idUser" value="<%= logginUser.getId() %>" />
                                <br>

                                <button type="submit" class="btn btn-primary form-control">Submit</button>
                            </form>
                        </div>
                        <div>
                            <table class=" table table-responsive table-striped">
                                <thead>
                                    <tr>
                                        <th>Category Name</th>
                                        <th>Action</th>
                                        
                                    </tr>
                                </thead>
                              
                                <tbody>
                                    
                                    <% 
                                        Category category = new Category();
                                        category.GetAllCategory();
                                        ArrayList<String> namaCategory = category.getArrayNama();
                                        ArrayList<Integer> idCategory = category.getArrayId();
                                        int i =0;
                                        Iterator it = namaCategory.listIterator();
                                        while (it.hasNext()) {  %>
                                            <tr>
                                            <td>
                                                <%= it.next() %>
                                                <%= idCategory.get(i) %>
                                            </td>
                                            <td>
                                            <form role="form" action="<% out.print(session.getAttribute("baseUrl")); %>CategoryController?action=delete&id=<%= idCategory.get(i++)%>" method="post">
                                            <a class='btn btn-danger' >
                                                
         
                                                <input type="submit">
                                                <span class='glyphicon glyphicon-remove' aria-hidden='true'>
                                                    
                                                </span>
                                                </input>
                                            </a> 
                                            </form>
                                            <a class='btn btn-info'>
                                                <span class='glyphicon glyphicon-cog' aria-hidden='true'>
                                                    
                                                </span>
                                            </a>
                                            </td>
                                            </tr>
                                        <% }
                                    %>
                                    
                                </tbody> 
                            </table>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
