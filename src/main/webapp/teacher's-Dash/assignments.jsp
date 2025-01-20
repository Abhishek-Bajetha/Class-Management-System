<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Give Assignment</title>
    <!-- Dynamically linking the CSS file based on JSP file name -->
    <link rel="stylesheet" href="<%= application.getContextPath() %>/css/assignments.css">
</head>
<body>
    <div class="container">
        <h2>Assign Assignment to Students</h2>
        <form action="javascript:void(0);" method="POST" enctype="multipart/form-data">
            <!-- Select Class Standard -->
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

            <!-- Select Subject -->
            <!-- <label for="subject">Select Subject:</label>
            <select name="subject" id="subject" required>
                <option value="">-- Select Subject --</option>
                <option value="Maths">Maths</option>
                <option value="Science">Science</option>
                <option value="English">English</option>
                <option value="History">History</option>
                <option value="Geography">Geography</option>
                <option value="Physical Education">Physical Education</option>
            </select>
 -->
            <!-- Title of Assignment -->
            <label for="assignmentTitle">Title of the Assignment:</label>
            <input type="text" name="assignmentTitle" id="assignmentTitle" placeholder="Enter title of the assignment" required>

            <!-- Description of Assignment -->
            <label for="assignmentDescription">Description:</label>
            <textarea name="assignmentDescription" id="assignmentDescription" placeholder="Enter description" rows="4" required></textarea>

            <!-- Upload Assignment File -->
            <label for="assignmentFile">Upload Assignment (PDF/Docx):</label>
            <input type="file" name="assignmentFile" id="assignmentFile" accept=".pdf, .docx" required>

            <!-- Due Date -->
            <label for="dueDate">Due Date:</label>
            <input type="date" name="dueDate" id="dueDate" required>

            <!-- Submit Button -->
            <button type="submit" id="assignButton">Assign Assignment</button>
        </form>

        <div id="confirmationMessage" class="hidden">
            <p>Your assignment has been successfully assigned!</p>
        </div>
    </div>

    <script>
        document.getElementById("assignButton").addEventListener("click", function(e) {
            e.preventDefault(); // Prevent form submission
            const classStandard = document.getElementById("classStandard").value;
            const subject = document.getElementById("subject").value;
            const assignmentTitle = document.getElementById("assignmentTitle").value;
            const assignmentDescription = document.getElementById("assignmentDescription").value;
            const dueDate = document.getElementById("dueDate").value;

            if (classStandard && subject && assignmentTitle && assignmentDescription && dueDate) {
                document.getElementById("confirmationMessage").classList.remove("hidden");
                document.getElementById("confirmationMessage").innerHTML = `<p>Assignment for class ${classStandard} (${subject}) has been assigned successfully. Due Date: ${dueDate}</p>`;
            } else {
                alert("Please fill all fields.");
            }
        });
    </script>
</body>
</html>
