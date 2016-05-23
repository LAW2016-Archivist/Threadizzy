<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
--%>
<%@page import="model.User"%>
<%

    User loggedUser = (User) request.getSession().getAttribute("userObj");
    User viewedUser = (User) request.getAttribute("viewedUser");

%>

<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile - <%= viewedUser.getNama() %></title>
    </head>

    <body class="">
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-6 col-md-offset-3 home-user-1" >
                <div class="panel panel-default">
                    <div class="panel-heading"><%= viewedUser.getNama() %></div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <div class="col-md-5">
                                <center>

                                    <p>
                                        <img  height="120" width="120" class="img-circle" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"/>
                                    </p>

                                </center>
                            </div>
                            <div class="col-md-7">
                                <p>
                                    <a class="btn btn-default">FOLLOWED</a>
                                </p>
                                <form action="<%= request.getContextPath()+"/profile/"+viewedUser.getId()+"/unfollow" %>" method="post">
                                    <input type="submit" value="Unfollow">
                                </form>
                                <br>
                                <div class="well">
<!--                                    <p>All Status : xx</p>
                                    <p>All Thread : xx </p>
                                    <p>view-other-user-profile-followed.jsp</p>-->
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
