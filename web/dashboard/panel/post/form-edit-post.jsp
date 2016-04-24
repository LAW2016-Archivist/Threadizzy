<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
--%>

<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Post</title>
    </head>

    <body class="">
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-12 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Edit Post On Thread "Title Thread"</div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <script src="http://cdn.tinymce.com/4/tinymce.min.js"></script>
                            <script>tinymce.init({selector: 'textarea', plugins : 'advlist autolink link media image lists charmap'});</script>
                            <form>
                                <p>JUDUL :</p>
                                <input type="text" name="judul" class="form-control" value="judul1"/>
                                <br>
                                <p>CATEGORY :</p>
                                <textarea name="isi">Isi nya lorem"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</textarea>
                               
                              
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
