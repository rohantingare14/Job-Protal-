<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saved Jobs | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/savejob.css">
</head>
<body>

<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Job Seeker Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="user-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="viewjob"><i class="fa-solid fa-briefcase"></i> Browse Jobs</a>
    <a href="savedjob" class="active"><i class="fa-solid fa-heart"></i> Saved Jobs</a>
    <a href="myapplications"><i class="fa-solid fa-file-lines"></i> My Applications</a>
    <a href="profile.jsp"><i class="fa-solid fa-user"></i> Profile</a>
    <div class="nav-divider"></div>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<div class="main-content">

  <div class="topbar">
    <div class="topbar-left">
      <a href="user-dashboard.jsp" class="sj-back-btn"><i class="fa-solid fa-arrow-left"></i></a>
      <h1>Saved Jobs</h1>
    </div>
    <div class="topbar-right">
      <a href="viewjob" class="btn btn-primary btn-sm"><i class="fa-solid fa-briefcase"></i> Browse More</a>
      <a href="logout" class="btn btn-secondary btn-sm"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>
  </div>

  <!-- COUNT BANNER -->
  <div class="count-banner">
    <div class="sj-heart-icon"><i class="fa-solid fa-heart"></i></div>
    <div>
      <div class="count-num">${savedJobs.size()}</div>
      <div class="count-label">Saved Jobs</div>
    </div>
  </div>

  <%-- <p style="display:none;">Saved Jobs Object: ${savedJobs}</p> --%>

  <div class="sj-content">

    <c:if test="${empty savedJobs}">
      <div class="empty-state">
        <i class="fa-solid fa-heart-crack"></i>
        <h3>No Saved Jobs Yet</h3>
        <p>Start browsing jobs and save the ones you like.</p>
        <a href="viewjob" class="btn btn-primary" style="margin-top:16px;">Browse Jobs</a>
      </div>
    </c:if>

    <div class="sj-grid">
      <c:forEach var="s" items="${savedJobs}">
        <div class="sj-card">
          <div class="sj-card-left">
            <div class="sj-logo"><i class="fa-solid fa-building"></i></div>
            <div class="sj-info">
              <h3>${s.job.title}</h3>
              <div class="sj-meta">
                <span><i class="fa-solid fa-location-dot"></i> ${s.job.location}</span>
                <span><i class="fa-solid fa-indian-rupee-sign"></i> ${s.job.salary}</span>
              </div>
            </div>
          </div>
          <div class="sj-actions">
            <a href="viewjob" class="btn btn-primary btn-sm">Apply Now</a>
          </div>
        </div>
      </c:forEach>
    </div>

  </div>

</div>
</body>
</html>