<%

    session = request.getSession(true);
    session.setAttribute("baseUrl", "http://localhost:8080/Threadizzy/");
    
%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="<%out.print(session.getAttribute("baseUrl"));%>assets/bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" href="<%out.print(session.getAttribute("baseUrl"));%>assets/css/css.css" >
<!-- Optional theme -->
<link rel="stylesheet" href="##" 
<!-- Latest compiled and minified JavaScript -->
<script src="<%out.print(session.getAttribute("baseUrl"));%>assets/bootstrap/js/bootstrap.min.js" ></script>