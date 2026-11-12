<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset Password | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/reset.css">
</head>
<body>

<nav class="auth-navbar">
  <div class="auth-nav-container">
    <a href="home.jsp" class="auth-brand">
      <div class="auth-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
      <div>
        <span class="auth-brand-name">SMARTHIRE</span>
        <span class="auth-brand-sub">Recruitment Management Platform</span>
      </div>
    </a>
    <div class="auth-nav-links">
      <a href="login.jsp" class="auth-nav-link">Login</a>
      <a href="register.jsp" class="auth-nav-btn">Register</a>
    </div>
  </div>
</nav>

<div class="auth-page">
  <div class="auth-container">

    <div class="auth-left">
      <div class="auth-left-content">
        <div class="reset-lock-icon"><i class="fa-solid fa-lock"></i></div>
        <h1>Reset Your <span>Password</span></h1>
        <p>Secure your account by creating a new password. Enter your registered email address and choose a strong password.</p>
        <div class="auth-features">
          <div class="auth-feature"><i class="fa-solid fa-shield-halved"></i> Secure Process</div>
          <div class="auth-feature"><i class="fa-solid fa-clock"></i> Quick Reset</div>
        </div>
        <div class="auth-badge">&#x1F510; ACCOUNT SECURITY FIRST</div>
      </div>
    </div>

    <div class="auth-card">
      <div class="auth-card-header">
        <div class="auth-card-icon" style="background:#FEF3C7;color:#B45309;"><i class="fa-solid fa-key"></i></div>
        <h2>Reset Password</h2>
        <p class="subtitle">Enter your details below</p>
      </div>

      <form action="reset" class="auth-form">

        <div class="auth-input-group">
          <label for="resetEmail"><i class="fa-solid fa-envelope"></i> Registered Email</label>
          <input type="email" id="resetEmail" name="email" placeholder="Enter your registered email" required>
        </div>

        <div class="auth-input-group">
          <label for="resetPw"><i class="fa-solid fa-lock"></i> New Password</label>
          <div class="password-wrapper">
            <input type="password" id="resetPw" name="password" placeholder="Enter your new password" required>
            <button type="button" class="pw-toggle" onclick="togglePw('resetPw', this)" tabindex="-1">
              <i class="fa-solid fa-eye"></i>
            </button>
          </div>
        </div>

        <input type="submit" value="Reset Password" class="reset-btn">

      </form>

      <a href="login.jsp" class="back-login">
        <i class="fa-solid fa-arrow-left"></i> Back To Login
      </a>

      <p class="message">${msg2}</p>
    </div>

  </div>
</div>

<script>
function togglePw(id, btn) {
    const input = document.getElementById(id);
    const icon  = btn.querySelector('i');
    if (input.type === 'password') {
        input.type = 'text';
        icon.className = 'fa-solid fa-eye-slash';
    } else {
        input.type = 'password';
        icon.className = 'fa-solid fa-eye';
    }
}
</script>
</body>
</html>