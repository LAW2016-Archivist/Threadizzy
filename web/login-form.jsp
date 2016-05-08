<%-- 
    Document   : login-form.jsp
    Created on : 11-Apr-2016, 02:31:59
    Author     : saufi
    --%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="model.User"%>
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
                <%
                    //message from RegisterController
                if (session.getAttribute("messageSuccess") != null){
                out.print("<div class=\"alert alert-success\">");
                out.print(session.getAttribute("messageSuccess"));
                out.print("</div>"); 
                session.removeAttribute("messageSuccess");
                }
                //message from LoginController
                if (session.getAttribute("loginFailed") != null){
                out.print("<div class=\"alert alert-danger\">");
                out.print(session.getAttribute("loginFailed"));
                out.print("</div>"); 
                session.removeAttribute("loginFailed");
                }
                %>
                
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Login Account <b>Threadizzy</b></h3>
                    </div>
                    <div class="panel-body">
                     
                          
                        <jsp:useBean id="user" scope="request" class="model.User"></jsp:useBean>
                        
                        <form role="form" action="LoginController" method="post">

                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input required type="email" name="email" class="form-control" value="<jsp:getProperty name="user" property="email"/>">
                            </div>

                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input required type="password" name="password" class="form-control" value="<jsp:getProperty name="user" property="password"/>">
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
