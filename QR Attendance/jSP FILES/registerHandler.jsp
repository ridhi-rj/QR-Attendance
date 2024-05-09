<%@ page import="java.sql.*, java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    // Establish database connection
    String url = "jdbc:mysql://localhost:3306/StudentAttendanceSystem"; // Database URL
    String username = "root"; // Database username
    String password = "Ridhi@5695"; // Database password
    String driver = "com.mysql.jdbc.Driver"; // MySQL JDBC driver

    Connection conn = null;
    PreparedStatement pstmt = null;
    String query = "INSERT INTO Users (fullname, username, password_hash) VALUES (?, ?, ?)";

    try {
        // Load the MySQL JDBC driver
        Class.forName(driver);
        // Establish connection to the database
        conn = DriverManager.getConnection(url, username, password);

        // Retrieve parameters from the request
        String fullname = request.getParameter("fullname");
        String usernameParam = request.getParameter("username");
        String passwordParam = request.getParameter("password");
        String hashedPassword = ""; // You should hash the password before storing it in the database

        // Prepare the SQL statement
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, fullname);
        pstmt.setString(2, usernameParam);
        pstmt.setString(3, hashedPassword); // Store the hashed password in the database

        // Execute the query
        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            out.println("Registration successful!");
            // Redirect to login page or any other page
            // response.sendRedirect("login.jsp");
            // return;
        } else {
            out.println("Registration failed. Please try again.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { /* ignored */ }
        if (conn != null) try { conn.close(); } catch (SQLException e) { /* ignored */ }
    }
%>
