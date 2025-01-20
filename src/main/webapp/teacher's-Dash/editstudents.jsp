
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                <option value="6th">6th</option>
                <option value="7th">7th</option>
                <option value="8th">8th</option>
                <option value="9th">9th</option>
                <option value="10th">10th</option>
                <option value="11th">11th</option>
                <option value="12th">12th</option>
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
