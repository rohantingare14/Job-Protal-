<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard |SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/user-dashboard.css">
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
    <a href="user-dashboard.jsp" class="active"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="viewjob"><i class="fa-solid fa-briefcase"></i> Browse Jobs</a>
    <a href="savedjob"><i class="fa-solid fa-heart"></i> Saved Jobs</a>
    <a href="myapplications"><i class="fa-solid fa-file-lines"></i> My Applications</a>
    <a href="profile.jsp"><i class="fa-solid fa-user"></i> Profile</a>
    <div class="nav-divider"></div>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<div class="main-content">

  <div class="topbar">
    <div class="topbar-left">
      <h1>Dashboard</h1>
    </div>
    <div class="topbar-right">
      <a href="home.jsp" class="btn btn-secondary btn-sm"><i class="fa-solid fa-house"></i> Home</a>
      <a href="logout" class="btn btn-secondary btn-sm"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>
  </div>

  <div class="welcome-banner">
    <div>
      <h1>Welcome Back, <span>${user.name}</span> &#x1F44B;</h1>
      <p>Explore new opportunities and take the next step in your career.</p>
      <div class="welcome-actions">
        <a href="viewjob" class="btn-welcome-primary"><i class="fa-solid fa-briefcase"></i> Browse Jobs</a>
        <a href="myapplications" class="btn-welcome-secondary"><i class="fa-solid fa-file-lines"></i> My Applications</a>
      </div>
    </div>
  </div>

  <div class="stats-grid">
    <div class="stat-card" onclick="window.location.href='myapplications'" style="cursor:pointer;">
      <i class="fa-solid fa-file-circle-check stat-icon"></i>
      <div class="stat-number">12</div>
      <div class="stat-label">Applications</div>
    </div>
    <div class="stat-card" onclick="window.location.href='savedjob'" style="cursor:pointer;">
      <i class="fa-solid fa-heart stat-icon"></i>
      <div class="stat-number">5</div>
      <div class="stat-label">Saved Jobs</div>
    </div>
    <div class="stat-card">
      <i class="fa-solid fa-calendar-check stat-icon"></i>
      <div class="stat-number">2</div>
      <div class="stat-label">Interview Calls</div>
    </div>
    <div class="stat-card">
      <i class="fa-solid fa-trophy stat-icon"></i>
      <div class="stat-number">3</div>
      <div class="stat-label">Offers</div>
    </div>
  </div>

  <div class="dashboard-grid">

    <div class="card">
      <h2 class="card-title"><i class="fa-solid fa-bolt"></i> Quick Actions</h2>
      <div class="quick-actions">
        <a href="viewjob" class="quick-action-item">
          <div class="qa-icon"><i class="fa-solid fa-magnifying-glass"></i></div>
          <div>
            <h4>Browse Jobs</h4>
            <p>Find your perfect role</p>
          </div>
          <i class="fa-solid fa-chevron-right qa-arrow"></i>
        </a>
        <a href="myapplications" class="quick-action-item">
          <div class="qa-icon"><i class="fa-solid fa-file-lines"></i></div>
          <div>
            <h4>My Applications</h4>
            <p>Track application status</p>
          </div>
          <i class="fa-solid fa-chevron-right qa-arrow"></i>
        </a>
        <a href="savedjob" class="quick-action-item">
          <div class="qa-icon"><i class="fa-solid fa-heart"></i></div>
          <div>
            <h4>Saved Jobs</h4>
            <p>Jobs you bookmarked</p>
          </div>
          <i class="fa-solid fa-chevron-right qa-arrow"></i>
        </a>
        <a href="profile.jsp" class="quick-action-item">
          <div class="qa-icon"><i class="fa-solid fa-user"></i></div>
          <div>
            <h4>My Profile</h4>
            <p>Update your information</p>
          </div>
          <i class="fa-solid fa-chevron-right qa-arrow"></i>
        </a>
      </div>
    </div>

    <div class="job-section card">
      <h2 class="card-title"><i class="fa-solid fa-briefcase"></i> Find Your Dream Job</h2>
      <p class="card-desc">Browse thousands of jobs from top recruiters and apply instantly.</p>
      <div class="job-section-cta">
        <a href="viewjob" class="browse-btn">Browse All Jobs <i class="fa-solid fa-arrow-right"></i></a>
      </div>
      <div class="job-tips">
        <div class="tip"><i class="fa-solid fa-lightbulb"></i> Complete your profile to get better matches</div>
        <div class="tip"><i class="fa-solid fa-bell"></i> Check back daily for new postings</div>
      </div>
    </div>

  </div>

</div>
</body>
</html>