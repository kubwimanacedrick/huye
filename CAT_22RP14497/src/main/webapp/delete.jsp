<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Delete employer</title>
    <body>
    <%
    String url="jdbc:mysql://localhost:3306/emp_22rp14497";
    String user="root";
    String pass="";
    connection conn=null;
    preparStatementParameter("empid");
    String message="";
    if(empid !null){
    	try{
    		class.forname("com.msql.cj.jdbc.Driver");
    		conn=Drivermanager.getconnectiom
    	}
    }
    %>
        
        
</body>
</html>
