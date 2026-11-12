package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.entity.Application;

@WebServlet("/rejectcandidate")
public class RejectCandidateController extends HttpServlet {

    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        int userId =
                Integer.parseInt(req.getParameter("userId"));

        int jobId =
                Integer.parseInt(req.getParameter("jobId"));

        Application app =
                ApplicationDao.getApplication(userId, jobId);

        app.setStatus("REJECTED");

        ApplicationDao.updateApplication(app);

        resp.sendRedirect(
                "viewapplicants?jobId=" + jobId);
    }
}
