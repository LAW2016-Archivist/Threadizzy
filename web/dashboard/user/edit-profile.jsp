<%-- 
    Document   : edit-profile
    Created on : 08-May-2016, 15:15:00
    Author     : seryuzaki-woorld
--%>
<%@page import="model.User"%>
<%
    User loggedUser = (User) request.getSession().getAttribute("userObj");
    User editedUser = (User) request.getAttribute("editedUser");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-6 col-md-offset-3 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Edit Profile</div>
                    <div class="panel-body">

                        <form action="<%= request.getContextPath() + "/profile/" + editedUser.getId() + "/edit"%>" method="post">
                                 <div class="form-group">
                                        <label for="name">Name:</label>
                                        <input required type="text" name="nama" class="form-control" value="<%= editedUser.getNama() %>">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input required type="email" name="email" class="form-control" value="<%= editedUser.getEmail() %>">
                                </div>

                                <div class="form-group">
                                    <label for="Gender">Gender:</label>
                                    <select required="" class="form-control" name="gender" >
                                        <option>Male</option>

                                        <option>Female</option>

                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="pwd">Password:</label>
                                    <input required type="password" name="password" class="form-control" value="<%= editedUser.getPassword() %>">
                                </div>

                            
                            <input type="sumbit" class="btn btn-primary form-control" value="SAVE"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
