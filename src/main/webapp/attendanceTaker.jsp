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
            <label for="classSelect">Select Class:</label>
            <select id="classSelect" required>
                <option value="">-- Select Class --</option>
                <option value="6th">6th</option>
                <option value="7th">7th</option>
                <option value="8th">8th</option>
                <option value="9th">9th</option>
                <option value="10th">10th</option>
                <option value="11th">11th</option>
                <option value="12th">12th</option>
            </select>
            <button id="selectButton">Select</button>
        </div>

        <!-- Student List (Initially Hidden) -->
        <div id="studentListContainer" class="hidden">
            <table id="studentTable">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Attendance</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Student rows will be dynamically added here -->
                </tbody>
            </table>
            <button id="submitAttendanceButton">Submit Attendance</button>
        </div>

        <!-- Confirmation Message -->
        <div id="confirmationMessage" class="hidden">
            <p>Attendance has been successfully submitted!</p>
        </div>
    </div>

    <script>
        const selectButton = document.getElementById("selectButton");
        const studentListContainer = document.getElementById("studentListContainer");
        const studentTableBody = document.getElementById("studentTable").getElementsByTagName("tbody")[0];
        const submitAttendanceButton = document.getElementById("submitAttendanceButton");
        const confirmationMessage = document.getElementById("confirmationMessage");

        // Simulated student data
        const studentsData = {
            "6th": [{ id: "S101", name: "John Doe" }, { id: "S102", name: "Jane Smith" }],
            "7th": [{ id: "S103", name: "Sam Wilson" }, { id: "S104", name: "Anna Lee" }],
            "8th": [{ id: "S105", name: "Chris Evans" }, { id: "S106", name: "Emma Watson" }],
            // Add more classes and students as needed
        };

        selectButton.addEventListener("click", () => {
            const selectedClass = document.getElementById("classSelect").value;

            if (selectedClass && studentsData[selectedClass]) {
                // Clear existing rows
                studentTableBody.innerHTML = "";

                // Populate table with students of the selected class
                studentsData[selectedClass].forEach(student => {
                    const row = studentTableBody.insertRow();
                    const cell1 = row.insertCell(0);
                    const cell2 = row.insertCell(1);
                    const cell3 = row.insertCell(2);

                    cell1.textContent = student.id;
                    cell2.textContent = student.name;
                    cell3.innerHTML = `
                        <label><input type="radio" name="attendance-${student.id}" value="Present" required> Present    <input type="radio" name="attendance-${student.id}" value="Absent" required> Absent</label>
                    `;
                });

                // Show the student list
                studentListContainer.classList.remove("hidden");
                confirmationMessage.classList.add("hidden");
            } else {
                alert("Please select a valid class.");
            }
        });

        submitAttendanceButton.addEventListener("click", () => {
            const radios = document.querySelectorAll('input[type="radio"]:checked');

            if (radios.length === studentTableBody.rows.length) {
                confirmationMessage.classList.remove("hidden");
                studentListContainer.classList.add("hidden");
            } else {
                alert("Please mark attendance for all students.");
            }
        });
    </script>
</body>
</html>
