<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Management System</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/css/landingPage.css">
</head>
<body>
    <header class="header">
        <div class="logo">
            <h1>Class Management System</h1>
        </div>
        <nav class="nav">
            <a href="login.jsp" class="login-btn">Login</a>
        </nav>
    </header>

    <main class="main-content">
        <section class="intro">
            <div class="text">
                <h2>Welcome to the Class Management System</h2>
                <p>
                    Our platform simplifies the management of academic activities for teachers and students.
                    From attendance tracking to assignments, notices, and marks, everything is streamlined
                    to ensure a smooth teaching and learning experience.
                </p>
                <p>
                    Teachers can manage their classes, upload assignments and notes, and track student progress.
                    Students can access study materials, check their marks, and stay updated with announcements.
                </p>
                <a href="login.jsp" class="cta-btn">Get Started</a>
            </div>
            <div class="image">
                <img src="<%= application.getContextPath() %>/img/teacher.png" alt="Class Management Illustration">

            </div>
        </section>
    </main>

    <!--<footer class="footer">
        <p>&copy; 2025 Class Management System. All rights reserved.<i>abhishek bajetha</i></p>
    </footer> -->
</body>
</html>
