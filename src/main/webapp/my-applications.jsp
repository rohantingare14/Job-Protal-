<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Applications | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/my-applications.css">
</head>

<body>
<%
if(session.getAttribute("user")==null)
    response.sendRedirect("login.jsp");
%>


<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Job Seeker Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="user-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="viewjob"><i class="fa-solid fa-briefcase"></i> Browse Jobs</a>
    <a href="savedjob"><i class="fa-solid fa-heart"></i> Saved Jobs</a>
    <a href="myapplications" class="active"><i class="fa-solid fa-file-lines"></i> My Applications</a>
    <a href="profile.jsp"><i class="fa-solid fa-user"></i> Profile</a>
    <div class="nav-divider"></div>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>


<div class="main-content">

 
  <div class="topbar">
    <div class="topbar-left">
      <a href="user-dashboard.jsp" class="ma-back-btn"><i class="fa-solid fa-arrow-left"></i></a>
      <h1>My Applications</h1>
    </div>
    <div class="topbar-right">
      <a href="logout" class="btn btn-secondary btn-sm"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>
  </div>

  
  <div class="stats-grid">
    <div class="stat-card">
      <i class="fa-solid fa-file-circle-check stat-icon"></i>
      <div class="stat-number">${totalApplications}</div>
      <div class="stat-label">Total Applications</div>
    </div>
    <div class="stat-card">
      <i class="fa-solid fa-briefcase stat-icon"></i>
      <div class="stat-number">${totalApplications}</div>
      <div class="stat-label">Applied Jobs</div>
    </div>
  </div>

  
  <div style="padding: 0 28px 28px;">
    <div class="table-wrapper">
      <div class="table-title">
        <h2><i class="fa-solid fa-list" style="color:#0A66C2;margin-right:8px;"></i>Applied Jobs</h2>
      </div>

      <c:if test="${empty applications}">
        <div class="empty-state">
          <i class="fa-solid fa-file-circle-xmark"></i>
          <h3>No Applications Yet</h3>
          <p>You haven't applied to any jobs. Start browsing!</p>
          <a href="viewjob" class="btn btn-primary" style="margin-top:16px;">Browse Jobs</a>
        </div>
      </c:if>

      <c:if test="${not empty applications}">
        <table class="data-table">
          <thead>
            <tr>
              <th>Job ID</th>
              <th>Job Title</th>
              <th>Location</th>
              <th>Salary</th>
              <th>Description</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${applications}" var="app">
              <tr>
                <td>${app.job.id}</td>
                <td><strong>${app.job.title}</strong></td>
                <td><i class="fa-solid fa-location-dot" style="color:#0A66C2;margin-right:5px;"></i>${app.job.location}</td>
                <td><i class="fa-solid fa-indian-rupee-sign" style="color:#057642;margin-right:4px;"></i>${app.job.salary}</td>
                <td class="ma-desc">${app.job.description}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>

    </div>
  </div>

</div>
</body>
</html>