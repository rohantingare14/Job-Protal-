package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.User;
@WebServlet("/viewapplicants")
public class ViewApplicantsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException, IOException {
        int jobId =Integer.parseInt(req.getParameter("jobId"));
        System.out.println(jobId);
        List<Application> applications =ApplicationDao.getApplicationsByJob(jobId);
        List<User> applicants =new ArrayList<>();
        for(Application app : applications) {
            applicants.add(app.getUser());
        }
        req.setAttribute("applicants",applicants);
        req.setAttribute("jobId", jobId);
        req.getRequestDispatcher("view-applicants.jsp").forward(req, resp);
    }
}