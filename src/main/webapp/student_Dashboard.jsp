<html>
  <head>
    <title>Teacher's Panel</title>
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="<%= application.getContextPath() %>/css/student_Dashboard.css"
    />
  </head>
  <body>
    <div class="header">
      <div class="title">
        <img alt="Teacher's profile picture" src="https://placehold.co/50x50" />
        <h1>
        <%
                // Accessing the session attribute to display the user's name
                String userName = (String) session.getAttribute("userName");
                out.print(userName);
                %>
        </h1>
      </div>
      <div class="panel">Student's panel</div>
    </div>
    <div class="container">
      <div class="card">
        <img alt="Schedule class icon" src="https://placehold.co/80x80" />
        <h3>Schedule class</h3>
        <p>
          Define and schedule class timings for effective learning management.
        </p>
      </div>
      <div class="card">
        <img alt="Attendance icon" src="https://placehold.co/80x80" />
        <h3>Attendance</h3>
        <p>
          Track and manage student attendance for each class session accurately.
        </p>
      </div>
      <div class="card">
        <img alt="Upload notes icon" src="https://placehold.co/80x80" />
        <h3>Study notes</h3>
        <p>Share important class notes with students for their reference.</p>
      </div>
      <div class="card">
        <img alt="Upload Assignment icon" src="https://placehold.co/80x80" />
        <h3>Assignment</h3>
        <p>
          Upload assignments for students, monitor submissions, and grade
          performances.
        </p>
      </div>
      <div class="card">
        <img alt="Performance" src="https://placehold.co/80x80" />
        <h3>Performance</h3>
        <p>
          Input and manage students' marks for assignments and exams
          effectively.
        </p>
      </div>
      <div class="card">
        <img alt="feedback icon" src="https://placehold.co/80x80" />
        <h3>Feedback</h3>
        <p>Add or remove students from classes based on registration status.</p>
      </div>
      <div class="card">
        <img alt="Notice icon" src="https://placehold.co/80x80" />
        <h3>Notice</h3>
        <p>
          Post important announcements and notices for student awareness and
          updates.
        </p>
      </div>
    </div>
  </body>
</html>
