package lk.ijse.cms.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.ijse.cms.model.Complain;
import lk.ijse.cms.dao.ComplainDAO;
import lk.ijse.cms.model.StatusCount;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet({ "/dashboard", "/" })
public class Dashboard extends HttpServlet {

    public void deleteComplaint(String complainID, ServletContext context) throws SQLException {
        String sql = "DELETE FROM complain WHERE id = ?";
        ComplainDAO.updateAddDeleteComplaint(context, sql, Integer.parseInt(complainID));
    }

    public StatusCount getComplaintStatusCount(List<Complain> complaintList) {
        int pendingCount = 0;
        int resolvedCount = 0;
        int inProgressCount = 0;
        int totalCount = complaintList.size();

        for (Complain complain : complaintList) {
            if (complain.getStatus() != null) {
                String status = complain.getStatus().toUpperCase().replace(" ", "_");
                switch (status) {
                    case "PENDING":
                        pendingCount++;
                        break;
                    case "RESOLVED":
                        resolvedCount++;
                        break;
                    case "IN_PROGRESS":
                        inProgressCount++;
                        break;
                }
            }
        }
        return new StatusCount(pendingCount, resolvedCount, inProgressCount, totalCount);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        // 1. Authentication Check: Is the user logged in?
        if (session == null || session.getAttribute("user") == null || session.getAttribute("role") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String complainID = req.getParameter("complainID");
        String role = (String) session.getAttribute("role");
        String userID = (String) session.getAttribute("user");
        ServletContext context = getServletContext();

        try {
            // 2. Handle Deletion logic
            if (complainID != null && !complainID.isEmpty()) {
                deleteComplaint(complainID, context);
                req.setAttribute("message", "Complaint deleted successfully.");
            }

            List<Complain> complaintList;

            // 3. SECURE ROLE-BASED ROUTING
            if ("ADMIN".equals(role)) {
                // ADMIN sees every "Voice" on campus
                complaintList = ComplainDAO.getComplains(context, "SELECT * FROM complain ORDER BY created_at DESC");
                req.setAttribute("complaintList", complaintList);
                req.setAttribute("statusCount", getComplaintStatusCount(complaintList));

                // Securely forward to the Admin area
                req.getRequestDispatcher("/admin/dashboard.jsp").forward(req, resp);

            } else if ("STUDENT".equals(role)) {
                // STUDENT sees only THEIR records
                String sql = "SELECT * FROM complain WHERE studentId = ? ORDER BY created_at DESC";
                complaintList = ComplainDAO.getComplains(context, sql, userID);

                req.setAttribute("complaintList", complaintList);
                req.setAttribute("statusCount", getComplaintStatusCount(complaintList));

                // Securely forward to the Student area
                req.getRequestDispatcher("/user/dashboard.jsp").forward(req, resp);

            } else {
                // FALLBACK: If role is unrecognized, force logout for security
                session.invalidate();
                resp.sendRedirect("login.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error in Dashboard processing", e);
        }
    }
}