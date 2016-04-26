<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
    --%>

    <html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Post</title>
    </head>

    <body class="">
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-12 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Manage Post On Thread "Title Thread"</div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <h3>Title Post</h3> 
                            <p>xx:xx PM/AM On xx-xx-xx </p>
                            <p>                 
                                <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/form-edit-post.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> EDIT</a>
                                <a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> DELETE </a>
                            </p>
                            <hr>
                        </div>
                        <div class="col-md-12">
                            <h3>Title Post</h3> 
                            <p>xx:xx PM/AM On xx-xx-xx </p>
                            <p>                 
                                <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/form-edit-post.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> EDIT</a>
                                <a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> DELETE </a>
                            </p>
                            <hr>
                        </div>
                        <div class="col-md-12">
                            <h3>Title Post</h3> 
                            <p>xx:xx PM/AM On xx-xx-xx </p>
                            <p>                 
                                <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/form-edit-post.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> EDIT</a>
                                <a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> DELETE </a>
                            </p>
                            <hr>
                        </div>
                        <div class="col-md-12">
                            <h3>Title Post</h3> 
                            <p>xx:xx PM/AM On xx-xx-xx </p>
                            <p>                 
                                <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/form-edit-post.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> EDIT</a>
                                <a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> DELETE </a>
                            </p>
                            <hr>
                        </div>
                        <div class="col-md-12">
                            <h3>Title Post</h3> 
                            <p>xx:xx PM/AM On xx-xx-xx </p>
                            <p>                 
                                <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/form-edit-post.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> EDIT</a>
                                <a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> DELETE </a>
                            </p>
                            <hr>
                        </div>
                        <center>
                            <ul class="pagination pagination-sm">
                                <li class="disabled"><a href="#">&laquo;</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&raquo;</a></li>
                            </ul>
                        </center>
                    </div>
                </div>

            </div>

        </div>

    </body>
    </html>
