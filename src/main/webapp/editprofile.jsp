<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/editprofile.css">
</head>
<body>

<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Job Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="user-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="profile.jsp" class="active"><i class="fa-solid fa-user"></i> Profile</a>
    <a href="viewjobs"><i class="fa-solid fa-briefcase"></i> Jobs</a>
    <a href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
    <div class="nav-divider"></div>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<div class="main-content">

  <!-- TOPBAR -->
  <div class="topbar">
    <div class="topbar-left">
      <a href="user-dashboard.jsp" class="ep-back-btn"><i class="fa-solid fa-arrow-left"></i> Dashboard</a>
    </div>
    <div class="topbar-right">
      <a href="logout" class="btn btn-secondary btn-sm"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>
  </div>

  <!-- HEADER CARD -->
  <div class="ep-header-card">
    <div>
      <h1 class="ep-title"><i class="fa-solid fa-user-pen"></i> Edit Profile</h1>
      <p class="ep-subtitle">Update your profile information and keep your account up to date.</p>
    </div>
  </div>

  <!-- STATS -->
  <div class="stats-grid" style="margin:0 28px 20px;padding:0;">
    <div class="stat-card">
      <i class="fa-solid fa-circle-check stat-icon"></i>
      <div class="stat-number">100%</div>
      <div class="stat-label">Profile Status</div>
    </div>
    <div class="stat-card">
      <i class="fa-solid fa-id-badge stat-icon"></i>
      <div class="stat-number" style="font-size:16px;">${user.role}</div>
      <div class="stat-label">Current Role</div>
    </div>
    <div class="stat-card">
      <i class="fa-solid fa-signal stat-icon"></i>
      <div class="stat-number" style="font-size:18px;color:#057642;">Active</div>
      <div class="stat-label">Account Status</div>
    </div>
  </div>

  <!-- CONTENT SECTION -->
  <div class="ep-content">

    <!-- LEFT: PROFILE PREVIEW CARD -->
    <div class="ep-profile-card">
      <div class="ep-avatar-circle"><i class="fa-solid fa-user"></i></div>
      <h2>${user.name}</h2>
      <p class="ep-role-text">${user.role}</p>
      <span class="ep-tip">Keep your profile updated to improve your visibility to recruiters.</span>
    </div>

    <!-- RIGHT: FORM CARD -->
    <div class="ep-form-card">
      <h3 class="ep-form-title">Personal Information</h3>

      <form action="edituserprofile" method="post">

        <div class="form-group">
          <label for="epId">User ID</label>
          <input type="number" id="epId" name="id" value="${user.id}" readonly>
        </div>

        <div class="form-group">
          <label for="epName">Full Name</label>
          <input type="text" id="epName" name="name" value="${user.name}" placeholder="Enter your full name">
        </div>

        <div class="form-group">
          <label for="epEmail">Email Address</label>
          <input type="email" id="epEmail" name="email" value="${user.email}" placeholder="Enter your email">
        </div>

        <div class="form-group">
          <label for="epPassword">Password</label>
          <div class="password-wrapper" style="position:relative;">
            <input type="password" id="epPassword" name="password" value="${user.password}" style="padding-right:44px;">
            <button type="button" class="pw-toggle-ep" onclick="toggleEpPw()" tabindex="-1" style="position:absolute;right:12px;top:50%;transform:translateY(-50%);background:none;border:none;color:#999;cursor:pointer;">
              <i class="fa-solid fa-eye" id="epEyeIcon"></i>
            </button>
          </div>
        </div>

        <div class="form-group">
          <label for="epRole">Role</label>
          <input type="text" id="epRole" name="role" value="${user.role}" placeholder="Your role">
        </div>

        <button type="submit" class="update-btn">
          <i class="fa-solid fa-floppy-disk"></i> Update Profile
        </button>

      </form>
    </div>

  </div>

</div>

<script>
function toggleEpPw() {
    const input = document.getElementById('epPassword');
    const icon  = document.getElementById('epEyeIcon');
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