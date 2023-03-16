/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entities.Configuration;
import entities.Debt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import utilities.GlobalConstants;

/**
 *
 * @author nvash
 */
public class ConfigurationDao extends DBContext {

    public List<Configuration> getConfiguList(int index, int pageSize, String sortField,
            String sortOrder, String idFrom, String idTo, String filterKey, String filterValue, String createdFrom, String createdTo, String updatedFrom, String updatedTo) {
        List<Configuration> configList = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = connection();
            String sql = "SELECT * FROM Configuration WHERE 1=1";
            if (!idFrom.isEmpty()) {
                sql += " AND (ID >= ?)";
            }
            if (!idTo.isEmpty()) {
                sql += " AND (ID <= ?)";
            }
            if (!filterKey.isEmpty()) {
                sql += " AND ([Key] LIKE '%' + ? + '%')";
            }
            if (!filterValue.isEmpty()) {
                sql += " AND ([Value] LIKE '%' + ? + '%')";
            }
            if (!createdFrom.isEmpty()) {
                sql += " AND (CreatedAt >= ?)";
            }
            if (!createdTo.isEmpty()) {
                sql += " AND (CreatedAt <= ?)";
            }
            if (!updatedFrom.isEmpty()) {
                sql += " AND (UpdatedAt >= ?)";
            }
            if (!updatedTo.isEmpty()) {
                sql += " AND (UpdatedTo <= ?)";
            }
            if (sortField != null && !sortField.isEmpty()) {
                sql += " Order By " + sortField + " " + sortOrder;
            }
            sql += " offset ? rows fetch next ? rows only";
            stmt = conn.prepareStatement(sql);
            int parameterIndex = 1;
            if (!idFrom.isEmpty()) {
                stmt.setString(parameterIndex++, idFrom);
            }
            if (!idTo.isEmpty()) {
                stmt.setString(parameterIndex++, idTo);
            }
            if (!filterKey.isEmpty()) {
                stmt.setString(parameterIndex++, filterKey);
            }
            if (!filterValue.isEmpty()) {
                stmt.setString(parameterIndex++, filterValue);
            }
            if (!createdFrom.isEmpty()) {
                stmt.setString(parameterIndex++, createdFrom);
            }
            if (!createdTo.isEmpty()) {
                stmt.setString(parameterIndex++, createdTo);
            }
            if (!updatedFrom.isEmpty()) {
                stmt.setString(parameterIndex++, updatedFrom);
            }
            if (!updatedTo.isEmpty()) {
                stmt.setString(parameterIndex++, updatedTo);
            }
            stmt.setInt(parameterIndex++, index);
            stmt.setInt(parameterIndex++, pageSize);
            rs = stmt.executeQuery();

            while (rs.next()) {
                configList.add(new Configuration(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getTimestamp(4), rs.getTimestamp(5)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return configList;
    }

    public List<Configuration> getAllConfigList() {
        List<Configuration> configList = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = connection();
            String sql = "SELECT * FROM [Configuration]";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                configList.add(new Configuration(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getTimestamp(4), rs.getTimestamp(5)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return configList;
    }

    public void addConfig(Configuration config) {

        try {

            String sql = "INSERT INTO [Configuration] ([Key] ,[Value],[CreatedAt],[UpdatedAt]) VALUES (?,?,?,?)";

            PreparedStatement ps = connection().prepareStatement(sql);
            ps.setString(1, config.getKey());
            ps.setString(2, config.getValue());
            ps.setTimestamp(3, (Timestamp) config.getCreatedAt());
            ps.setTimestamp(4, (Timestamp) config.getUpdatedAt());

            ps.execute();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(DebtDao.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    public long countConfig(String idFrom, String idTo, String filterKey, String filterValue, String createdFrom, String createdTo, String updatedFrom, String updatedTo) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        long count = 0;

        try {
            con = connection();

            String query = "SELECT COUNT(*) AS count FROM [Configuration] where 1=1";

            if (!idFrom.isEmpty()) {
                query += " AND (ID >= ?)";

            }
            if (!idTo.isEmpty()) {
                query += " AND (ID <= ?)";

            }
            if (!filterKey.isEmpty()) {
                query += " AND ([Key] LIKE '%' + ? + '%')";
            }
            if (!filterValue.isEmpty()) {
                query += " AND ([Value] LIKE '%' + ? + '%')";
            }
            if (!createdFrom.isEmpty()) {
                query += " AND (CreatedAt >= ?)";
            }
            if (!createdTo.isEmpty()) {
                query += " AND (CreatedAt <= ?)";
            }
            if (!updatedFrom.isEmpty()) {
                query += " AND (UpdatedAt >= ?)";
            }
            if (!updatedTo.isEmpty()) {
                query += " AND (UpdatedTo <= ?)";
            }
            stmt = con.prepareStatement(query);
            int parameterIndex = 1;
            if (!idFrom.isEmpty()) {
                stmt.setString(parameterIndex++, idFrom);
            }
            if (!idTo.isEmpty()) {
                stmt.setString(parameterIndex++, idTo);
            }
            if (!filterKey.isEmpty()) {
                stmt.setString(parameterIndex++, filterKey);
            }
            if (!filterValue.isEmpty()) {
                stmt.setString(parameterIndex++, filterValue);
            }
            if (!createdFrom.isEmpty()) {
                stmt.setString(parameterIndex++, createdFrom);
            }
            if (!createdTo.isEmpty()) {
                stmt.setString(parameterIndex++, createdTo);
            }
            if (!updatedFrom.isEmpty()) {
                stmt.setString(parameterIndex++, updatedFrom);
            }
            if (!updatedTo.isEmpty()) {
                stmt.setString(parameterIndex++, updatedTo);
            }
            rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getLong(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return count;
    }

    public void updateConfig(Configuration configuration) {
        try {
            String sql = "UPDATE [Configuration] SET  [Value] = ?,[UpdatedAt]=? WHERE ID = ?";
            PreparedStatement ps = connection().prepareStatement(sql);
            ps.setString(1, configuration.getValue());
            ps.setTimestamp(2, (new Timestamp(configuration.getUpdatedAt().getTime())));
            ps.setLong(3, configuration.getId());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DebtDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        System.out.println(new ConfigurationDao().getAllConfigList());
    }

}
