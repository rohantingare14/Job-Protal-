<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/profile.css">
</head>

<body>
<%
if(session.getAttribute("user")==null)
    response.sendRedirect("login.jsp");
%>

<!-- SIDEBAR -->
<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Job Seeker Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="user-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="viewjob"><i class="fa-solid fa-briefcase"></i> Browse Jobs</a>
    <a href="savedjob"><i class="fa-solid fa-heart"></i> Saved Jobs</a>
    <a href="myapplications"><i class="fa-solid fa-file-lines"></i> My Applications</a>
    <a href="profile.jsp" class="active"><i class="fa-solid fa-user"></i> Profile</a>
    <div class="nav-divider"></div>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<!-- MAIN CONTENT -->
<div class="main-content">

  <!-- TOP BUTTONS (preserved) -->
  <div class="topbar">
    <div class="topbar-left">
      <h1>My Profile</h1>
    </div>
    <div class="topbar-right">
      <a href="index.jsp" class="btn btn-secondary btn-sm">Home</a>
      <a href="user-dashboard.jsp" class="btn btn-secondary btn-sm">Dashboard</a>
      <a href="logout" class="btn btn-secondary btn-sm"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>
  </div>

  <div class="profile-page-content">

    <!-- Cover Banner -->
    <div class="profile-banner"></div>

    <!-- Profile Header Card -->
    <div class="profile-header-card">
      <div class="profile-header-row">
        <div class="profile-avatar">${user.name.substring(0,1)}</div>
        <div class="profile-info" style="flex:1;">
          <h1>${user.name}</h1>
          <h3><span class="badge badge-primary">${user.role}</span></h3>
          <p><i class="fa-solid fa-location-dot" style="color:#0A66C2;margin-right:5px;"></i>Pune, Maharashtra, India</p>
          <p><i class="fa-solid fa-envelope" style="color:#0A66C2;margin-right:5px;"></i>${user.email}</p>
          <div class="profile-actions" style="margin-top:14px;">
            <form action="editprofile" style="display:inline;">
              <input type="text" hidden="" name="userId" value="${user.id}">
              <button type="submit" class="btn btn-primary btn-sm"><i class="fa-solid fa-pen"></i> Edit Profile</button>
            </form>
            <p class="success" style="color:green;display:inline;margin-left:12px;">${msg}</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Stats -->
    <div class="stats-grid" style="margin: 0 28px 20px; padding: 0;">
      <div class="stat-card">
        <i class="fa-solid fa-file-circle-check stat-icon"></i>
        <div class="stat-number">12</div>
        <div class="stat-label">Applications</div>
      </div>
      <div class="stat-card">
        <i class="fa-solid fa-heart stat-icon"></i>
        <div class="stat-number">5</div>
        <div class="stat-label">Saved Jobs</div>
      </div>
      <div class="stat-card">
        <i class="fa-solid fa-calendar-check stat-icon"></i>
        <div class="stat-number">2</div>
        <div class="stat-label">Interviews</div>
      </div>
      <div class="stat-card">
        <i class="fa-solid fa-trophy stat-icon"></i>
        <div class="stat-number">3</div>
        <div class="stat-label">Offers</div>
      </div>
    </div>

    <!-- About -->
    <div class="section-card">
      <h2>About</h2>
      <p style="font-size:13.5px;color:#444;line-height:1.7;">
        Passionate Full Stack Developer with strong skills in Java, Spring Boot, Hibernate, SQL, HTML, CSS, JavaScript and React.
      </p>
    </div>

    <!-- Skills -->
    <div class="section-card">
      <h2>Skills</h2>
      <div class="skill-chips">
        <span class="skill-chip">Java</span>
        <span class="skill-chip">Spring Boot</span>
        <span class="skill-chip">Hibernate</span>
        <span class="skill-chip">SQL</span>
        <span class="skill-chip">React</span>
        <span class="skill-chip">HTML</span>
        <span class="skill-chip">CSS</span>
        <span class="skill-chip">JavaScript</span>
      </div>
    </div>

    <!-- Profile Completion -->
    <div class="section-card">
      <h2>Profile Completion</h2>
      <div style="display:flex;align-items:center;gap:14px;margin-top:8px;">
        <div class="progress-bar" style="flex:1;">
          <div class="progress-bar-fill" style="width:80%;"></div>
        </div>
        <span style="font-size:14px;font-weight:700;color:#0A66C2;">80%</span>
      </div>
    </div>

  </div>

</div>
</body>
</html>