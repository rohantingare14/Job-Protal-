<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recruiter Profile | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/profile.css">
</head>
<body>

<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Recruiter Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="recruiter-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="#" class="active"><i class="fa-solid fa-user-tie"></i> Profile</a>
    <a href="postedjobs"><i class="fa-solid fa-list-ul"></i> My Jobs</a>
    <a href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
    <div class="nav-divider"></div>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<div class="main-content">
  <div class="topbar">
    <div class="topbar-left">
      <h1>Recruiter Profile</h1>
    </div>
    <div class="topbar-right">
      <a href="recruiterdashboard.jsp" class="btn btn-secondary btn-sm"><i class="fa-solid fa-arrow-left"></i> Dashboard</a>
    </div>
  </div>

  <div class="profile-page-content">

    <div class="profile-banner"></div>

    <div class="profile-header-card">
      <div class="profile-header-row">
        <div class="profile-avatar">${user.name.substring(0,1)}</div>
        <div class="profile-info" style="flex:1;">
          <h1>${user.name}</h1>
          <h3><span class="badge badge-primary">${user.role}</span></h3>
          <p><i class="fa-solid fa-envelope" style="color:#0A66C2;margin-right:5px;"></i>${user.email}</p>
          <div class="profile-actions" style="margin-top:14px;">
            <form action="editrecruiterprofile" style="display:inline;">
              <input type="hidden" name="userId" value="${user.id}">
              <button type="submit" class="btn btn-primary btn-sm">
                <i class="fa-solid fa-pen"></i> Edit Profile
              </button>
            </form>
            <p class="success" style="color:green;display:inline;margin-left:12px;">${msg}</p>
          </div>
        </div>
      </div>
    </div>

    <div class="stats-grid" style="margin:0 28px 20px;padding:0;">
      <div class="stat-card">
        <i class="fa-solid fa-hashtag stat-icon"></i>
        <div class="stat-number" style="font-size:18px;">${user.id}</div>
        <div class="stat-label">User ID</div>
      </div>
      <div class="stat-card">
        <i class="fa-solid fa-id-badge stat-icon"></i>
        <div class="stat-number" style="font-size:16px;">${user.role}</div>
        <div class="stat-label">Role</div>
      </div>
      <div class="stat-card">
        <i class="fa-solid fa-circle-check stat-icon"></i>
        <div class="stat-number">100%</div>
        <div class="stat-label">Profile Complete</div>
      </div>
      <div class="stat-card">
        <i class="fa-solid fa-signal stat-icon"></i>
        <div class="stat-number" style="font-size:18px;color:#057642;">Active</div>
        <div class="stat-label">Status</div>
      </div>
    </div>

    <div class="section-card">
      <h2>Account Information</h2>
      <table style="width:100%;border-collapse:collapse;">
        <tr style="border-bottom:1px solid #F0F4F8;">
          <td style="padding:10px 0;font-size:13.5px;color:#666;width:160px;font-weight:600;">ID</td>
          <td style="padding:10px 0;font-size:13.5px;color:#1D2226;">${user.id}</td>
        </tr>
        <tr style="border-bottom:1px solid #F0F4F8;">
          <td style="padding:10px 0;font-size:13.5px;color:#666;font-weight:600;">Name</td>
          <td style="padding:10px 0;font-size:13.5px;color:#1D2226;">${user.name}</td>
        </tr>
        <tr style="border-bottom:1px solid #F0F4F8;">
          <td style="padding:10px 0;font-size:13.5px;color:#666;font-weight:600;">Email</td>
          <td style="padding:10px 0;font-size:13.5px;color:#1D2226;">${user.email}</td>
        </tr>
        <tr>
          <td style="padding:10px 0;font-size:13.5px;color:#666;font-weight:600;">Role</td>
          <td style="padding:10px 0;font-size:13.5px;color:#1D2226;">${user.role}</td>
        </tr>
      </table>
    </div>

    <div class="section-card">
      <h2>Recruiter Features</h2>
      <div class="skill-chips">
        <span class="skill-chip">Job Posting</span>
        <span class="skill-chip">Candidate Search</span>
        <span class="skill-chip">Recruitment</span>
        <span class="skill-chip">Hiring</span>
        <span class="skill-chip">Interview Management</span>
      </div>
    </div>

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