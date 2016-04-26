<%-- 
Document   : view-other-user-profile.jsp
Created on : 24-Apr-2016, 14:17:48
Author     : seryuzaki-woorld
--%>

<html>
<head>
    <jsp:include page="/head.jsp" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage Thread</title>
</head>

<body class="">
    <jsp:include page="/navbar.jsp" />
    <div class="container">
        <br><br><br><br><br>
        <div class="col-md-12 " >
            <div class="panel panel-default">
                <div class="panel-heading">Manage Thread</div>
                <div class="panel-body">
                    <div class="col-md-12">
                        <div class="col-md-5">
                            <h3>Title Thread</h3>
                            <p>Created at xx:xx PM/AM On xx-xx-xx</p>
                        </div>
                        <div class="col-md-3">
                            <p>xx Comment</p>
                            <p>xx Likers</p>
                            <p>xx Post</p>
                            <p class="btn btn-warning">Hobi</p>
                        </div>
                        <div class="col-md-4" style="margin-top: 4%">
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/form-add-post.jsp" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> ADD POST</a>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/manage-post.jsp" class="btn btn-info"><span class="glyphicon glyphicon-erase" aria-hidden="true"></span> MANAGE POST</a><br>
                            <br>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/form-edit-thread.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> EDIT</a>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/thread/view-thread.jsp" class="btn btn-success"><span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> VIEW</a>
                            <a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> DELETE </a>
                        </div>
                        <div class="col-md-12">
                            <hr>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="col-md-5">
                            <h3>Title Thread</h3>
                            <p>Created at xx:xx PM/AM On xx-xx-xx</p>
                        </div>
                        <div class="col-md-3">
                            <p>xx Comment</p>
                            <p>xx Likers</p>
                            <p>xx Post</p>
                            <p class="btn btn-warning">Hobi</p>
                        </div>
                        <div class="col-md-4" style="margin-top: 4%">
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/form-add-post.jsp" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> ADD POST</a>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/manage-post.jsp" class="btn btn-info"><span class="glyphicon glyphicon-erase" aria-hidden="true"></span> MANAGE POST</a><br>
                            <br>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/form-edit-thread.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> EDIT</a>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/thread/view-thread.jsp" class="btn btn-success"><span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> VIEW</a>
                            <a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> DELETE </a>
                        </div>
                        <div class="col-md-12">
                            <hr>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <div class="col-md-5">
                            <h3>Title Thread</h3>
                            <p>Created at xx:xx PM/AM On xx-xx-xx</p>
                        </div>
                        <div class="col-md-3">
                            <p>xx Comment</p>
                            <p>xx Likers</p>
                            <p>xx Post</p>
                            <p class="btn btn-warning">Hobi</p>
                        </div>
                        <div class="col-md-4" style="margin-top: 4%">
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/form-add-post.jsp" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> ADD POST</a>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/manage-post.jsp" class="btn btn-info"><span class="glyphicon glyphicon-erase" aria-hidden="true"></span> MANAGE POST</a><br>
                            <br>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/form-edit-thread.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> EDIT</a>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/thread/view-thread.jsp" class="btn btn-success"><span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> VIEW</a>
                            <a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> DELETE </a>
                        </div>
                        <div class="col-md-12">
                            <hr>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <div class="col-md-5">
                            <h3>Title Thread</h3>
                            <p>Created at xx:xx PM/AM On xx-xx-xx</p>
                        </div>
                        <div class="col-md-3">
                            <p>xx Comment</p>
                            <p>xx Likers</p>
                            <p>xx Post</p>
                            <p class="btn btn-warning">Hobi</p>
                        </div>
                        <div class="col-md-4" style="margin-top: 4%">
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/form-add-post.jsp" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> ADD POST</a>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/manage-post.jsp" class="btn btn-info"><span class="glyphicon glyphicon-erase" aria-hidden="true"></span> MANAGE POST</a><br>
                            <br>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/form-edit-thread.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> EDIT</a>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/thread/view-thread.jsp" class="btn btn-success"><span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> VIEW</a>
                            <a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> DELETE </a>
                        </div>
                        <div class="col-md-12">
                            <hr>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <div class="col-md-5">
                            <h3>Title Thread</h3>
                            <p>Created at xx:xx PM/AM On xx-xx-xx</p>
                        </div>
                        <div class="col-md-3">
                            <p>xx Comment</p>
                            <p>xx Likers</p>
                            <p>xx Post</p>
                            <p class="btn btn-warning">Hobi</p>
                        </div>
                        <div class="col-md-4" style="margin-top: 4%">
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/form-add-post.jsp" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> ADD POST</a>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/manage-post.jsp" class="btn btn-info"><span class="glyphicon glyphicon-erase" aria-hidden="true"></span> MANAGE POST</a><br>
                            <br>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/form-edit-thread.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> EDIT</a>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/thread/view-thread.jsp" class="btn btn-success"><span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> VIEW</a>
                            <a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> DELETE </a>
                        </div>
                        <div class="col-md-12">
                            <hr>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="col-md-5">
                            <h3>Title Thread</h3>
                            <p>Created at xx:xx PM/AM On xx-xx-xx</p>
                        </div>
                        <div class="col-md-3">
                            <p>xx Comment</p>
                            <p>xx Likers</p>
                            <p>xx Post</p>
                            <p class="btn btn-warning">Hobi</p>
                        </div>
                        <div class="col-md-4" style="margin-top: 4%">
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/form-add-post.jsp" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> ADD POST</a>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/post/manage-post.jsp" class="btn btn-info"><span class="glyphicon glyphicon-erase" aria-hidden="true"></span> MANAGE POST</a><br>
                            <br>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/form-edit-thread.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> EDIT</a>
                            <a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/thread/view-thread.jsp" class="btn btn-success"><span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> VIEW</a>
                            <a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> DELETE </a>
                        </div>
                        <div class="col-md-12">
                            <hr>
                        </div>
                    </div>
                    
                    
                        <!--------------------------------------------------------------------------------------------------------------------------------------------------->
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

    </div>

</body>
</html>
