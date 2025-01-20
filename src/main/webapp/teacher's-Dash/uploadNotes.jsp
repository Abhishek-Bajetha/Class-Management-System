<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Notes</title>
    <link rel="stylesheet" href="<%=application.getContextPath() %>/css/uploadNotes.css">
</head>
<body>
    <div class="container">
        <h2>Upload Notes</h2>
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
            </select> -->

            <!-- Title of Notes -->
            <label for="noteTitle">Title of the Notes:</label>
            <input type="text" name="noteTitle" id="noteTitle" placeholder="Enter title of the notes" required>

            <!-- Description of Notes -->
            <label for="noteDescription">Description:</label>
            <textarea name="noteDescription" id="noteDescription" placeholder="Enter description" rows="4" required></textarea>

            <!-- File Upload -->
            <label for="noteFile">Upload Notes (PDF/Docx):</label>
            <input type="file" name="noteFile" id="noteFile" accept=".pdf, .docx" required>

            <!-- Submit Button -->
            <button type="submit" id="uploadButton">Upload Notes</button>
        </form>

        <div id="confirmationMessage" class="hidden">
            <p>Your notes have been successfully uploaded!</p>
        </div>
    </div>

    <script>
        document.getElementById("uploadButton").addEventListener("click", function(e) {
            e.preventDefault(); // Prevent form submission
            const classStandard = document.getElementById("classStandard").value;
            const subject = document.getElementById("subject").value;
            const noteTitle = document.getElementById("noteTitle").value;
            const noteDescription = document.getElementById("noteDescription").value;

            if (classStandard && subject && noteTitle && noteDescription) {
                document.getElementById("confirmationMessage").classList.remove("hidden");
                document.getElementById("confirmationMessage").innerHTML = `<p>Notes for class ${classStandard} (${subject}) have been uploaded successfully.</p>`;
            } else {
                alert("Please fill all fields.");
            }
        });
    </script>
</body>
</html>
