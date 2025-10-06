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

@WebServlet("/forgot-password")
public class passwordreset extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudentDAO sdao = new StudentDAOImpl();
//		PrintWriter out = resp.getWriter();
		Student s = sdao.getStudent(Long.parseLong(req.getParameter("phone")), req.getParameter("mail"));

		if (s != null) {
			if (req.getParameter("password").equals(req.getParameter("confirm"))) {
				if (s.getPassword() != null && s.getPassword().equals(req.getParameter("password"))) {
//					out.println("<h2>This password already been used!</h2>");
					
					req.setAttribute("error", "This password already been used!");
					RequestDispatcher rd = req.getRequestDispatcher("forgot-password.jsp");
					rd.forward(req, resp);
					
				} else {
					s.setPassword(req.getParameter("password"));
					if (sdao.updateStudent(s)) {
//						out.println("<h1>Password changed successfully!</h1>");
						
						
						req.setAttribute("success", "Password changed successfully!");
						RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
						rd.forward(req, resp);
						
					} else {
//						out.println("<h1>Failed to update password !</h1>");
						
						req.setAttribute("error", "Failed to update the password!");
						RequestDispatcher rd = req.getRequestDispatcher("forgot-password.jsp");
						rd.forward(req, resp);
					}

				}
			} else {
//				out.println("<h1>Password mismatched!</h1>");
				
				req.setAttribute("error", "Password mismatched!");
				RequestDispatcher rd = req.getRequestDispatcher("forgot-password.jsp");
				rd.forward(req, resp);
			}
		} else {
//			out.println("<h1>failed to update the password!</h1>");
			req.setAttribute("error", "Failed to update the password!");
			RequestDispatcher rd = req.getRequestDispatcher("forgot-password.jsp");
			rd.forward(req, resp);
		}

	}

}
