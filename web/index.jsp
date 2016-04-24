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
    <body class="container-fluid bg-home">
        <div class="container">
            <div class="col-md-5">
                <div class="panel panel-default home-user-1">
                    <div class="panel-heading"><h4>Popular Public Thread Today</h4></div>
                    <div class="panel-body">
                        <div class="list-group">
                            <a href="#" class="list-group-item">
                                <h4 class="list-group-item-heading">Title Thread</h4>
                                <p class="list-group-item-text">xx Likes xx:xx PM/AM On xx-xx-xx</p>
                            </a>
                               <a href="#" class="list-group-item">
                                <h4 class="list-group-item-heading">Title Thread</h4>
                                <p class="list-group-item-text">xx Likes xx:xx PM/AM On xx-xx-xx</p>
                            </a>
                               <a href="#" class="list-group-item">
                                <h4 class="list-group-item-heading">Title Thread</h4>
                                <p class="list-group-item-text">xx Likes xx:xx PM/AM On xx-xx-xx</p>
                            </a>
                               <a href="#" class="list-group-item">
                                <h4 class="list-group-item-heading">Title Thread</h4>
                                <p class="list-group-item-text">xx Likes xx:xx PM/AM On xx-xx-xx</p>
                            </a>
                               <a href="#" class="list-group-item">
                                <h4 class="list-group-item-heading">Title Thread</h4>
                                <p class="list-group-item-text">xx Likes xx:xx PM/AM On xx-xx-xx</p>
                            </a>
                               <a href="#" class="list-group-item">
                                <h4 class="list-group-item-heading">Title Thread</h4>
                                <p class="list-group-item-text">xx Likes xx:xx PM/AM On xx-xx-xx</p>
                            </a>
                               <a href="#" class="list-group-item">
                                <h4 class="list-group-item-heading">Title Thread</h4>
                                <p class="list-group-item-text">xx Likes xx:xx PM/AM On xx-xx-xx</p>
                            </a>
                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-7 home-user-1">

                <div class="col-md-12  home" >
                    <h3>Welcome To Threadizzy Connect People with Your Thread</h3>

                    <p><a class="btn btn-primary btn-lg" href="register/" role="button">SIGN UP</a></p>
                    <p style="color: #fff">Have an account? login <a href="<%out.print(session.getAttribute("baseUrl"));%>login-form.jsp">here</a></p>
                </div>
            </div>

        </div>

    </body>
</html>
