<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
--%>

<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category Thread</title>
    </head>

    <body class="">
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-6 col-md-offset-3 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Edit Category Thread</div>
                    <div class="panel-body">
                        <div class="col-md-12">
                          
                            <form>
                                <p>CATEGORY NAME :</p>
                                <input type="text" name="judul" class="form-control" />
                                <br>

                                <input type="sumbit" class="btn btn-primary form-control" value="Update"/>
                            </form>
                        </div>
                       
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
