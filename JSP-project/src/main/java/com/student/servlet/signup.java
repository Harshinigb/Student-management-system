package com.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.student.dao.StudentDAO;
import com.student.dao.StudentDAOImpl;
import com.student.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class signup extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Student s = new Student();
		StudentDAO sdao = new StudentDAOImpl();
//		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html");

		s.setName(req.getParameter("name"));
		s.setPhone(Long.parseLong(req.getParameter("phone")));
		s.setMail(req.getParameter("mail"));
		s.setBranch(req.getParameter("branch"));
		s.setLoc(req.getParameter("loc"));
		if (req.getParameter("password").equals(req.getParameter("confirm"))) {
			s.setPassword(req.getParameter("password"));
			if (sdao.insertStudent(s)) {
//				out.println("<h2>Data saved successfully!</h2>");
				
				req.setAttribute("success", "Data saved successfully!");
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			} else {
//				out.println("<h2>failed to save the data!</h2>");
				
				req.setAttribute("error", "Failed to save the data!");
				RequestDispatcher rd = req.getRequestDispatcher("Signup.jsp");
				rd.forward(req, resp);
			}

		} else {
//			out.println("<h2>Password mismatched!</h2>");
			req.setAttribute("error", "password mismatched!");
			RequestDispatcher rd = req.getRequestDispatcher("Signup.jsp");
			rd.forward(req, resp);
		}

	}

}
