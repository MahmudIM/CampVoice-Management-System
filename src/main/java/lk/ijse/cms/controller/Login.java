package lk.ijse.cms.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.cms.dao.UserDAO;
import lk.ijse.cms.model.User;
import lk.ijse.cms.util.UserEncryption;

import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Basic validation for empty fields
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            req.setAttribute("errorMessage", "Please enter both username and password.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        try {
            String sql = "SELECT * FROM users WHERE username = ?";
            User user = UserDAO.findUserByUsername(getServletContext(), sql, username);

            if (user == null || !UserEncryption.decrypt(password, user.getPassword())) {
                req.setAttribute("errorMessage", "Invalid username or password.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
                return;
            }

            // Valid login — store session
            HttpSession session = req.getSession();
            session.setAttribute("user", user.getUsername());
            session.setAttribute("role", user.getRole());

            // ✅ FIXED: Both ADMIN and STUDENT go through Dashboard servlet
            // Dashboard.java handles role-based routing automatically
            resp.sendRedirect(req.getContextPath() + "/dashboard");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Login processing error", e);
        }
    }
}