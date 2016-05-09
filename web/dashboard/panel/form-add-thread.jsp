<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="model.User"%>
<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make Thread</title>
    </head>

    <body class="">
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-6 col-md-offset-3 home-user-1" >
                <div class="panel panel-default">
                    <div class="panel-heading">Make Thread</div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <script src="http://cdn.tinymce.com/4/tinymce.min.js"></script>
                            <script>tinymce.init({selector: 'textarea'});</script>
                            <form role="form" action="<% out.print(session.getAttribute("baseUrl")); %>ThreadController" method="post">
                                <p>JUDUL :</p>
                                <input type="text" name="judul" class="form-control" />
                                <br> 
                                <input type="text" name="id_user" value=                             
                                <%
                                HttpSession sessionUser=request.getSession(false);  
                               User logginUser = (User) request.getSession().getAttribute("userObj");
                                out.print("'"+logginUser.getId()+"'");
                                %>
                                 hidden/>
                                <p>CATEGORY :</p>
                                <select name="id_category" class="form-control">
                                    <% 
                                        Category category = new Category();
                                        category.GetAllCategory();
                                        ArrayList<String> namaCategory = category.getArrayNama();
                                        ArrayList<Integer> idCategory = category.getArrayId();
                                        for(int i = 0; i < namaCategory.size(); i++) {
                                            out.print("<option value='");
                                            out.print(idCategory.get(i));
                                            out.print("'>");
                                            out.print(namaCategory.get(i));
                                            out.print("</option>");
                                        }
                                    %>


                                </select>
                                <br>
                                <p>STATUS :</p>
                                <select name="status" class="form-control">
                                    <option value="1">Public</option>
                                    <option value ="2">Not Public</option>
                                </select>
                                 <br>
                                 <button type="submit" class="btn btn-primary form-control" >Submit </button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
