package lk.ijse.cms.db;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.SQLException;

@WebListener
public class DataSource implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");

        // ✅ Try Railway environment variables first
        String dbUrl = System.getenv("MYSQL_URL");
        String dbUser = System.getenv("MYSQL_USER");
        String dbPassword = System.getenv("MYSQL_PASSWORD");

        if (dbUrl != null && !dbUrl.isEmpty()) {
            // ✅ Running on Railway
            System.out.println("✅ DB config loaded from Railway environment.");
            ds.setUrl(dbUrl);
            ds.setUsername(dbUser);
            ds.setPassword(dbPassword);
        } else {
            // ✅ Running locally
            System.out.println("✅ DB config loaded from local settings.");
            ds.setUrl("jdbc:mysql://localhost:3306/CMS");
            ds.setUsername("root");
            ds.setPassword("Mysql");
        }

        ds.setInitialSize(5);
        ds.setMaxTotal(10);
        ds.setMinIdle(2);
        ds.setMaxIdle(5);
        ds.setMaxWaitMillis(10000);
        ds.setTestOnBorrow(true);
        ds.setValidationQuery("SELECT 1");

        ServletContext sc = sce.getServletContext();
        sc.setAttribute("ds", ds);
        System.out.println("✅ Database connection pool initialized.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            ServletContext sc = sce.getServletContext();
            BasicDataSource ds = (BasicDataSource) sc.getAttribute("ds");
            if (ds != null) {
                ds.close();
                System.out.println("✅ Database connection pool closed.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}