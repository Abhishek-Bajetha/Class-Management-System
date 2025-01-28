<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Schedule Tomorrow's Class</title>
        <link
          rel="stylesheet"
          href="<%=application.getContextPath() %>/css/scheduleClass.css"
        />
</head>
<body>
    <div class="container">
        <h2>Schedule Tomorrow's Class</h2>
        <form action="NextClass" method="POST">
            <!-- Select Class Standard -->
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
               String classCode = resultSet.getString("classcode");
               %>
               <option value="<%= classCode %>"><%= className %></option>
               <%
               }
               }catch(Exception e){
                           throw new RuntimeException(e);

               }
            %>
            </select>

            <!-- Select Time Slot -->
           <div class="date-time-container">
               <label for="eventDateTime">Select Date:</label>
               <input type="date" id="eventDateTime" name="eventDate">

               <label for="eventTime">Select Time:</label>
               <input type="time" id="eventDateTime" name="eventTime">
           </div>


            <!-- Submit Button -->
            <button type="submit" id="scheduleButton">Schedule Class</button>
        </form>

        <!--<div id="confirmationMessage" class="hidden">-->
           <!-- <p>Your class has been scheduled successfully!</p>-->
       <!-- </div>-->
    </div>
</body>
</html>
