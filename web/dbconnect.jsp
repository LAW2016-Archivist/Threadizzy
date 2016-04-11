<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    String userName = "root";
    String password = "root";
    String url = "jdbc:mysql://localhost/phonebook";
    Connection connection = DriverManager.getConnection(url, userName, password);
    Statement statement = connection.createStatement();
%>