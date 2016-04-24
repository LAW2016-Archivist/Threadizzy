<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
--%>

<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Thread</title>
    </head>

    <body class="">
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-6 col-md-offset-3 home-user-1" >
                <div class="panel panel-default">
                    <div class="panel-heading">Edit Thread</div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <script src="http://cdn.tinymce.com/4/tinymce.min.js"></script>
                            <script>tinymce.init({selector: 'textarea'});</script>
                            <form>
                                <p>JUDUL :</p>
                                <input type="text" name="judul" class="form-control" />
                                <br>
                                <p>CATEGORY :</p>
                                <select name="category" class="form-control">
                                    <option>Hobi</option>
                                    <option>My Daily Life</option>

                                </select>
                                <br>
                                <p>STATUS :</p>
                                <select name="category" class="form-control">
                                    <option>Public</option>
                                    <option>Not Public</option>
                                </select>
                                 <br>
                                <input type="sumbit" class="btn btn-primary form-control" value="UPDATE"/>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
