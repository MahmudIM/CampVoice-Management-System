package lk.ijse.cms.dao;

import jakarta.servlet.ServletContext;
import lk.ijse.cms.model.Complain;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComplainDAO {

    public static List<Complain> getComplains(ServletContext context, String sql, Object... obj) throws SQLException {
        BasicDataSource dataSource = (BasicDataSource) context.getAttribute("ds");

        // DEBUG: See exactly what query is being run in your VS Code terminal
        System.out.println("Executing Query: " + sql);

        try (Connection connection = dataSource.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            if (obj != null) {
                for (int i = 0; i < obj.length; i++) {
                    preparedStatement.setObject(i + 1, obj[i]);
                    System.out.println("Param [" + (i + 1) + "]: " + obj[i]); // DEBUG: See the filter ID
                }
            }

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                List<Complain> complaintList = new ArrayList<>();
                while (resultSet.next()) {
                    Complain complain = new Complain(
                            resultSet.getInt("id"),
                            resultSet.getString("title"),
                            resultSet.getString("description"),
                            resultSet.getString("status"),
                            resultSet.getString("remarks"),
                            resultSet.getString("created_at"),
                            resultSet.getString("studentId"),
                            resultSet.getString("department"),
                            resultSet.getString("course"),
                            resultSet.getString("category"));
                    complaintList.add(complain);
                }
                return complaintList;
            }
        }
    }

    public static Complain getComplainById(ServletContext context, int id) {
        try {
            String sql = "SELECT * FROM complain WHERE id = ?";
            List<Complain> list = getComplains(context, sql, id);
            return (list != null && !list.isEmpty()) ? list.get(0) : null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static int updateAddDeleteComplaint(ServletContext context, String sql, Object... obj) throws SQLException {
        BasicDataSource dataSource = (BasicDataSource) context.getAttribute("ds");
        try (Connection connection = dataSource.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            for (int i = 0; i < obj.length; i++) {
                preparedStatement.setObject(i + 1, obj[i]);
            }
            return preparedStatement.executeUpdate();
        }
    }
}