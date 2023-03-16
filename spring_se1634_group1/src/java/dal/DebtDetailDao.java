/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entities.Account;
import entities.Debt;
import entities.DebtDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nvash
 */
public class DebtDetailDao extends DBContext {

    public List<DebtDetail> getDebtDetails(long debtId, int index, int pageSize, String sortField, String sortOrder, String idFrom, String idTo, String filterNote, String debtType, String amountFrom, String amountTo, String debtCreatedFrom, String debtCreatedTo, String createdFrom, String createdTo) {
        List<DebtDetail> debtDetails = new ArrayList<DebtDetail>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = connection();

            String sql = "SELECT * FROM DebtDetail Where DebtID=?";
            if (!idFrom.isEmpty()) {
                sql += " AND (ID >= ?)";
            }
            if (!idTo.isEmpty()) {
                sql += " AND (ID <= ?)";
            }
            if (!filterNote.isEmpty()) {
                sql += " AND (Note LIKE '%' + ? + '%')";
            }
            if (!debtType.isEmpty()) {
                sql += " AND (DebtType = ?)";
            }

            if (!amountFrom.isEmpty()) {
                sql += " AND (Amount >= ?)";
            }
            if (!amountTo.isEmpty()) {
                sql += " AND (Amount <= ?)";
            }
            if (!createdFrom.isEmpty()) {
                sql += " AND (DateCreatedAt >= ?)";
            }
            if (!createdTo.isEmpty()) {
                sql += " AND (DateCreatedAt <= ?)";
            }
            if (!debtCreatedFrom.isEmpty()) {
                sql += " AND (DebtCreatedAt >= ?)";
            }
            if (!debtCreatedTo.isEmpty()) {
                sql += " AND (debtCreatedAt <= ?)";
            }
            if (sortField != null && !sortField.isEmpty()) {
                sql += " Order By " + sortField + " " + sortOrder;
            }
            sql += " offset ? rows fetch next ? rows only";
            stmt = con.prepareStatement(sql);
            stmt.setLong(1, debtId);
            int parameterIndex = 2;
            if (!idFrom.isEmpty()) {
                stmt.setString(parameterIndex++, idFrom);
            }
            if (!idTo.isEmpty()) {
                stmt.setString(parameterIndex++, idTo);
            }
            if (!filterNote.isEmpty()) {
                stmt.setString(parameterIndex++, filterNote);
            }
            if (!debtType.isEmpty()) {
                stmt.setString(parameterIndex++, debtType);
            }

            if (!amountFrom.isEmpty()) {
                stmt.setString(parameterIndex++, amountFrom);
            }
            if (!amountTo.isEmpty()) {
                stmt.setString(parameterIndex++, amountTo);
            }
            if (!createdFrom.isEmpty()) {
                stmt.setString(parameterIndex++, createdFrom);
            }
            if (!createdTo.isEmpty()) {
                stmt.setString(parameterIndex++, createdTo);
            }
            if (!debtCreatedFrom.isEmpty()) {
                stmt.setString(parameterIndex++, debtCreatedFrom);
            }
            if (!debtCreatedTo.isEmpty()) {
                stmt.setString(parameterIndex++, debtCreatedTo);
            }
            stmt.setInt(parameterIndex++, index);
            stmt.setInt(parameterIndex++, pageSize);
            rs = stmt.executeQuery();
            while (rs.next()) {

                debtDetails.add(new DebtDetail(rs.getLong(1), rs.getLong(2), rs.getNString(3),
                        rs.getBoolean(4), rs.getDouble(5), rs.getString(6), rs.getTimestamp(7), rs.getTimestamp(8)));
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
        return debtDetails;
    }

    
     public long countDebtDetails(long debtId, String idFrom, String idTo, String filterNote, String debtType, String amountFrom, String amountTo, String debtCreatedFrom, String debtCreatedTo, String createdFrom, String createdTo) {
       Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        long count = 0;

        try {
            con = connection();
             String query = "SELECT COUNT(*) AS count FROM DebtDetail where DebtID=?";
             if (!idFrom.isEmpty()) {
                query += " AND (ID >= ?)";
            }
            if (!idTo.isEmpty()) {
                query += " AND (ID <= ?)";
            }
            if (!filterNote.isEmpty()) {
                query += " AND (Note LIKE '%' + ? + '%')";
            }
            if (!debtType.isEmpty()) {
                query += " AND (DebtType = ?)";
            }

            if (!amountFrom.isEmpty()) {
                query += " AND (Amount >= ?)";
            }
            if (!amountTo.isEmpty()) {
                query += " AND (Amount <= ?)";
            }
            if (!createdFrom.isEmpty()) {
                query += " AND (DateCreatedAt >= ?)";
            }
            if (!createdTo.isEmpty()) {
                query += " AND (DateCreatedAt <= ?)";
            }
            if (!debtCreatedFrom.isEmpty()) {
                query += " AND (DebtCreatedAt >= ?)";
            }
            if (!debtCreatedTo.isEmpty()) {
                query += " AND (debtCreatedAt <= ?)";
            }
            stmt = con.prepareStatement(query);
            stmt.setLong(1, debtId);
           int parameterIndex = 2;
            if (!idFrom.isEmpty()) {
                stmt.setString(parameterIndex++, idFrom);
            }
            if (!idTo.isEmpty()) {
                stmt.setString(parameterIndex++, idTo);
            }
            if (!filterNote.isEmpty()) {
                stmt.setString(parameterIndex++, filterNote);
            }
            if (!debtType.isEmpty()) {
                stmt.setString(parameterIndex++, debtType);
            }

            if (!amountFrom.isEmpty()) {
                stmt.setString(parameterIndex++, amountFrom);
            }
            if (!amountTo.isEmpty()) {
                stmt.setString(parameterIndex++, amountTo);
            }
            if (!createdFrom.isEmpty()) {
                stmt.setString(parameterIndex++, createdFrom);
            }
            if (!createdTo.isEmpty()) {
                stmt.setString(parameterIndex++, createdTo);
            }
            if (!debtCreatedFrom.isEmpty()) {
                stmt.setString(parameterIndex++, debtCreatedFrom);
            }
            if (!debtCreatedTo.isEmpty()) {
                stmt.setString(parameterIndex++, debtCreatedTo);
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
    

    public boolean isFilenameExist(String filename) {
        boolean result = false;
        try ( PreparedStatement stmt = connection().prepareStatement(
                "SELECT COUNT(*) AS count FROM [DebtDetail] WHERE [Image] = ?")) {
            stmt.setString(1, filename);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    result = true; // Tên file đã tồn tại trong CSDL
                } else {
                    result = false; // Tên file chưa tồn tại trong CSDL
                }
            }
            stmt.close();
            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public void addDebtDetail(DebtDetail debtDetail) {
        try {

            String sql = "INSERT INTO [DebtDetail] ([DebtID],[Note], [DebtType],[Amount],[Image],[DebtCreatedAt],[DateCreatedAt]) VALUES (?,?,?,?,?,?,?)";

            PreparedStatement ps = connection().prepareStatement(sql);
            ps.setLong(1, debtDetail.getDebtId());
            ps.setString(2, debtDetail.getNote());
            ps.setBoolean(3, debtDetail.isDebtType());
            ps.setDouble(4, debtDetail.getAmount());
            ps.setString(5, debtDetail.getImage());
            ps.setTimestamp(6, (Timestamp) debtDetail.getDebtCreatedAt());
            ps.setTimestamp(7, (Timestamp) debtDetail.getDateCreateAt());

            ps.execute();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(DebtDao.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    public static void main(String[] args) {
        DebtDetailDao dao = new DebtDetailDao();
        List<DebtDetail> debtDetails = dao.getDebtDetails(1, 19, 5, "ID", "ASC","", "", "", "", "", "", "", "", "", "");
        System.out.println(dao.countDebtDetails(1, "", "", "", "", "", "", "", "", "", ""));
    }

   

}
