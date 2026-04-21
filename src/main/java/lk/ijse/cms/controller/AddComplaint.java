package lk.ijse.cms.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.ijse.cms.dao.ComplainDAO;
import lk.ijse.cms.model.Complain;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addComplaint")
public class AddComplaint extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context = getServletContext();
        HttpSession session = req.getSession(false);

        // 1. Authentication Check
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String loggedInUser = (String) session.getAttribute("user");
        String role = (String) session.getAttribute("role");

        // 2. Form Parameters
        String department = req.getParameter("department");
        String course = req.getParameter("course");
        String category = req.getParameter("category");
        String subject = req.getParameter("subject");
        String description = req.getParameter("description");
        String remark = req.getParameter("remark");
        String status = req.getParameter("status") == null ? "PENDING"
                : req.getParameter("status").toUpperCase().trim();
        String incidentDate = req.getParameter("incidentDate");
        String complainID = req.getParameter("complainID");

        try {
            int rowsAffected = 0;

            if (complainID != null && !complainID.isEmpty()) {
                if ("ADMIN".equals(role)) {
                    // Admin Update Logic
                    String sql = "UPDATE complain SET status=?, remarks=? WHERE id=?";
                    rowsAffected = ComplainDAO.updateAddDeleteComplaint(context, sql, status, remark,
                            Integer.parseInt(complainID));
                } else {
                    // Student Update Logic
                    String sql = "UPDATE complain SET title=?, description=?, department=?, course=? WHERE id=?";
                    rowsAffected = ComplainDAO.updateAddDeleteComplaint(context, sql, subject, description, department,
                            course, Integer.parseInt(complainID));
                }
            } else {
                // New Complaint Logic
                String sql = "INSERT INTO complain (title, description, status, created_at, studentId, department, course, category) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                rowsAffected = ComplainDAO.updateAddDeleteComplaint(context, sql,
                        subject, description, status, incidentDate, loggedInUser, department, course, category);
            }

            if (rowsAffected > 0) {
                session.setAttribute("message", "Complaint processed successfully!");
            }
            resp.sendRedirect(req.getContextPath() + "/dashboard");

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String role = (String) session.getAttribute("role");
        String complainID = req.getParameter("complainID");

        if (complainID != null && !complainID.isEmpty()) {
            Complain complain = ComplainDAO.getComplainById(getServletContext(), Integer.parseInt(complainID));
            req.setAttribute("complain", complain);
        }

        // 🛡️ THE FIX: Match your root folder location
        // We use the root path since addComplaint.jsp is not in the /user/ folder
        if ("ADMIN".equals(role)) {
            // If you have a separate admin edit page, use that path,
            // otherwise route back to the root file
            req.getRequestDispatcher("/addComplaint.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/addComplaint.jsp").forward(req, resp);
        }
    }
}