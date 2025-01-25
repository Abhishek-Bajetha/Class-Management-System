<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Class/Batch</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/css/createClass.css">
</head>
  <body>
        <div class="container">
            <h2>Create New Class/Batch</h2>
            <!-- Form to Create New Class -->
            <form action="AddBatch" method="POST" id="createClassForm">
                <label for="className">Class/Batch Name:</label>
                <input type="text" id="className" name="className" placeholder="Enter class or batch name" required>

                <label for="className">Class/Batch Code:</label>
                <input type="text" id="classCode" name="classCode" placeholder="Enter class or batch code" required>

                <label for="classDescription">Description (Optional):</label>
                <textarea id="classDescription" name="classDescription" placeholder="Provide a brief description (optional)"></textarea>

                <button type="submit">Create Class</button>
            </form>
        </div>
  </body>
</html>
