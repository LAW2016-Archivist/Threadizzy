<%-- 
    Document   : index
    Created on : 11-Apr-2016, 01:36:50
    Author     : saufi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/head.jsp" />
        <title>Threadizzy : Register</title>
    </head>
    <body>


        <div class="container-fluid bg-register">

            <div class="col-md-12">
                <div class="col-md-4 col-md-offset-4 register-form">
                    <%
                        if (session.getAttribute("messageEmail") != null) {
                            out.print("<div class=\"alert alert-danger\">");
                            out.print(session.getAttribute("messageEmail"));
                            out.print("</div>");
                            session.removeAttribute("messageEmail");
                        }
                    %>
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Register Account <b>Threadizzy</b></h3>
                        </div>
                        <div class="panel-body">

                            <form role="form" action="<% out.print(session.getAttribute("baseUrl")); %>RegisterController" method="post">
                                <jsp:useBean id="user" scope="request" class="model.User"></jsp:useBean>
                                    <div class="form-group">
                                        <label for="name">Name:</label>
                                        <input required type="text" name="name" class="form-control" value="<jsp:getProperty name="user" property="name"/>">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input required type="email" name="email" class="form-control" value="<jsp:getProperty name="user" property="email"/>">
                                </div>

                                <div class="form-group">
                                    <label for="Gender">Gender:</label>
                                    <select required="" class="form-control" name="gender" value="<jsp:getProperty name="user" property="gender"/>">
                                        <option>Male</option>

                                        <option>Female</option>

                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="pwd">Password:</label>
                                    <input required type="password" name="password" class="form-control" value="<jsp:getProperty name="user" property="password"/>">
                                </div>


                                <button type="submit" class="btn btn-default">REGISTER</button>
                            </form>
                            <p>Have an account? login <a href="<%out.print(session.getAttribute("baseUrl"));%>login-form.jsp">here</a></p>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </body>
</html>
