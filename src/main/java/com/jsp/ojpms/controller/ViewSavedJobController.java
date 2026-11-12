package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.jsp.ojpms.dao.SavedJobDao;
import com.jsp.ojpms.entity.SavedJob;
import com.jsp.ojpms.entity.User;

@WebServlet("/savedjob")
public class ViewSavedJobController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        SavedJobDao dao = new SavedJobDao();

        List<SavedJob> savedJobs =
                SavedJobDao.getSavedJobsByUser(user.getId());

        req.setAttribute("savedJobs", savedJobs);

        req.getRequestDispatcher("savedjob.jsp")
           .forward(req, resp);
    }
}