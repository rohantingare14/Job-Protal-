<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Job | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/edit-job.css">
</head>
<body>

<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Recruiter Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="recruiter-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="recruiter-profile.jsp"><i class="fa-solid fa-user-tie"></i> Profile</a>
    <a href="postedjobs" class="active"><i class="fa-solid fa-list-ul"></i> My Jobs</a>
    <a href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
    <div class="nav-divider"></div>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<div class="main-content">
  <div class="topbar">
    <div class="topbar-left">
      <h1>Edit Job</h1>
    </div>
    <div class="topbar-right">
      <a href="postedjobs" class="btn btn-secondary btn-sm"><i class="fa-solid fa-arrow-left"></i> Back</a>
    </div>
  </div>

  <div class="ej-page-header">
    <div>
      <h2 class="ej-page-title"><i class="fa-solid fa-pen"></i> Edit Job</h2>
      <p style="color:#666;font-size:13.5px;">Update your posted job information.</p>
    </div>
    <a href="postedjobs" class="btn btn-secondary btn-sm back-btn">
      <i class="fa-solid fa-arrow-left"></i> Back
    </a>
  </div>

  <div class="ej-container">

    <!-- LEFT: JOB INFO CARD -->
    <div class="ej-profile-card">
      <div class="ej-job-circle"><i class="fa-solid fa-briefcase"></i></div>
      <h2>${job.title}</h2>
      <span class="badge badge-primary">JOB DETAILS</span>
      <p style="font-size:13px;color:#666;line-height:1.6;margin-top:12px;text-align:center;">
        Update your posted job information and keep it accurate for applicants.
      </p>
    </div>

    <!-- RIGHT: FORM CARD -->
    <div class="ej-form-card">
      <h3 class="ej-form-title"><i class="fa-solid fa-pen-to-square"></i> Update Job Details</h3>

      <form action="editjobs" method="post">

        <input type="hidden" name="id" value="${job.id}">

        <div class="form-group">
          <label for="ejTitle">Job Title</label>
          <input type="text" id="ejTitle" name="title" value="${job.title}" required>
        </div>

        <div class="form-group">
          <label for="ejLocation">Location</label>
          <input type="text" id="ejLocation" name="location" value="${job.location}" required>
        </div>

        <div class="form-group">
          <label for="ejSalary">Salary</label>
          <input type="text" id="ejSalary" name="salary" value="${job.salary}" required>
        </div>

        <div class="form-group">
          <label for="ejDesc">Description</label>
          <textarea id="ejDesc" name="description" rows="5" required>${job.description}</textarea>
        </div>

        <button type="submit" class="ej-submit-btn">
          <i class="fa-solid fa-floppy-disk"></i> Update Job
        </button>

      </form>
    </div>

  </div>
</div>
</body>
</html>