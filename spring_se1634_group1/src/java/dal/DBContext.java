package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import utilities.GlobalConstants;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author FPT University - PRJ301
 */
public class DBContext {

    public DBContext() {
    }

    private static Connection connection = null;

    static {

        try {
            String user = GlobalConstants.SQL_USERNAME;
            String pass = GlobalConstants.SQL_PASSWORD;
            String url = "jdbc:sqlserver://" + GlobalConstants.SQL_SERVER_NAME + ""
                    + "\\SQLEXPRESS:" + GlobalConstants.SQL_EXPRESS_NAME + ";"
                    + "databaseName=" + GlobalConstants.SQL_DATABASE_NAME;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection connection() {
        return connection;
    }
}
