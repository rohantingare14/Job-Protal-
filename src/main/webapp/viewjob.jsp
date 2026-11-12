<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Browse Jobs | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/viewjob.css">
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Job Seeker Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="user-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="viewjob" class="active"><i class="fa-solid fa-briefcase"></i> Browse Jobs</a>
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
      <a href="user-dashboard.jsp" class="back-btn"><i class="fa-solid fa-arrow-left"></i></a>
      <h1>Browse Jobs</h1>
    </div>
    <div class="topbar-right">
      <a href="home.jsp" class="btn btn-secondary btn-sm">Home</a>
      <a href="logout" class="btn btn-secondary btn-sm"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>
  </div>

  <div class="vj-search-section">
    <form action="" class="search-box" method="get">
      <div class="search-bar" style="flex:1;max-width:520px;">
        <i class="fa-solid fa-magnifying-glass"></i>
        <input type="text" name="search" placeholder="Search jobs by title, skill, or keyword...">
      </div>
      <input type="submit" value="Search" class="btn btn-primary">
      <a href="viewjob" class="refresh-btn btn btn-secondary"><i class="fa-solid fa-rotate-right"></i> Refresh</a>
    </form>
    <p class="vj-subtitle">Find the perfect opportunity for your career.</p>
  </div>

  <div class="vj-content">

    <c:if test="${empty jobs}">
      <div class="empty-state">
        <i class="fa-solid fa-briefcase-blank"></i>
        <h3>No Jobs Found</h3>
        <p>Try a different search keyword or check back later.</p>
        <a href="viewjob" class="btn btn-primary" style="margin-top:16px;">View All Jobs</a>
      </div>
    </c:if>

    <div class="vj-grid">
      <c:forEach var="job" items="${jobs}">

        <div class="job-card">

          <div class="job-info">
            <div class="job-card-header">
              <div class="job-logo"><i class="fa-solid fa-building"></i></div>
              <div>
                <h2>${job.title}</h2>
                <p class="job-card-company">Company &bull; Hiring Now</p>
              </div>
            </div>

            <div class="job-card-meta">
              <span><i class="fa-solid fa-location-dot"></i> ${job.location}</span>
              <span><i class="fa-solid fa-indian-rupee-sign"></i> ${job.salary}</span>
              <span><i class="fa-solid fa-calendar-days"></i> Closes: ${job.lastDate}</span>
            </div>

            <p class="job-desc-text">
              <strong>Description:</strong> ${job.description}
            </p>
          </div>

          <div class="job-action">

            <c:set var="today" value="<%= java.time.LocalDate.now() %>" />

            <c:choose>

              <c:when test="${today.toString().compareTo(job.lastDate) <= 0}">

                <div class="job-action-btns">
                  <form action="applyjob" method="post" style="display:inline;">
                    <input type="hidden" name="jobId" value="${job.id}">
                    <input type="submit" value="Apply Now" class="apply-btn">
                  </form>
                  <a href="savejob?jobid=${job.id}" class="save-job-btn">
    					<i class="fa-solid fa-heart"></i> Save Job
				  </a>
                </div>

              </c:when>

              <c:otherwise>
                <div class="closed-job">
                  <i class="fa-solid fa-circle-xmark"></i> Application Closed
                </div>
              </c:otherwise>

            </c:choose>

            <c:if test="${not empty errorJobId and errorJobId == job.id}">
    <p class="error-msg">
        <i class="fa-solid fa-triangle-exclamation"></i> ${error}
    </p>
</c:if>

          </div>

        </div>

      </c:forEach>
    </div>

  </div>

</div>
</body>
</html>