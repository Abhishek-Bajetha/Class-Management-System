<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notice / Announcement</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/css/noticeAnnouncement.css">
</head>
<body>
    <div class="container">
        <h2>Announcement to Students</h2>
        
        <!-- Form to Create and Send Notice -->
        <form action="javascript:void(0);" method="POST">
            <div class="notice-form">
                <textarea id="noticeText" name="noticeText" placeholder="Write your notice here..." required></textarea>
                <button type="button" id="sendNoticeButton">Send Notice</button>
            </div>
        </form>

        <!-- Confirmation message after notice is sent -->
        <div id="confirmationMessage" class="hidden">
            <p>Your notice has been successfully sent to the students!</p>
        </div>

        <!-- Display all sent notices -->
        <div class="notice-history">
            <h3>Previously Sent Notices</h3>
            <table id="noticeHistoryTable">
                <thead>
                    <tr>
                        <th>Notice ID</th>
                        <th>Notice Text</th>
                        <th>Sent On</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Dynamic content for previously sent notices -->
                </tbody>
            </table>
        </div>
    </div>

    <script>
        // Simulating sending a notice (in a real application, notice data will be sent to the server)
        document.getElementById("sendNoticeButton").addEventListener("click", function() {
            const noticeText = document.getElementById("noticeText").value;

            if (noticeText.trim()) {
                // Simulate sending the notice (In a real app, send this to the server)
                const notice = {
                    noticeID: Date.now(),
                    text: noticeText,
                    sentOn: new Date().toLocaleString()
                };

                // Add the notice to the history table
                const tableBody = document.getElementById("noticeHistoryTable").getElementsByTagName("tbody")[0];
                const row = tableBody.insertRow();
                const cell1 = row.insertCell(0);
                const cell2 = row.insertCell(1);
                const cell3 = row.insertCell(2);

                cell1.textContent = notice.noticeID;
                cell2.textContent = notice.text;
                cell3.textContent = notice.sentOn;

                // Clear the text area and show the confirmation message
                document.getElementById("noticeText").value = "";
                document.getElementById("confirmationMessage").classList.remove("hidden");
            } else {
                alert("Please write a notice before sending.");
            }
        });
    </script>
</body>
</html>
