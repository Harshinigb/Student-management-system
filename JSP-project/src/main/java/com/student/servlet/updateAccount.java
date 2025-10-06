package com.student.servlet;

import java.io.IOException;

import com.student.dao.StudentDAOImpl;
import com.student.dao.StudentDAO;
import com.student.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateAccount")
public class updateAccount extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		StudentDAO sdao = new StudentDAOImpl();
		Student s = (Student) session.getAttribute("student");
		if (s != null) {
			s.setName(req.getParameter("name"));
			s.setPhone(Long.parseLong(req.getParameter("phone")));
			s.setMail(req.getParameter("mail"));
			s.setBranch(req.getParameter("branch"));
			s.setLoc(req.getParameter("loc"));

			if (sdao.updateStudent(s)) {
				req.setAttribute("success", "account updated successfully!");
				RequestDispatcher rd = req.getRequestDispatcher("./dashboard.jsp");
				rd.forward(req, resp);
			} else {
				req.setAttribute("error", "Failed to update the account!");
				RequestDispatcher rd = req.getRequestDispatcher("./dashboard.jsp");
				rd.forward(req, resp);
			}
		}

	}

}
