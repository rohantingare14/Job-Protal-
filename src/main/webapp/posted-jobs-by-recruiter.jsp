<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Posted Jobs | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/posted-job-by-recruiter.css">
</head>
<body>

<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Recruiter Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="recruiter-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="post-job.jsp"><i class="fa-solid fa-plus"></i> Post Job</a>
    <a href="postedjobs" class="active"><i class="fa-solid fa-list-ul"></i> Posted Jobs</a>
    <a href="recruiter-profile.jsp"><i class="fa-solid fa-user-tie"></i> Profile</a>
    <a href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
    <div class="nav-divider"></div>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<div class="main-content">
  <div class="topbar">
    <div class="topbar-left">
      <a href="recruiter-dashboard.jsp" class="pjr-back-btn"><i class="fa-solid fa-arrow-left"></i></a>
      <h1><i class="fa-solid fa-briefcase" style="color:#0A66C2;margin-right:8px;font-size:18px;"></i>My Posted Jobs</h1>
    </div>
    <div class="topbar-right">
      <a href="post-job.jsp" class="btn btn-primary btn-sm"><i class="fa-solid fa-plus"></i> Post Job</a>
      <a href="recruiter-dashboard.jsp" class="btn btn-secondary btn-sm">Dashboard</a>
    </div>
  </div>

 
  <div class="count-banner">
    <div class="pjr-count-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div>
      <div class="count-num">${jobs.size()}</div>
      <div class="count-label">Total Jobs Posted</div>
    </div>
    <a href="post-job.jsp" class="btn btn-primary btn-sm" style="margin-left:auto;"><i class="fa-solid fa-plus"></i> Post New Job</a>
  </div>

  
  <div class="pjr-content">
    <c:if test="${empty jobs}">
      <div class="empty-state">
        <i class="fa-solid fa-briefcase-blank"></i>
        <h3>No Jobs Posted Yet</h3>
        <p>Start posting jobs to attract top talent.</p>
        <a href="post-job.jsp" class="btn btn-primary" style="margin-top:16px;"><i class="fa-solid fa-plus"></i> Post First Job</a>
      </div>
    </c:if>

    <div class="jobs-container">
      <c:forEach var="job" items="${jobs}">
        <div class="job-card">

          <div class="job-header">
            <div class="pjr-job-left">
              <div class="pjr-logo"><i class="fa-solid fa-briefcase"></i></div>
              <div>
                <h2>${job.title}</h2>
                <span class="badge badge-success job-status">Active</span>
              </div>
            </div>
          </div>

          <div class="job-body">
            <div class="pjr-meta">
              <span><i class="fa-solid fa-hashtag"></i> ID: ${job.id}</span>
              <span><i class="fa-solid fa-location-dot"></i> ${job.location}</span>
              <span><i class="fa-solid fa-indian-rupee-sign"></i> ${job.salary}</span>
            </div>
            <p class="pjr-desc"><strong>Description:</strong> ${job.description}</p>
          </div>

          <div class="job-actions">
            <a href="fetchjob?id=${job.id}" class="edit-btn btn btn-secondary btn-sm">
              <i class="fa-solid fa-pen"></i> Edit
            </a>
            <a href="deletejob?id=${job.id}" class="delete-btn btn btn-sm"
               onclick="return confirm('Are you sure you want to delete this job?')">
              <i class="fa-solid fa-trash"></i> Delete
            </a>
            <a href="viewapplicants?jobId=${job.id}" class="applicants-btn btn btn-primary btn-sm">
              <i class="fa-solid fa-users"></i> View Applicants
            </a>
          </div>

        </div>
      </c:forEach>
    </div>
  </div>
</div>
</body>
</html>