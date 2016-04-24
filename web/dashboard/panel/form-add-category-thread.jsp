<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
--%>

<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make Category Thread</title>
    </head>

    <body class="">
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-6 col-md-offset-3 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Make Category Thread</div>
                    <div class="panel-body">
                        <div class="col-md-12">
                          
                            <form>
                                <p>CATEGORY NAME :</p>
                                <input type="text" name="judul" class="form-control" />
                                <br>

                                <input type="sumbit" class="btn btn-primary form-control" value="Create"/>
                            </form>
                        </div>
                        <div>
                            <table class=" table table-responsive table-striped">
                                <thead>
                                    <tr>
                                        <th>Category Name</th>
                                        <th>Action</th>
                                        
                                    </tr>
                                </thead>
                              
                                <tbody>
                                    <tr>
                                        <td>Hobi</td>
                                        <td><a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a> <a class="btn btn-info"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></a></td>
                                       
                                    </tr>
                                    <tr>
                                        <td>My Daily Life</td>
                                        <td><a class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a> <a class="btn btn-info"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></a></td>
                                        
                                    </tr>
                                </tbody> 
                            </table>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
