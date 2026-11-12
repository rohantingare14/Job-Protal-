<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Register at SMARTHIRE - Create your account as a Job Seeker or Recruiter">
<title>Register | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/register.css">
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
      <a href="login.jsp" class="auth-nav-btn">Login</a>
    </div>
  </div>
</nav>

<!-- MAIN -->
<div class="auth-page">
  <div class="auth-container">

    <!-- LEFT PANEL -->
    <div class="auth-left">
      <div class="auth-left-content">
        <h1>Start Your <span>Career Journey</span> Today</h1>
        <p>Join thousands of job seekers and recruiters. Create your account and start exploring exciting opportunities.</p>
        <div class="auth-features">
          <div class="auth-feature"><i class="fa-solid fa-circle-check"></i> Free to register</div>
          <div class="auth-feature"><i class="fa-solid fa-circle-check"></i> Apply instantly</div>
          <div class="auth-feature"><i class="fa-solid fa-circle-check"></i> Post jobs for free</div>
        </div>
        <div class="auth-badge">CREATE ACCOUNT</div>
      </div>
    </div>

    <!-- RIGHT: REGISTER CARD -->
    <div class="auth-card">
      <div class="auth-card-header">
        <div class="auth-card-icon"><i class="fa-solid fa-user-plus"></i></div>
        <h2>Create Account</h2>
        <p class="subtitle">Register to continue</p>
      </div>

      <form action="register" method="post" class="auth-form">

        <div class="auth-input-group">
          <label for="regName"><i class="fa-solid fa-user"></i> Full Name</label>
          <input type="text" id="regName" name="name" placeholder="Enter your full name" required>
        </div>

        <div class="auth-input-group">
          <label for="regEmail"><i class="fa-solid fa-envelope"></i> Email Address</label>
          <input type="email" id="regEmail" name="email" placeholder="Enter your email address" required>
        </div>

        <div class="auth-input-group">
          <label for="regPassword"><i class="fa-solid fa-lock"></i> Password</label>
          <div class="password-wrapper">
            <input type="password" id="regPassword" name="password" placeholder="Create a strong password" required>
            <button type="button" class="pw-toggle" onclick="togglePw('regPassword', this)" tabindex="-1">
              <i class="fa-solid fa-eye"></i>
            </button>
          </div>
        </div>

        <div class="auth-input-group">
          <label for="regRole"><i class="fa-solid fa-id-badge"></i> Select Role</label>
          <select id="regRole" name="role" required>
            <option value="">Select Role</option>
            <option value="JOB_SEEKER">Job Seeker</option>
            <option value="RECRUITER">Recruiter</option>
          </select>
        </div>

        <input type="submit" value="Register" class="login-btn">

      </form>

      <div class="auth-switch">
        Already have an account? <a href="login.jsp">Login here</a>
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