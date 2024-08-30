<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
    <meta charset="ISO-8859-1">
    <title>Update employer</title>
    
    
</head>
<body>
    
    <%
    String url = "jdbc:mysql://localhost:3306/emp_22RP14497";
    String user = "root"; 
    String pass = "";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String productCode = request.getParameter("empid");
    String currentName = "";
    String currentQuantity = "";
    double currentPrice = 0.0;

    // Fetch the current product details
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
        String sql = "SELECT Fname, Lname, salary FROM employer WHERE empid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productCode);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            currentName = rs.getString("Fname");
            currentQuantity = rs.getString("Lname");
            currentPrice = rs.getDouble("salary");
        }
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update the product details if the form is submitted
    if (request.getParameter("update") != null) {
        String newName = request.getParameter("name");
        int newname = Integer.parseInt(request.getParameter("name"));
        double newSalary = Double.parseDouble(request.getParameter("salary"));

        try {
            conn = DriverManager.getConnection(url, user, pass);
            String sql = "UPDATE employer SET Fname = ?, Lname = ?, salary = ? WHERE empid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newName);
            pstmt.setString(2, newName);
            pstmt.setDouble(3, newSalary);
            pstmt.setString(4, productCode);
            pstmt.executeUpdate();  
            response.sendRedirect("dashboard.jsp");
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    %>

    <form method="POST">
    <h1>UPDATE employer</h1><hr><br>
        <label for="name">Fname:</label>
        <input type="text" name="name" value="<%= currentName %>" required><br><br>

        <label for="name"> Lname:</label><br><br>
        <input type="text" name="name" value="<%= currentName %>" required><br><br>

        <label for="number"> salary:</label><br>
        <input type="text" name="salary" value="<%= currentPrice %>" required><br><br>

        <input type="hidden" name="empid" value="<%= productCode %>">
        <button name="update">Update</button>
    </form>
</body>
</html>
