package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.dao.UserDao;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.EmailUtil;

@WebServlet("/scheduleinterview")
public class ScheduleInterviewController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        int userId =
                Integer.parseInt(
                req.getParameter("userId"));

        int jobId =
                Integer.parseInt(
                req.getParameter("jobId"));

        String date =
                req.getParameter("date");

        String time =
                req.getParameter("time");

        String mode =
                req.getParameter("mode");

        User user =
                UserDao.getUserById(userId);

        Job job =
                JobDao.fetchJobById(jobId);

        String subject =
                "Interview Scheduled - "
                + job.getTitle();

        String message =
                "Dear " + user.getName() + ",\n\n"

                + "Congratulations!\n\n"

                + "You have been shortlisted for the position of "

                + job.getTitle()

                + ".\n\n"

                + "Interview Details\n\n"

                + "Date : " + date + "\n"

                + "Time : " + time + "\n"

                + "Mode : " + mode + "\n\n"

                + "Please be available 10 minutes before the scheduled time.\n\n"

                + "Best Wishes,\n"

                + "Recruitment Team\n"

                + "OJPMS";

        EmailUtil.sendEmail(
                user.getEmail(),
                subject,
                message);

        resp.sendRedirect(
                "shortlistedcandidates");
    }
}
