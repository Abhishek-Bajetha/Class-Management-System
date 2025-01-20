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
                <option value="6th">6th</option>
                <option value="7th">7th</option>
                <option value="8th">8th</option>
                <option value="9th">9th</option>
                <option value="10th">10th</option>
                <option value="11th">11th</option>
                <option value="12th">12th</option>
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

        <div id="confirmationMessage" class="hidden">
            <p>Your class has been scheduled successfully!</p>
        </div>
    </div>

    <script>
        document.getElementById("scheduleButton").addEventListener("click", function(e) {
            e.preventDefault(); // Prevent form submission
            const classStandard = document.getElementById("classStandard").value;
            const timeSlot = document.getElementById("timeSlot").value;

            if(classStandard && timeSlot) {
                document.getElementById("confirmationMessage").classList.remove("hidden");
                document.getElementById("confirmationMessage").innerHTML = `<p>Class ${classStandard} is scheduled for ${timeSlot} tomorrow.</p>`;
            } else {
                alert("Please select both class standard and time slot.");
            }
        });
    </script>
</body>
</html>
