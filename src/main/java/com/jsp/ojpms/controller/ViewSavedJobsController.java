package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.dao.SavedJobDao;
import com.jsp.ojpms.entity.SavedJob;
import com.jsp.ojpms.entity.User;

@WebServlet("/viewjobs")
public class ViewSavedJobsController extends HttpServlet {

    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("user");

        System.out.println("User from session = " + user);

        if(user != null) {
            System.out.println("User Id = " + user.getId());
        }

        List<SavedJob> list =
                SavedJobDao.getSavedJobsByUser(user.getId());

        System.out.println("Saved Jobs Count = " + list.size());

        req.setAttribute("savedJobs", list);

        req.getRequestDispatcher("saved-jobs.jsp")
                .forward(req, resp);
        
    }
    
}