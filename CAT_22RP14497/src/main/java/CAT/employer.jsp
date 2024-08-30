<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<h1>EMPLOYEE MANAGEMENT SYSTEM</h1><br>
   <form method="POST">
   	<h2>Insert a Product</h2>
		  <hr>
	<input type="text" name="name" placeholder="Enter  Fname Here"><br><br>
	<input type="text" name="quantity" placeholder="Enter  Lname Here"><br><br>
	<input type="text" name="price" placeholder="Enter  salary Here"><br><br>
   	<button  name="submit">Send</button>
   </form>
   </div>
    <%
            if (request.getParameter("submit") != null) {
                String name = request.getParameter("name");
                String quantity = request.getParameter("quantity");
                String price = request.getParameter("price");
                
                String url = "jdbc:mysql://localhost:3306/emp_22RP14497";
                String user = "root"; 
                String pass = "";

                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    conn = DriverManager.getConnection(url, user, pass);
                    
                   
                    String sql = "INSERT INTO product (Fname,Lname,salary) VALUES (?,?,?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, name);
                    pstmt.setString(2, quantity);
                    pstmt.setString(3, price);
                   
                    pstmt.executeUpdate();

                    out.println("<h3>New product Recorded Successful!</h3>");
                    out.println("<p>Name: " + name + "</p>");
                    response.sendRedirect("dashboard.jsp");
                } catch (Exception e) {
                    out.println("<h3>Error: " + e.getMessage() + "</h3>");
                } finally {
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            }
        %>
        
</body>
</html>