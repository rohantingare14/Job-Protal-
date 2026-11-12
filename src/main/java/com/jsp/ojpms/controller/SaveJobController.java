package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.jsp.ojpms.dao.*;
import com.jsp.ojpms.entity.*;

@WebServlet("/savejob")
public class SaveJobController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

    	String jobIdStr = req.getParameter("jobid");

    	System.out.println("jobid = " + jobIdStr);

    	if(jobIdStr == null || jobIdStr.isEmpty()) {
    	    resp.getWriter().println("jobid parameter missing");
    	    return;
    	}

    	int jobId = Integer.parseInt(jobIdStr);

        HttpSession session = req.getSession();

        User user =
                (User) session.getAttribute("user");

        SavedJobDao savedDao = new SavedJobDao();

        if (!savedDao.isAlreadySaved(user.getId(), jobId)) {

            JobDao jobDao = new JobDao();

            Job job = jobDao.fetchJobById(jobId);

            SavedJob savedJob = new SavedJob();

            savedJob.setUser(user);
            savedJob.setJob(job);

            savedDao.saveJob(savedJob);
        }

        resp.sendRedirect("viewjob");
    }
}