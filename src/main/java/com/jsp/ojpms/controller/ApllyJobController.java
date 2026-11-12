package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.EmailUtil;
import com.jsp.ojpms.util.JPAUtil;
import java.time.LocalDate;

@WebServlet(value = "/applyjob")
public class ApllyJobController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String stringId=req.getParameter("jobId");
		System.out.println("jobId:"+stringId);
		
//		int id = Integer.parseInt(stringId);
		int id = Integer.parseInt(stringId.trim());
		
		HttpSession session = req.getSession();
		User user =(User) session.getAttribute("user");
		
		EntityManager em = JPAUtil.getEm();
		Job job = em.find(Job.class, id);
		
		//for check if deadline passes, users can not able apply.
		if(job.getLastDate() != null && !job.getLastDate().isEmpty()) {
		    LocalDate today = LocalDate.now();
		    LocalDate lastDate = LocalDate.parse(job.getLastDate());
		    if(today.isAfter(lastDate)) {
		        req.setAttribute("errorJobId", id);
		        req.setAttribute("error","APPLICATION CLOSED. LAST DATE WAS "+ job.getLastDate());
		        List<Job> list = JobDao.getAllJobs();
		        req.setAttribute("jobs", list);
		        req.getRequestDispatcher("viewjob.jsp").forward(req, resp);
		        return;
		    }
		
		Application application=new Application();
		application.setJob(job);
		application.setUser(user);
		
		if(ApplicationDao.isAlreadyApplid(user.getId(), job.getId())){
			req.setAttribute("errorJobId", id);
			System.out.println("already applied");
			req.setAttribute("error","ALREADY APPLIED");
			List<Job> list = JobDao.getAllJobs();
			req.setAttribute("jobs",list);
			req.getRequestDispatcher("viewjob.jsp").forward(req, resp);
			
			
		}
		else {
			ApplicationDao.saveApplication(application);
			
			//Job seeker mail....
			String subject ="Application for"+job.getTitle();
			String message="Hello "+user.getName()+",\n \n "+"you have successfully "+"applied for the job: "
			+job.getTitle()+"Location: "+job.getLocation()+"\n \n "+"we will notify you soon"+"\n \n "+"Best Regards \n Portal Team";
			EmailUtil.sendEmail(user.getEmail(), subject, message);
			
			//Recruiter mail
			User recruiter=job.getRecuriter();
			
			String recruiterSubject="New Application for "+job.getTitle();
			String recruiterMessage="Hello, \n \n A new Candidate has Applied"
					+"Name: "+user.getName()+"\n"
					+"Email: "+user.getEmail()+"\n"
					+"Plase login to review...."
					+"Best Regards \n Job Portal Team";
			EmailUtil.sendEmail(job.getRecuriter().getEmail(), recruiterSubject, recruiterMessage);
			resp.sendRedirect("viewjob");//sending request to the controller
		}
		
		
		
		
	}
	
	}
	

}
