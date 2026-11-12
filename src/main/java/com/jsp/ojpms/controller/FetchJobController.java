package com.jsp.ojpms.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Job;

@WebServlet("/fetchjob")
public class FetchJobController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req,
			HttpServletResponse resp)
			throws ServletException, IOException {

		int id =
			Integer.parseInt(req.getParameter("id"));

		Job job = JobDao.fetchJobById(id);

		req.setAttribute("job", job);

		req.getRequestDispatcher("edit-job.jsp")
				.forward(req, resp);
	}
}