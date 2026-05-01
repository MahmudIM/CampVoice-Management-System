package lk.ijse.cms.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.ijse.cms.dao.ComplainDAO;
import lk.ijse.cms.dao.UserDAO;
import lk.ijse.cms.model.Complain;
import lk.ijse.cms.util.EmailService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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

        // ✅ DEBUG LINES
        System.out.println("=== AddComplaint DEBUG ===");
        System.out.println("User:       " + loggedInUser);
        System.out.println("Role:       " + role);
        System.out.println("ComplainID: " + complainID);
        System.out.println("Status:     " + status);
        System.out.println("Subject:    " + subject);
        System.out.println("==========================");

        try {
            int rowsAffected = 0;

            if (complainID != null && !complainID.isEmpty()) {

                if ("ADMIN".equals(role)) {
                    // ✅ Admin updating complaint
                    System.out.println("DEBUG: Admin updating complaint ID: " + complainID);
                    String sql = "UPDATE complain SET status=?, remarks=? WHERE id=?";
                    rowsAffected = ComplainDAO.updateAddDeleteComplaint(context, sql,
                            status, remark, Integer.parseInt(complainID));

                    System.out.println("DEBUG: Rows affected: " + rowsAffected);

                    if (rowsAffected > 0) {
                        Complain complaint = ComplainDAO.getComplainById(
                                context, Integer.parseInt(complainID));

                        if (complaint != null) {
                            System.out.println("DEBUG: Student ID: " + complaint.getStudentId());

                            String studentEmail = UserDAO.getEmailByUsername(
                                    context, complaint.getStudentId());

                            System.out.println("DEBUG: Student email: " + studentEmail);

                            if (studentEmail != null && !studentEmail.isEmpty()) {
                                System.out.println("DEBUG: Sending email to student...");
                                EmailService.notifyStudentResolution(
                                        studentEmail,
                                        complaint.getStudentId(),
                                        complaint.getTitle(),
                                        status,
                                        remark);
                            } else {
                                System.out.println("DEBUG: Student email is NULL or empty!");
                            }
                        } else {
                            System.out.println("DEBUG: Complaint is NULL!");
                        }
                    }

                } else {
                    // ✅ Student updating their own complaint
                    System.out.println("DEBUG: Student updating complaint ID: " + complainID);
                    String sql = "UPDATE complain SET title=?, description=?, department=?, course=? WHERE id=?";
                    rowsAffected = ComplainDAO.updateAddDeleteComplaint(context, sql,
                            subject, description, department, course,
                            Integer.parseInt(complainID));
                }

            } else {
                // ✅ New complaint submitted by student
                System.out.println("DEBUG: New complaint being submitted by: " + loggedInUser);
                String sql = "INSERT INTO complain (title, description, status, created_at, " +
                        "studentId, department, course, category) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                rowsAffected = ComplainDAO.updateAddDeleteComplaint(context, sql,
                        subject, description, status, incidentDate,
                        loggedInUser, department, course, category);

                System.out.println("DEBUG: Rows affected: " + rowsAffected);

                if (rowsAffected > 0) {
                    List<String> adminEmails = UserDAO.getAllAdminEmails(context);
                    System.out.println("DEBUG: Admin emails found: " + adminEmails);

                    if (adminEmails != null && !adminEmails.isEmpty()) {
                        System.out.println("DEBUG: Sending email to admins...");
                        EmailService.notifyAdminNewComplaint(
                                adminEmails,
                                loggedInUser,
                                subject,
                                description);
                    } else {
                        System.out.println("DEBUG: No admin emails found in DB!");
                    }
                }
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

        String complainID = req.getParameter("complainID");

        if (complainID != null && !complainID.isEmpty()) {
            Complain complain = ComplainDAO.getComplainById(
                    getServletContext(), Integer.parseInt(complainID));
            req.setAttribute("complain", complain);
        }

        req.getRequestDispatcher("/addComplaint.jsp").forward(req, resp);
    }
}