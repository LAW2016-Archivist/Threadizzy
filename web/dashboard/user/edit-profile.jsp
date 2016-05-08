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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit User</h1>
        <form action="<%= request.getContextPath()+"/profile/"+editedUser.getId()+"/edit" %>" method="post">
            TODO: bikin tabel edit
        </form>
    </body>
</html>
