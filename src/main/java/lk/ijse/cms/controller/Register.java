package lk.ijse.cms.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.cms.dao.UserDAO;
import lk.ijse.cms.util.UserEncryption;

import java.io.IOException;

@WebServlet("/register")
public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String password2 = req.getParameter("password2");
        String email = req.getParameter("email");
        String role = req.getParameter("role");

        // 1. Validate Username (ABU Student ID Pattern: U19CO1*** to U25CO2***)
        // ✅ FIXED: case-insensitive flag (?i), and \d{3} to match e.g. U23CO1010
        String idPattern = "^(?i)[uU](19|2[0-5])[cC][oO][1-2]\\d{3}$";
        if (username == null || !username.matches(idPattern)) {
            req.setAttribute("errorMessage", "Invalid Student ID! Format must be like U23CO1010.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // 2. Validate Email
        if (email == null || email.isEmpty() || !email.contains("@")) {
            req.setAttribute("errorMessage", "A valid University Email is required.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // 3. Password Match Check
        if (!password.equals(password2)) {
            req.setAttribute("errorMessage", "Passwords do not match.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        try {
            String encryptedPassword = UserEncryption.encrypt(password);

            String sql = "INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, ?)";

            if (UserDAO.addUser(getServletContext(), sql, username, encryptedPassword, email, role)) {
                resp.sendRedirect(req.getContextPath() + "/login.jsp?success=1");
            } else {
                req.setAttribute("errorMessage", "Failed to register user. ID might already exist.");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}