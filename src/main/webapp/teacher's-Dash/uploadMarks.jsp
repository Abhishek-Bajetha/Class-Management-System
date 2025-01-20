<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Marks for Multiple Students</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/css/uploadMarks.css">
</head>
<body>
     <div class="container">
        <h2>Upload Marks for Students (Bulk Upload)</h2>
        
        <form action="javascript:void(0);" method="POST">
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
            
            <!-- Select Button to Load Students -->
            <button type="button" id="selectButton">Select</button>
            
            <!-- Table for Student List and Marks (Initially Hidden) -->
            <div id="studentTableContainer" class="hidden">
                <table id="studentTable" class="student-table">
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Student Name</th>
                            <th>Marks (Out of 100)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Dynamically populated with student data after select button is clicked -->
                    </tbody>
                </table>

                <!-- Submit Button -->
                <button type="submit" id="uploadMarksButton">Upload Marks</button>
            </div>
        </form>

        <div id="confirmationMessage" class="hidden">
            <p>Marks for the students have been successfully uploaded!</p>
        </div>
    </div>

    <script>
        // Function to simulate fetching student data based on class selection
        document.getElementById("selectButton").addEventListener("click", function() {
            const classStandard = document.getElementById("classStandard").value;
            
            if (classStandard) {
                // Simulate fetching student data (in a real app, this data would be fetched from the server)
                const studentData = [
                    { id: "S101", name: "John Doe" },
                    { id: "S102", name: "Jane Smith" },
                    { id: "S103", name: "Sam Wilson" },
                    { id: "S104", name: "Anna Lee" }
                ];
                
                // Clear any existing rows in the table
                const tableBody = document.getElementById("studentTable").getElementsByTagName("tbody")[0];
                tableBody.innerHTML = "";

                // Populate the table with student data
                studentData.forEach(student => {
                    const row = tableBody.insertRow();
                    const cell1 = row.insertCell(0);
                    const cell2 = row.insertCell(1);
                    const cell3 = row.insertCell(2);
                    
                    cell1.innerHTML = `<input type="text" name="studentID[]" value="${student.id}" readonly>`;
                    cell2.innerHTML = `<input type="text" name="studentName[]" value="${student.name}" readonly>`;
                    cell3.innerHTML = `<input type="number" name="marks[]" placeholder="Enter marks" required min="0" max="100">`;
                });

                // Show the student table and hide the select section
                document.getElementById("studentTableContainer").classList.remove("hidden");
            } else {
                alert("Please select a class first.");
            }
        });

        // Function to handle form submission and confirmation
        document.getElementById("uploadMarksButton").addEventListener("click", function(e) {
            e.preventDefault(); // Prevent form submission
            const studentIDs = document.querySelectorAll('input[name="studentID[]"]');
            const studentNames = document.querySelectorAll('input[name="studentName[]"]');
            const marks = document.querySelectorAll('input[name="marks[]"]');
            
            let isValid = true;
            studentIDs.forEach((id, index) => {
                if (!id.value || !studentNames[index].value || !marks[index].value) {
                    isValid = false;
                }
            });
            
            if (isValid) {
                document.getElementById("confirmationMessage").classList.remove("hidden");
                document.getElementById("confirmationMessage").innerHTML = `<p>Marks have been uploaded successfully for ${studentIDs.length} students.</p>`;
            } else {
                alert("Please fill in all fields for each student.");
            }
        });
    </script>
</body>
</html>
