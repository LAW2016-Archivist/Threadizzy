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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Profil</h1>
        <% if (loggedUser != null && loggedUser.getId() == viewedUser.getId() ) { %> 
            <a href="<%= request.getContextPath()+"/profile/"+viewedUser.getId()+"/edit" %>">Edit</a>
        <% } %>
        <table border="1">
            <tr>
                <td>Nama</td>
                <td><%= viewedUser.getNama() %></td>
            </tr>
            
            <tr>
                <td>Email</td>
                <td><%= viewedUser.getEmail() %></td>
            </tr>
            
            <tr>
                <td>Foto</td>
                <td><%= viewedUser.getImage()%></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><%= viewedUser.getGender()%></td>
            </tr>
        </table>
        <% if (loggedUser != null && loggedUser.getId() != viewedUser.getId() ) { %> 
        <a href ="<%= request.getContextPath()+"/profile/"+viewedUser.getId()+"/follow" %>">Follow</a>
        <% } %>
    </body>
</html>
