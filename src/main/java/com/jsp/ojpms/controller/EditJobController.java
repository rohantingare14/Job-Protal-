package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Job;

@WebServlet("/editjobs")
public class EditJobController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp)
			throws ServletException, IOException {

		int id =
			Integer.parseInt(req.getParameter("id"));

		String title =
			req.getParameter("title");

		String location =
			req.getParameter("location");

		double salary =
			Double.parseDouble(req.getParameter("salary"));

		String description =
			req.getParameter("description");

		Job job = JobDao.fetchJobById(id);

		job.setTitle(title);
		job.setLocation(location);
		job.setSalary(salary);
		job.setDescription(description);

		JobDao.updateJob(job);

		resp.sendRedirect("postedjobs");
	}
}