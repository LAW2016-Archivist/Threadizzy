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
        <%
            if (session.getAttribute("user") == null) {
            String site = session.getAttribute("baseUrl") + "login-form.jsp";
            response.sendRedirect(response.encodeRedirectURL(site));
            }
            //message from RegisterController
            HttpSession sessionUser=request.getSession(false);  
            User logginUser = (User) request.getSession().getAttribute("userObj");
            
            Category category = new Category();
            category.getAllCategory();
            ArrayList<String> namaCategory = category.getArrayNama();
            ArrayList<Integer> idCategory = category.getArrayId();
            ArrayList<Integer> userCategory = category.getArrayUser();
            boolean exist = false;
          
        %>
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
                                <input type="text" name="id_user" value="<%=+logginUser.getId()%>" hidden/>
                                <p>CATEGORY :</p>
                                <select name="id_category" class="form-control">
                                    <%  
                                        for(int i = 0; i < namaCategory.size(); i++) {
                                            if(userCategory.get(i)==logginUser.getId() ) {
                                                exist = true;
                                    %>
                                                <option value='<%=idCategory.get(i)%>'>
                                                    <%=namaCategory.get(i)%>
                                                </option>
                                                
                                    <%
                                            }
                                        }
                                        if(!exist) {
                                            String site = session.getAttribute("baseUrl") + "dashboard/panel/form-add-category-thread.jsp";
                                            session.setAttribute("categorySuccess", "Create a Category first");
                                            response.sendRedirect(response.encodeRedirectURL(site));
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
