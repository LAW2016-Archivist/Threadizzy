<%-- 
    Document   : index
    Created on : 10-Apr-2016, 23:07:23
    Author     : saufi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <jsp:include page="head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Threadizzy : Welcome Express Your Mind with Thread </title>
    </head>
    <body class="container-fluid">
        <div class="container">

            <div class="col-md-12">

                <div class="col-md-10 col-md-offset-1 home" >
                    <h1>Welcome To Threadizzy Connect People with Your Thread</h1>

                    <p><a class="btn btn-primary btn-lg" href="register/" role="button">SIGN UP</a></p>
                    <p>Have an account? login <a href="<%out.print(session.getAttribute("baseUrl"));%>login-form.jsp">here</a></p>
                </div>
            </div>

        </div>

    </body>
</html>
