<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recruiter Dashboard | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/recruiter.css">
</head>

<body>
<%
if(session.getAttribute("user")==null)
    response.sendRedirect("login.jsp");
%>

<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Recruiter Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="recruiter-dashboard.jsp" class="active"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="post-job.jsp"><i class="fa-solid fa-plus"></i> Post Job</a>
    <a href="postedjobs"><i class="fa-solid fa-list-ul"></i> Posted Jobs</a>
    <a href="recruiterprofile?id=${user.id}"><i class="fa-solid fa-user-tie"></i> Profile</a>
    <a href="shortlistedcandidates"><i class="fa-solid fa-star"></i> Shortlisted</a>
    <a href="rejectedcandidates"><i class="fa-solid fa-circle-xmark"></i> Rejected</a>
    <div class="nav-divider"></div>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<div class="main-content">

  <div class="topbar">
    <div class="topbar-left">
      <h1>Recruiter Dashboard</h1>
    </div>
    <div class="topbar-right">
      <input type="text" placeholder="Search jobs, applications..." class="search rd-search">
      <div class="nav-links" style="display:flex;gap:8px;align-items:center;">
        <a href="home.jsp" class="btn btn-secondary btn-sm">Home</a>
        <a href="register.jsp" class="btn btn-secondary btn-sm">Register</a>
        <a href="login.jsp" class="btn btn-secondary btn-sm">Login</a>
        <a href="logout" class="btn btn-secondary btn-sm logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
      </div>
    </div>
  </div>

  <div class="welcome-banner">
    <div>
      <h1>Welcome Back, <span>${user.name}</span></h1>
      <p>Manage your job postings and find the best candidates for your team.</p>
      <div style="margin-top:16px;">
        <a href="post-job.jsp" class="btn-welcome-rd">
          <i class="fa-solid fa-plus"></i> Post New Job
        </a>
        <a href="postedjobs" class="btn-welcome-rd-outline">
          <i class="fa-solid fa-list-ul"></i> View Posted Jobs
        </a>
      </div>
    </div>
  </div>

  <div class="stats-grid">
    <div class="stat-card">
      <i class="fa-solid fa-briefcase stat-icon"></i>
      <div class="stat-number">12</div>
      <div class="stat-label">Active Jobs</div>
    </div>
    <div class="stat-card">
      <i class="fa-solid fa-file-lines stat-icon"></i>
      <div class="stat-number">128</div>
      <div class="stat-label">Applications</div>
    </div>
    <div class="stat-card">
      <i class="fa-solid fa-star stat-icon"></i>
      <div class="stat-number">24</div>
      <div class="stat-label">Shortlisted</div>
    </div>
  </div>

  <div class="rd-grid">

    <div class="table-wrapper">
      <div class="table-title">
        <h2><i class="fa-solid fa-clock-rotate-left" style="color:#0A66C2;margin-right:8px;"></i>Recent Job Postings</h2>
        <a href="postedjobs" class="btn btn-secondary btn-sm">View All</a>
      </div>
      <table class="data-table">
        <thead>
          <tr><th>Job Title</th><th>Applications</th><th>Status</th></tr>
        </thead>
        <tbody>
          <tr>
            <td><strong>Java Developer</strong></td>
            <td>25</td>
            <td><span class="badge badge-success">Active</span></td>
          </tr>
          <tr>
            <td><strong>Frontend Developer</strong></td>
            <td>18</td>
            <td><span class="badge badge-success">Active</span></td>
          </tr>
          <tr>
            <td><strong>UI/UX Designer</strong></td>
            <td>10</td>
            <td><span class="badge badge-success">Active</span></td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="card rd-quick-actions">
      <h2 class="rd-card-title"><i class="fa-solid fa-bolt"></i> Quick Actions</h2>
      <a href="post-job.jsp" class="rd-action-item">
        <div class="rd-action-icon"><i class="fa-solid fa-plus"></i></div>
        <div><h4>Post New Job</h4><p>Create a new job listing</p></div>
        <i class="fa-solid fa-chevron-right" style="margin-left:auto;color:#ccc;font-size:12px;"></i>
      </a>
      <a href="postedjobs" class="rd-action-item">
        <div class="rd-action-icon"><i class="fa-solid fa-list-ul"></i></div>
        <div><h4>Posted Jobs</h4><p>Manage your listings</p></div>
        <i class="fa-solid fa-chevron-right" style="margin-left:auto;color:#ccc;font-size:12px;"></i>
      </a>
      <a href="shortlistedcandidates" class="rd-action-item">
        <div class="rd-action-icon"><i class="fa-solid fa-star"></i></div>
        <div><h4>Shortlisted</h4><p>Review shortlisted talent</p></div>
        <i class="fa-solid fa-chevron-right" style="margin-left:auto;color:#ccc;font-size:12px;"></i>
      </a>
      <a href="rejectedcandidates" class="rd-action-item">
        <div class="rd-action-icon rd-action-icon-red"><i class="fa-solid fa-circle-xmark"></i></div>
        <div><h4>Rejected</h4><p>Review rejected candidates</p></div>
        <i class="fa-solid fa-chevron-right" style="margin-left:auto;color:#ccc;font-size:12px;"></i>
      </a>
    </div>

  </div>

</div>
</body>
</html>