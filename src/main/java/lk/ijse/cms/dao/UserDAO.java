package lk.ijse.cms.dao;

import jakarta.servlet.ServletContext;
import lk.ijse.cms.model.User;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public static Boolean addUser(ServletContext context, String sql, Object... obj) throws SQLException {
        BasicDataSource dataSource = (BasicDataSource) context.getAttribute("ds");
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        for (int i = 0; i < obj.length; i++) {
            preparedStatement.setObject(i + 1, obj[i]);
        }
        int rowsAffected = preparedStatement.executeUpdate();
        connection.close();
        return rowsAffected > 0;
    }

    public static User findUserByUsername(ServletContext context, String sql, Object... obj) throws SQLException {
        BasicDataSource dataSource = (BasicDataSource) context.getAttribute("ds");
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        for (int i = 0; i < obj.length; i++) {
            preparedStatement.setObject(i + 1, obj[i]);
        }
        ResultSet resultSet = preparedStatement.executeQuery();
        User user = null;
        if (resultSet.next()) {
            System.out.println("User found: " + resultSet.getString("username"));
            user = new User(
                    resultSet.getInt("id"),
                    resultSet.getString("username"),
                    resultSet.getString("password"),
                    resultSet.getString("role"));
        }
        connection.close();
        return user;
    }

    // ✅ Get ALL admin emails from DB
    public static List<String> getAllAdminEmails(ServletContext context) throws SQLException {
        BasicDataSource dataSource = (BasicDataSource) context.getAttribute("ds");
        Connection connection = dataSource.getConnection();
        PreparedStatement ps = connection.prepareStatement(
                "SELECT email FROM users WHERE role = 'ADMIN'");
        ResultSet rs = ps.executeQuery();
        List<String> emails = new ArrayList<>();
        while (rs.next()) {
            emails.add(rs.getString("email"));
        }
        connection.close();
        return emails;
    }

    // ✅ Get student email by username
    public static String getEmailByUsername(ServletContext context, String username) throws SQLException {
        BasicDataSource dataSource = (BasicDataSource) context.getAttribute("ds");
        Connection connection = dataSource.getConnection();
        PreparedStatement ps = connection.prepareStatement(
                "SELECT email FROM users WHERE username = ?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        String email = null;
        if (rs.next()) {
            email = rs.getString("email");
        }
        connection.close();
        return email;
    }
}