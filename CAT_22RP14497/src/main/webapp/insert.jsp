<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/your_database"; // Update with your DB URL
    String dbUser = "your_username"; // Update with your DB username
    String dbPass = "your_password"; // Update with your DB password

    Connection conn = null;
    PreparedStatement pstmt = null;

    // Handle form submission
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String stockLevelStr = request.getParameter("stockLevel");

        try {
            // Convert price and stock level to appropriate data types
            double price = Double.parseDouble(priceStr);
            int stockLevel = Integer.parseInt(stockLevelStr);

            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Insert product into the database
            String sql = "INSERT INTO products (name, description, price, stockLevel) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, description);
            pstmt.setDouble(3, price);
            pstmt.setInt(4, stockLevel);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Friendly Product Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #00796b;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"], input[type="number"], textarea {
            padding: 10px;
            width: 300px;
            margin-right: 10px;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<h1>Eco-Friendly Product Management System</h1>

<form action="" method="post">
    <input type="text" name="name" placeholder="Product Name" required>
    <textarea name="description" placeholder="Description" required></textarea>
    <input type="number" name="price" placeholder="Price" step="0.01" required>
    <input type="number" name="stockLevel" placeholder="Stock Level" required>
    <input type="submit" value="Add Product">
</form>

</body>
</html>
