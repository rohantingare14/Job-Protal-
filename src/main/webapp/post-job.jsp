<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Post Job | OJPMS</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/post-job.css">
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
    <a href="recruiter-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="post-job.jsp" class="active"><i class="fa-solid fa-plus"></i> Post Job</a>
    <a href="postedjobs"><i class="fa-solid fa-list-ul"></i> Posted Jobs</a>
    <a href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
    <div class="nav-divider"></div>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<div class="main-content">
  <div class="topbar">
    <div class="topbar-left">
      <h1>Post a New Job</h1>
    </div>
    <div class="topbar-right">
      <a href="recruiter-dashboard.jsp" class="btn btn-secondary btn-sm"><i class="fa-solid fa-arrow-left"></i> Dashboard</a>
      <a href="logout" class="btn btn-secondary btn-sm"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>
  </div>

  <div class="stats-grid">
    <div class="stat-card">
      <i class="fa-solid fa-users stat-icon"></i>
      <div class="stat-number">500+</div>
      <div class="stat-label">Active Candidates</div>
    </div>
    <div class="stat-card">
      <i class="fa-solid fa-briefcase stat-icon"></i>
      <div class="stat-number">120+</div>
      <div class="stat-label">Jobs Posted</div>
    </div>
    <div class="stat-card">
      <i class="fa-solid fa-trophy stat-icon"></i>
      <div class="stat-number">95%</div>
      <div class="stat-label">Hiring Success</div>
    </div>
  </div>

  <div class="pj-form-section">

    <div class="pj-info-panel">
      <h2>Hire Smarter</h2>
      <p>Create attractive job postings and connect with top talent from across the country.</p>
      <div class="pj-info-points">
        <div class="pj-point"><i class="fa-solid fa-circle-check"></i> Reach 10,000+ candidates</div>
        <div class="pj-point"><i class="fa-solid fa-circle-check"></i> Instant applications</div>
        <div class="pj-point"><i class="fa-solid fa-circle-check"></i> Easy candidate management</div>
        <div class="pj-point"><i class="fa-solid fa-circle-check"></i> Schedule interviews directly</div>
      </div>
      <div class="pj-icon-area">
        <i class="fa-solid fa-user-tie"></i>
      </div>
    </div>

    <div class="pj-form-card">
      <h3 class="pj-form-title"><i class="fa-solid fa-pen-to-square"></i> Job Details</h3>

      <form action="postjob" method="post">

        <div class="form-group">
          <label for="pjTitle">Job Title</label>
          <input type="text" id="pjTitle" name="title" placeholder="e.g. Senior Java Developer" required>
        </div>

        <div class="form-group">
          <label for="pjLocation">Location</label>
          <input type="text" id="pjLocation" name="location" placeholder="e.g. Pune, Maharashtra" required>
        </div>

        <div class="pj-two-col">
          <div class="form-group">
            <label for="pjSalary">Salary (₹ per annum)</label>
            <input type="number" id="pjSalary" name="salary" placeholder="e.g. 800000" required>
          </div>
          <div class="form-group">
            <label for="pjLastDate">Last Date to Apply</label>
            <input type="date" id="pjLastDate" name="lastDate" required>
          </div>
        </div>

        <div class="form-group">
          <label for="pjDesc">Job Description</label>
          <textarea id="pjDesc" name="description" rows="6" placeholder="Describe the role, responsibilities, and requirements..." required></textarea>
        </div>

        <button type="submit" class="pj-submit-btn">
          <i class="fa-solid fa-paper-plane"></i> POST JOB
        </button>

      </form>
    </div>

  </div>
</div>
</body>
</html>