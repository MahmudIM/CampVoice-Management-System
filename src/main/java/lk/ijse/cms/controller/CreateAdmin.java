package lk.ijse.cms.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.cms.dao.UserDAO;
import lk.ijse.cms.util.UserEncryption;

import java.io.IOException;

@WebServlet("/createAdmin")
public class CreateAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            String username = "Admin_Compeng";
            String password = "password123";
            String email = "datasde26@gmail.com";
            String role = "ADMIN";

            String encryptedPassword = UserEncryption.encrypt(password);

            String sql = "INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, ?)";
            boolean success = UserDAO.addUser(getServletContext(), sql, username, encryptedPassword, email, role);

            if (success) {
                resp.getWriter().println("Admin created successfully! Now delete this servlet.");
            } else {
                resp.getWriter().println("Failed. User might already exist.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}