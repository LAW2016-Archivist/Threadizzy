<div class="container-fluid register-bg">

    <div class="col-md-12">
        <div class="col-md-4 col-md-offset-4 register-form">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Register Account</h3>
                </div>
                <div class="panel-body">
                    <%
                    if( session.getAttribute("errormessage") != null){
                        %>
                     <div class="alert alert-danger">
                         Email has already taken
                     </div>
                    <%
                    }
                    %>
                    <form role="form" action="signup" method="post">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input required type="text" name="name" class="form-control" >
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input required type="email" name="email" class="form-control" >
                        </div>
                        
                        <div class="form-group">
                            <label for="Gender">Gender:</label>
                            <select required="" class="form-control" name="gender">
                                <option>Male</option>
                                <option>Female</option>
                                
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="date">Birth Date:</label>
                            <input required type="date" name="date" class="form-control" >
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input required type="password" name="password" class="form-control" >
                        </div>
                     

                        <button type="submit" class="btn btn-default">REGISTER</button>
                    </form>
                    <p>Have an account? login <a href="<%out.print(session.getAttribute("baseUrl"));%>login-form.jsp">here</a></p>
                </div>
            </div>
        </div>
    </div>

</div>