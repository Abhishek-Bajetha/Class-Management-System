<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
    <link
    rel="stylesheet"
    href="<%=application.getContextPath() %>/css/editstudents.css"
  />
</head>
<body>
    <div class="container">
        <h2>Add Student</h2>
        <form action="AddStudentServlet" method="POST">
            <!-- Teacher selects the class for the student -->
             <label for="classStandard">Select Class Standard:</label>
            <select name="classStandard" id="classStandard" required>
                <option value="">-- Select Class --</option>
                <%
                            try{
                               Class.forName("com.mysql.cj.jdbc.Driver");

                               String url = "jdbc:mysql://localhost:3306/classmanagementsystem";
                               String user = "root";
                               String password = "Abhi73022@";

                               String query = "SELECT * FROM classes WHERE teacherid = ?;";

                               Connection connection = DriverManager.getConnection(url, user, password);
                               String teacherId = (String) session.getAttribute("teacherId");
                               PreparedStatement preparedStatement = connection.prepareStatement(query);
                               preparedStatement.setString(1, teacherId);
                               ResultSet resultSet = preparedStatement.executeQuery();

                               while (resultSet.next()) {
                               String className = resultSet.getString("classname");
                               String classcode = resultSet.getString("classcode");
                               %>
                               <option value="<%= classcode %>"><%= className %></option>
                               <%
                               }
                               }catch(Exception e){
                                           throw new RuntimeException(e);
                               }
                            %>
            </select>

            <!-- Teacher enters the student's email -->
            <label for="studentEmail">Student Email:</label>
            <input type="email" name="studentEmail" id="studentEmail" placeholder="Enter student's email" required>

            <!-- Teacher enters the student's name (optional if system generates it later) -->
            <label for="studentName">Student Name (Optional):</label>
            <input type="text" name="studentName" id="studentName" placeholder="Enter student's name">

            <!-- Submit button -->
            <button type="submit">Add Student</button>
        </form>
    </div>
</body>
</html>
