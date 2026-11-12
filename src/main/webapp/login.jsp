<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Login to SMARTHIRE - Access thousands of job opportunities">
<title>Login | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>

<!-- NAVBAR -->
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
      <a href="home.jsp" class="auth-nav-link"><i class="fa-solid fa-house"></i> Home</a>
      <a href="register.jsp" class="auth-nav-btn">Create Account</a>
    </div>
  </div>
</nav>

<!-- MAIN -->
<div class="auth-page">
  <div class="auth-container">

    <!-- LEFT PANEL -->
    <div class="auth-left">
      <div class="auth-left-content">
        <h1>Your Career <span>Opportunities</span> Start Here</h1>
        <p>Discover thousands of job opportunities and take the next step towards your dream career.</p>
        <div class="auth-features">
          <div class="auth-feature"><i class="fa-solid fa-circle-check"></i> 500+ Active Jobs</div>
          <div class="auth-feature"><i class="fa-solid fa-circle-check"></i> Top Recruiters</div>
          <div class="auth-feature"><i class="fa-solid fa-circle-check"></i> Instant Apply</div>
        </div>
        <div class="auth-badge">WE ARE HIRING</div>
      </div>
    </div>

    <!-- RIGHT: LOGIN CARD -->
    <div class="auth-card">
      <div class="auth-card-header">
        <div class="auth-card-icon"><i class="fa-solid fa-right-to-bracket"></i></div>
        <h2>Welcome Back!</h2>
        <p class="subtitle">Login to your account</p>
      </div>

      <form action="login" method="post" class="auth-form">

        <div class="auth-input-group">
          <label for="loginEmail"><i class="fa-solid fa-envelope"></i> Email Address</label>
          <input type="email" id="loginEmail" name="email" placeholder="Enter your email address" required>
        </div>

        <div class="auth-input-group">
          <label for="loginPassword"><i class="fa-solid fa-lock"></i> Password</label>
          <div class="password-wrapper">
            <input type="password" id="loginPassword" name="password" placeholder="Enter your password" required>
            <button type="button" class="pw-toggle" onclick="togglePw('loginPassword', this)" tabindex="-1">
              <i class="fa-solid fa-eye"></i>
            </button>
          </div>
        </div>

        <input type="submit" value="Login" class="login-btn">

      </form>

      <a href="reset.jsp" class="forgot">Forgot Password?</a>

      <p class="error">${error}</p>
      <p class="success">${msg1}</p>

      <div class="auth-switch">
        Don't have an account? <a href="register.jsp">Register here</a>
      </div>
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