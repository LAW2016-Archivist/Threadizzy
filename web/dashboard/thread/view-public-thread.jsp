<%-- 
    Document   : view-other-user-profile.jsp
    Created on : 24-Apr-2016, 14:17:48
    Author     : seryuzaki-woorld
--%>
<%@page import="model.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Thread"%>
<html>
    <head>
        <jsp:include page="/head.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Public Thread </title>
    </head>

    <body class="">
        <jsp:include page="/navbar.jsp" />
        <div class="container">
            <br><br><br><br><br>
            <div class="col-md-12 " >
                <div class="panel panel-default">
                    <div class="panel-heading">Public Thread</div>
                    <div class="panel-body">
                        
                        <% 

                                String test = request.getParameter("id");
                                Thread data = new Thread();
                                data.getPublicThread();

                                ArrayList<Integer> publicThread = data.getArrayId();
                                
                               
                                
                        for(int i = 0; i < publicThread.size(); i++) {
                            Thread thd = new Thread();
                            thd.setId(publicThread.get(i));
                            thd.getThread();
                            
                            Post post = new Post();
                            post.setIdThread(thd.getId());
                            post.getPublicPost();
                            
                            %>
                           <div class='col-md-12'>
                               <div class='col-md-5'>
                                   <h2><a href="<%=session.getAttribute("baseUrl")%>dashboard/thread/view-thread.jsp?id=<%=thd.getId() %>"><%=thd.getJudul()%></a></h2>
                                   <p>Post at <%=thd.getDatel()%></p>
                                   <p>xx Comment xx Likers <%=post.getArrayId().size() %> Post</p> 
                               </div>
                           </div>
                               
                            <%
                        }
                            %>  
                        
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


</body>
</html>
