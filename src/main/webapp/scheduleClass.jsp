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
        <form action="javascript:void(0);" method="POST">
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

               String query = "SELECT classname FROM classes WHERE teacherid = ?;";

               Connection connection = DriverManager.getConnection(url, user, password);
               String teacherId = (String) session.getAttribute("teacherId");
               PreparedStatement preparedStatement = connection.prepareStatement(query);
               preparedStatement.setString(1, teacherId);
               ResultSet resultSet = preparedStatement.executeQuery();


               while (resultSet.next()) {
               String className = resultSet.getString("classname");
               %>
               <option value="<%= className %>"><%= className %></option>
               <%
               }
               }catch(Exception e){
                           throw new RuntimeException(e);

               }
            %>
            </select>

            <!-- Select Time Slot -->
            <label for="timeSlot">Select Time Slot:</label>
            <select name="timeSlot" id="timeSlot" required>
                <option value="">-- Select Time --</option>
                <option value="09:00 AM">09:00 AM</option>
                <option value="10:00 AM">10:00 AM</option>
                <option value="11:00 AM">11:00 AM</option>
                <option value="12:00 PM">12:00 PM</option>
                <option value="01:00 PM">01:00 PM</option>
                <option value="02:00 PM">02:00 PM</option>
                <option value="03:00 PM">03:00 PM</option>
                <option value="04:00 PM">04:00 PM</option>
                <option value="05:00 PM">05:00 PM</option>
            </select>

            <!-- Submit Button -->
            <button type="submit" id="scheduleButton">Schedule Class</button>
        </form>

        <!--<div id="confirmationMessage" class="hidden">-->
           <!-- <p>Your class has been scheduled successfully!</p>-->
       <!-- </div>-->
    </div>
</body>
</html>
