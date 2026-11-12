package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.UserDao;
import com.jsp.ojpms.util.PasswordUtil;

@WebServlet("/reset")
public class ForgetPasswordController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		String  encodePass = PasswordUtil.encode(password);
		if(UserDao.UpdatePassword(email, encodePass)) {
			req.setAttribute("msg1", "Password Updated Successfully");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("msg2", "INVALID EMAIL ID..");
			req.getRequestDispatcher("reset.jsp").forward(req, resp);
		}
		
	}
}
