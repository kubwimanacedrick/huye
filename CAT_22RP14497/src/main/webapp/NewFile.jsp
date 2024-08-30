<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>

<%
    // Simulating a database with a list
    List<String> products = (List<String>) application.getAttribute("products");
    if (products == null) {
        products = new ArrayList<>();
        application.setAttribute("products", products);
    }

    // Handle form submission
    String product = request.getParameter("product");
    if (product != null && !product.isEmpty()) {
        products.add(product);
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
        input[type="text"] {
            padding: 10px;
            width: 300px;
            margin-right: 10px;
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
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            background: #ffffff;
            margin: 5px 0;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<h1>Eco-Friendly Product Management System</h1>

<form action="" method="post">
    <input type="text" name="product" placeholder="Enter eco-friendly product name" required>
    <input type="submit" value="Add Product">
</form>

<h2>Product List</h2>
<ul>
    <%
    terator<String> iterator = products.iterator();
    while (iterator.hasNext()) {
    	 ecoProduct = iterator.next();
    	 <String>;
    %>
        <li><%= ecoProduct %></li>
    <%
        }
    %>
</ul>

</body>
</html>