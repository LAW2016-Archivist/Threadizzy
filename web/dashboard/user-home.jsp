<%@page import="model.Status"%>
<%@page import="model.Thread"%>
<%@page import="java.util.ArrayList"%>
<html>
    <head>
        <jsp:include page="/head.jsp" />
        <%@page import="model.User"%>
        
        <%
            //if not login redirect to login page
            if (session.getAttribute("user") == null) {
                String site = session.getAttribute("baseUrl") + "login-form.jsp";
                response.sendRedirect(response.encodeRedirectURL(site));
            }
            
            HttpSession sessionUser=request.getSession(false);  
            User logginUser = (User) request.getSession().getAttribute("userObj");
            ArrayList<Status> followedStatus = (ArrayList<Status>) request.getAttribute("followedStatus");
            ArrayList<User> followed = (ArrayList<User>) request.getAttribute("followed");
            ArrayList<Thread> followedThread = (ArrayList<Thread>) request.getAttribute("followedThread");
            
            
            
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DASHBOARD THREADIZZY</title>
    </head>

    <body class="">
        <jsp:include page="/navbar.jsp" />
        <div class="container">

            <div class="col-md-12 home-user-1" >
                <div class="col-md-2">
                    <div class=" col-md-12">
                        <center>
                            <p>
                                <% if(logginUser.getImage().equalsIgnoreCase("")){
                                out.print("   <img  height=\"120\" width=\"120\" class=\"img-circle\" src=\"https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg\"/>");
                                
                                }else{
                                    
                                out.print("   <img  height=\"120\" width=\"120\" class=\"img-circle\" src=\""+session.getAttribute("baseUrl")+"img/avatar/"+
                                        logginUser.getImage()
                                        +"\"/>");
                                
                                    
                                } %>
                             
                            </p>
                        </center>
                    </div>
                    <div class="col-md-12" style="margin-top: 5%">
                        <center><a><%out.print(logginUser.getNama());%></a></center>
                    </div>
                    <div class="col-md-12" style="margin-top: 5%">

                        <div class="list-group">
                            <a href="<%= request.getContextPath() +"/profile/"+ logginUser.getId() %>" class="list-group-item">
                                My Profile 
                            </a>
                            <a href="<% out.print(session.getAttribute("baseUrl")); %>dashboard/user/edit-profile.jsp" class="list-group-item">
                                Update Profile
                            </a>
                            <a href="<% out.print(session.getAttribute("baseUrl"));%>LogoutController" class="list-group-item">
                                Logout
                            </a>
                        </div>
                    </div>


                </div>
                <div class="col-md-6">

                    <div class="col-md-12 ">
                        <form class=" form-horizontal" role="form" action="<%= request.getContextPath()+"/status/store" %>" method="post">
                            <fieldset>
                                <legend>What Do you Think ? </legend>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input name="idUser" value = "<%out.print(logginUser.getId());%>" hidden>
                                        <textarea  name="status" class="form-control" maxlength="250" placeholder="Write here ..." onKeyUp="hitungkarakter(status, sisa, 250);"></textarea>
                                        <input style="background: #060606;border: 0; color: #cc0000" readonly disabled type="text" name="sisa" value="250" size="3"/>
                                        <button type="submit" class="btn btn-primary navbar-right" style="margin-top: 2%;margin-right: 2%;">Make Status</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                        <script>
                            function hitungkarakter(field, sisa, maksimal) {
                                /*menambahkan atribute maxlength pada field sesuai jumlah maksimal*/
                                field.maxLength = maksimal;
                                /*menghitung sisa karakter, maksimal dikurangi panjang karakter pada field */
                                sisa.value = maksimal - field.value.length;
                            }
                            /*            parameter hitung karakter :
                             - field adalah name dari input yang diisi
                             - sisa adalah name dari input sisa karakter
                             - maksimal adalah jumlah karakter maksimal yg bisa diinput, sesuaikan dengan
                             atribute value pada input dengan name sisa
                             */
                        </script>
                    </div>
                    <div class="col-md-12">
                        <h3>Status People Who you Follow</h3>
                        <hr>
                    </div>
                    <div class="col-md-12">
                        
                    <% for (Status s : followedStatus) { %>
                        <div class="panel panel-default">
                            <a href ="<%= request.getContextPath()+"/profile/"+s.getIdUser() %>">
                            <div class="panel-heading">
                                <img  height="30" width="30" class="img-circle" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"/> 
                                <%= s.getNamaUser() %>
                                <div class="navbar-right" style="margin-right: 3%">
                                    <p><%= s.getDatel().toString() %></p>
                                </div>
                            </div>
                            </a>
                            <div class="panel-body">
                                <p><%= s.getIsi() %></p>   
                            </div>
                        </div>
                    <% } %>
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
                <div class="col-md-4">
                    <div class="list-group">
                        <p>Recently Thread People Who you Follow</p>
                        <hr >
                        <% for (Thread t : followedThread) { %>
                        <a href="#" class="list-group-item">
                            <h4 class="list-group-item-heading"><%= t.getJudul() %></h4>
                            <p class="list-group-item-text">by: <%= t.getNamaUser() %> at <%= t.getDatel().toString() %></p>
                        </a>
                        <% } %>
                        <br>
                        <center>
                            <a class="btn btn-primary">VIEW ALL THREAD</a>
                        </center>

                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">PEOPLE YOU FOLLOW</h3>
                        </div>
                        <div class="panel-body">
                            <div class="list-group">
                                <% for (User u : followed) { %>
                                <a href="<%= request.getContextPath()+"/profile/"+u.getId() %>" class="list-group-item">
                                    <h4 class="list-group-item-heading">
                                        <img  height="30" width="30" class="img-circle" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"/> 
                                        <%= u.getNama() %>
                                    </h4>
                                </a>
                                <% } %>
                                <br>
                                <center>
                                    <a class="btn btn-primary">VIEW ALL</a>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </body>
</html>
