<%-- 
    Document   : login-form.jsp
    Created on : 11-Apr-2016, 02:31:59
    Author     : saufi
    --%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <jsp:include page="head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Threadizzy : Login</title>
    </head>
    <body>
      
      <div class="container-fluid bg-login">

         <div class="col-md-12">
            
            <div class="col-md-4 col-md-offset-4 login-form">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Login Account <b>Threadizzy</b></h3>
                    </div>
                    <div class="panel-body">
                        <%
                        if (session.getAttribute("message") != null ) {
                        %>
                        <div class="alert alert-success">
                            Registration Succes
                        </div>

                        <%
                        session.removeAttribute("message"); }
                        %>
                        <form role="form" action="Login" method="post">

                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input required type="email" name="email" class="form-control" >
                            </div>

                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input required type="password" name="password" class="form-control" >
                            </div>


                            <button type="submit" class="btn btn-default">LOGIN</button>
                        </form>
                        <p>Dont have an account yet? Sign Up <a href="<%out.print(session.getAttribute("baseUrl"));%>register">here</a></p>
                    </div>
                </div>
            </div>
        </div>

    </div>  
</body>
</html>
