<%-- 
    Document   : my-profile
    Created on : 08-May-2016, 15:14:36
    Author     : seryuzaki-woorld
--%>
<%@page import="model.User"%>
<%
    User loggedUser = (User) request.getSession().getAttribute("userObj");
    User viewedUser = (User) request.getAttribute("viewedUser");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
    </head>
    <body>
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">
                    <div class="panel-heading">My Profile</div>
                    <div class="panel-body">
            
        
           

            <table border="1">
                <tr>
                    <td>Nama</td>
                    <td><%= viewedUser.getNama()%></td>
                </tr>

                <tr>
                    <td>Email</td>
                    <td><%= viewedUser.getEmail()%></td>
                </tr>

                <tr>
                    <td>Image</td>
                    <td><%= viewedUser.getImage()%></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><%= viewedUser.getGender()%></td>
                </tr>
            </table>
            <% if (loggedUser != null && loggedUser.getId() != viewedUser.getId()) {%> 
            <form action ="<%= request.getContextPath() + "/profile/" + viewedUser.getId() + "/follow"%>" method ="post"> 
                <input class="btn btn-default" type="submit" value="submit" >
            </form>
            <% }%>
             <% if (loggedUser != null && loggedUser.getId() == viewedUser.getId()) {%> 
             <a class="btn btn-default" href="<%= request.getContextPath() + "/profile/" + viewedUser.getId() + "/edit"%>">Edit</a>
            <% }%>
            
                    </div>
            </div>
        </div>
        </div>
    </body>
</html>
