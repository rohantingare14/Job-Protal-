<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Rejected Candidates | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/rejected-candidates.css">
</head>
<body>

<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Recruiter Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="recruiter-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="postedjobs"><i class="fa-solid fa-list-ul"></i> My Jobs</a>
    <a href="shortlistedcandidates"><i class="fa-solid fa-star"></i> Shortlisted</a>
    <a href="rejectedcandidates" class="active"><i class="fa-solid fa-circle-xmark"></i> Rejected</a>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<div class="main-content">
  <div class="topbar">
    <div class="topbar-left">
      <h1><i class="fa-solid fa-circle-xmark" style="color:#CC1016;margin-right:8px;"></i> Rejected Candidates</h1>
    </div>
    <div class="topbar-right">
      <a href="recruiter-dashboard.jsp" class="btn btn-secondary btn-sm">Dashboard</a>
    </div>
  </div>

  <div class="count-banner">
    <div class="rj-count-icon"><i class="fa-solid fa-circle-xmark"></i></div>
    <div>
      <div class="count-num">${rejected.size()}</div>
      <div class="count-label">Rejected Candidates</div>
    </div>
  </div>

  <div class="rj-content">
    <c:if test="${empty rejected}">
      <div class="empty-state">
        <i class="fa-solid fa-circle-xmark"></i>
        <h3>No Rejected Candidates</h3>
        <p>No candidates have been rejected yet.</p>
      </div>
    </c:if>

    <div class="candidate-container">
      <c:forEach var="app" items="${rejected}">

        <div class="candidate-card">

          <div class="card-header">
            <div class="avatar">
              <i class="fa-solid fa-user"></i>
            </div>
            <div style="flex:1;">
              <h2>${app.user.name}</h2>
              <span class="rejected-status">&#x274C; REJECTED</span>
            </div>
          </div>

          <div class="card-body">
            <p><i class="fa-solid fa-envelope"></i> ${app.user.email}</p>
            <p><i class="fa-solid fa-briefcase"></i> ${app.job.title}</p>
            <p><i class="fa-solid fa-location-dot"></i> ${app.job.location}</p>
          </div>

          <div class="card-actions">
            <a href="recruiterprofile?id=${app.user.id}" class="profile-btn btn btn-secondary btn-sm">
              View Profile
            </a>
            <a href="shortlistcandidate?userId=${app.user.id}&amp;jobId=${app.job.id}" class="restore-btn btn btn-success btn-sm">
              <i class="fa-solid fa-rotate-left"></i> Move To Shortlist
            </a>
          </div>

        </div>

      </c:forEach>
    </div>
  </div>
</div>
</body>
</html>