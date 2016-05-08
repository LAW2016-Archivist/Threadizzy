<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<% session.getAttribute("baseUrl");%>">Threadizzy</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/form-add-thread.jsp"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Make Thread</a></li>
                <li><a href="<%= session.getAttribute("baseUrl")+ "dashboard/category?action=list" %>"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Make Category Thread</a></li>
                <li ><a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/panel/manage-thread.jsp" ><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Manage Your Thread</a></li>
                <li ><a href="<%out.print(session.getAttribute("baseUrl"));%>dashboard/thread/view-public-thread.jsp" ><span class="glyphicon glyphicon-list" aria-hidden="true"></span> Public Thread</a></li>
            </ul>



        </div>
    </div>
</nav>
