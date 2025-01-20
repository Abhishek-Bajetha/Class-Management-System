<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Signup</title>
    <link
      rel="stylesheet"
      href="<%= application.getContextPath() %>/css/authentication.css"
    />
  </head>
  <body>
    <div class="auth-container">
      <form action="signup" method="post" id="signupForm" class="auth-form" >
        <h2>Signup</h2>

        <!-- Name -->
        <label for="signupName">Name</label>
        <input
          type="text"
          id="signupName"
          name="name"
          placeholder="Enter your name"
          required
          />
          
          <!-- Role Selection -->
          <label for="userRole">Registering as:</label>
          <select id="userRole" name="role" required>
            <option value="">-- Select Role --</option>
            <option value="teacher">Teacher</option>
            <option value="student">Student</option>
          </select>
  
          <!-- Additional Details for Teachers -->
          <div id="teacherDetails" class="hidden">
            <label for="instituteName">Institute Name</label>
            <input
              type="text"
              id="instituteName"
              name="instituteName"
              placeholder="Enter your institute name"
            />
          </div>

        <!-- Email -->
        <label for="signupEmail">Email</label>
        <input
          type="email"
          id="signupEmail"
          name="email"
          placeholder="Enter your email"
          required
        />

        <!-- Password -->
        <label for="signupPassword">Password</label>
        <input
          type="password"
          id="signupPassword"
          name="password"
          placeholder="Create a password"
          required
        />

        <!-- Confirm Password -->
        <label for="signupConfirmPassword">Confirm Password</label>
        <input
          type="password"
          id="signupConfirmPassword"
          name="confirmPassword"
          placeholder="Confirm your password"
          required
        />



        <!-- Signup Button -->
        <button type="submit">Signup</button>
      </form>

      <!-- Toggle Question -->
      <p id="toggleQuestion">
        Already registered? <a href="login.jsp">Login</a>
      </p>

    <script>
      const userRole = document.getElementById("userRole");
      const teacherDetails = document.getElementById("teacherDetails");

      // Show/Hide additional details for teachers
      userRole.addEventListener("change", () => {
        if (userRole.value === "teacher") {
          teacherDetails.classList.remove("hidden");
        } else {
          teacherDetails.classList.add("hidden");
        }
      });
    </script>
  </body>
</html>
