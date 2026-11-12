package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;


@WebServlet("/postedjobs")
public class PostedJobsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User recruiter = (User) session.getAttribute("user");

        if (recruiter == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Job> jobs = JobDao.getJobsByRecruiter(recruiter.getId());

        request.setAttribute("jobs", jobs);

        request.getRequestDispatcher("posted-jobs-by-recruiter.jsp")
               .forward(request, response);
    }
}