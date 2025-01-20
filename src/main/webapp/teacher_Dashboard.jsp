<!--<!DOCTYPE html>-->
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="<%=application.getContextPath() %>/css/landingstyle.css"
    />
  </head>
  <body>
    <div class="main">
      <div class="nav">
        <div class="img">
          <img
            src="<%=application.getContextPath() %>/img/user.png"
            alt="loading..."
          />
        </div>
        <div class="usersname">
        <%
        // Accessing the session attribute to display the user's name
        String userName = (String) session.getAttribute("userName");
        out.print(userName);
        %>

        </div>
        <div class="paneltype">Teachers panel</div>
      </div>
      <div class="landing">
        <div class="options">
          <div class="features">
            <a
              href="<%=application.getContextPath() %>/addBatch.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="logo">
                <img
                  src="<%=application.getContextPath() %>/img/addBatch.png"
                  alt="loading..."
                />
              </div>
            </a>
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/addBatch.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="featuretext">Batch</div>
            </a>
            <div class="detail">
              Create and manage new batches for different student groups
              efficiently.
            </div>
          </div>
          <div class="features">
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/editstudents.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="logo">
                <img
                  src="<%=application.getContextPath() %>/img/addMembers.png"
                  alt="loading..."
                />
              </div>
            </a>
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/editstudents.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="featuretext">Modify students</div>
            </a>
            <div class="detail">
              Add or remove students from classes based on registration status.
            </div>
          </div>
          <div class="features">
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/scheduleClass.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="logo">
                <img src="./img/calendar.png" alt="loading..." />
              </div>
            </a>
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/scheduleClass.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="featuretext">Schedule class</div>
            </a>
            <div class="detail">
              Define and schedule class timings for effective learning
              management.
            </div>
          </div>

          <div class="features">
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/attendanceTaker.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="logo">
                <img
                  src="<%=application.getContextPath() %>/img/attendance.png"
                  alt="loading..."
                />
              </div>
            </a>
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/attendanceTaker.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="featuretext">Attendance</div>
            </a>
            <div class="detail">
              Track and manage student attendance for each class session
              accurately.
            </div>
          </div>
          </div>
           <div class="options">
          <div class="features">
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/uploadNotes.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="logo">
                <img
                  src="<%=application.getContextPath() %>/img/notepad.png"
                  alt="loading..."
                />
              </div>
            </a>
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/uploadNotes.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="featuretext">Upload notes</div>
            </a>
            <div class="detail">
              Share important class notes with students for their reference.
            </div>
          </div>

          <div class="features">
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/assignments.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="logo">
                <img
                  src="<%=application.getContextPath() %>/img/assignment.png"
                  alt="loading..."
                />
              </div>
            </a>
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/assignments.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="featuretext">Upload Assignment</div>
            </a>
            <div class="detail">
              Upload assignments for students, monitor submissions, and grade
              performances.
            </div>
          </div>

          <div class="features">
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/uploadMarks.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="logo">
                <img
                  src="<%=application.getContextPath() %>/img/exam-result.png"
                  alt="loading..."
                />
              </div>
            </a>
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/uploadMarks.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="featuretext">Upload marks</div>
            </a>
            <div class="detail">
              Input and manage students' marks for assignments and exams
              effectively.
            </div>
          </div>
          <div class="features">
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/noticeAnnouncement.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="logo">
                <img
                  src="<%=application.getContextPath() %>/img/notifications.png"
                  alt="loading..."
                />
              </div>
            </a>
            <a
              href="<%=application.getContextPath() %>/teacher's-Dash/noticeAnnouncement.jsp"
              style="text-decoration: none; color: white; font-weight: 800"
            >
              <div class="featuretext">Notice</div>
            </a>
            <div class="detail">
              Post important announcements and notices for student awareness and
              updates.
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
