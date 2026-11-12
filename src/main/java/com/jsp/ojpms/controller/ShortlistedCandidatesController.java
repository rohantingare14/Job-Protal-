package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.entity.Application;

@WebServlet("/shortlistedcandidates")
public class ShortlistedCandidatesController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        List<Application> shortlisted =
                ApplicationDao.getShortlistedCandidates();

        req.setAttribute("shortlisted", shortlisted);

        req.getRequestDispatcher(
                "shortlisted-candidates.jsp")
                .forward(req, resp);
    }
} 	