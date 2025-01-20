<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/css/authentication.css">
</head>
<body>
    <div class="auth-container">
        <!-- Login Form -->
        <form  action="login" method="post" id="loginForm" class="auth-form">
            <h2>Login</h2>
            <label for="loginEmail">Email</label>
            <input type="email" id="loginEmail" name="email" placeholder="Enter your email" required>
            <label for="loginPassword">Password</label>
            <input type="password" id="loginPassword" name="password" placeholder="Enter your password" required>
            <button type="submit">Login</button>
        </form>

        <!-- Toggle Question -->
        <p id="toggleQuestion">
            Don't have an account? <a href="signup.jsp">Signup</a>
        </p>
    </div>
</body>
</html>
