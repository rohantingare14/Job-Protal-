<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Applicants Dashboard |SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/view-applicants.css">
</head>
<body>

<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Recruiter Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="recruiter-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="postedjobs" class="active"><i class="fa-solid fa-list-ul"></i> My Jobs</a>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<div class="main-content">
  <div class="topbar">
    <div class="topbar-left">
      <a href="postedjobs" class="va-back-btn"><i class="fa-solid fa-arrow-left"></i></a>
      <div>
        <h1><i class="fa-solid fa-user-group" style="color:#0A66C2;margin-right:8px;"></i>Applicants Dashboard</h1>
        <p class="job-name" style="font-size:13px;color:#666;margin-top:2px;">${job.title}</p>
      </div>
    </div>
    <div class="topbar-right">
      <a href="postedjobs" class="btn btn-secondary btn-sm"><i class="fa-solid fa-arrow-left"></i> Back</a>
    </div>
  </div>

  <div class="count-banner">
    <div class="va-count-icon"><i class="fa-solid fa-users"></i></div>
    <div>
      <div class="count-num">${applicants.size()}</div>
      <div class="count-label">Total Applications</div>
    </div>
  </div>

  <div class="va-content">
    <c:if test="${empty applicants}">
      <div class="empty-state">
        <i class="fa-solid fa-user-slash"></i>
        <h3>No Applicants Yet</h3>
        <p>No one has applied for this job yet. Share the job listing to attract candidates.</p>
      </div>
    </c:if>

    <div class="applicants-container">
      <c:forEach var="user" items="${applicants}">

        <div class="applicant-card">

          <div class="card-header">
            <div class="profile-circle">
              <i class="fa-solid fa-user"></i>
            </div>
            <div style="flex:1;">
              <h2>${user.name}</h2>
              <span class="status badge badge-primary">Applied</span>
            </div>
          </div>

          <div class="card-body">
            <p><i class="fa-solid fa-envelope"></i> ${user.email}</p>
            <p><i class="fa-solid fa-phone"></i> ${user.role}</p>
            <p><i class="fa-solid fa-hashtag"></i> <strong>User ID:</strong> ${user.id}</p>
            <p><i class="fa-solid fa-briefcase"></i> <strong>Job ID:</strong> ${jobId}</p>
          </div>

          <div class="card-actions">
            <a href="recruiterprofile?id=${user.id}" class="profile-btn btn btn-secondary btn-sm">
              View Profile
            </a>
            <a href="shortlistcandidate?userId=${user.id}&amp;jobId=${jobId}" class="shortlist-btn btn btn-success btn-sm">
              <i class="fa-solid fa-check"></i> Shortlist
            </a>
            <a href="rejectcandidate?userId=${user.id}&amp;jobId=${jobId}" class="reject-btn btn btn-danger btn-sm">
              <i class="fa-solid fa-xmark"></i> Reject
            </a>
          </div>

        </div>

      </c:forEach>
    </div>
  </div>
</div>
</body>
</html>