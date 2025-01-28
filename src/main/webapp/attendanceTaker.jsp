
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Taker</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/css/attendanceTaker.css">
</head>
<body>
    <div class="container">
        <h2>Mark Attendance</h2>

        <!-- Class Selection -->
        <div class="class-selection">
         <form action="retrieveStud" method ="post">
            <label for="classSelect">Select Class:</label>
            <select id="classSelect" name ="classCode" required>
                <option value="">-- Select Class --</option>
               <%@ page import="java.sql.*" %>
                <%
                      try{
                         Class.forName("com.mysql.cj.jdbc.Driver");

                         String url = "jdbc:mysql://localhost:3306/classmanagementsystem";
                         String username = "root";
                         String password = "Abhi73022@";

                         String query = "SELECT * FROM classes WHERE teacherid = ?;";
                         String teacherId = (String) session.getAttribute("teacherId");
                         Connection connection = DriverManager.getConnection(url, username, password);
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
            <button id="selectButton">Select</button>
          </form>
        </div>
    </div>
</body>
</html>
