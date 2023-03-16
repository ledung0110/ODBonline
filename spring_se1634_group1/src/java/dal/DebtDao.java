/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nvash
 */
public class DebtDao extends DBContext {

    public Debt getDebtByID(long id) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = connection();
            String sql = "SELECT * FROM Debt Where ID=?";

            stmt = con.prepareStatement(sql);
            stmt.setLong(1, id);

            rs = stmt.executeQuery();
            while (rs.next()) {
                return new Debt(rs.getLong(1), rs.getLong(2), rs.getNString(3),
                        rs.getNString(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getTimestamp(8), rs.getTimestamp(9));
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
        return null;
    }

    public List<Debt> getDebts(long userId, int index, int pageSize, String sortField,
            String sortOrder, String idFrom, String idTo, String filterName,
            String filterAddress, String filterPhone, String filterEmail,
            String totalFrom, String totalTo, String createdFrom, String createdTo, String updatedFrom, String updatedTo) {
        List<Debt> debts = new ArrayList<Debt>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = connection();

            String sql = "SELECT * FROM Debt Where UserID=?";
            if (!idFrom.isEmpty()) {
                sql += " AND (ID >= ?)";
            }
            if (!idTo.isEmpty()) {
                sql += " AND (ID <= ?)";
            }
            if (!filterName.isEmpty()) {
                sql += " AND (Name LIKE '%' + ? + '%')";
            }
            if (!filterAddress.isEmpty()) {
                sql += " AND (Address LIKE '%' + ? + '%')";
            }
            if (!filterPhone.isEmpty()) {
                sql += " AND (Phone LIKE '%' + ? + '%')";
            }
            if (!filterEmail.isEmpty()) {
                sql += " AND (Email LIKE '%' + ? + '%')";
            }
            if (!totalFrom.isEmpty()) {
                sql += " AND (TotalDebt >= ?)";
            }
            if (!totalTo.isEmpty()) {
                sql += " AND (TotalDebt <= ?)";
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
            stmt = con.prepareStatement(sql);
            stmt.setLong(1, userId);
            int parameterIndex = 2;
            if (!idFrom.isEmpty()) {
                stmt.setString(parameterIndex++, idFrom);
            }
            if (!idTo.isEmpty()) {
                stmt.setString(parameterIndex++, idTo);
            }
            if (!filterName.isEmpty()) {
                stmt.setString(parameterIndex++, filterName);
            }
            if (!filterAddress.isEmpty()) {
                stmt.setString(parameterIndex++, filterAddress);
            }
            if (!filterPhone.isEmpty()) {
                stmt.setString(parameterIndex++, filterPhone);
            }
            if (!filterEmail.isEmpty()) {
                stmt.setString(parameterIndex++, filterEmail);
            }
            if (!totalFrom.isEmpty()) {
                stmt.setString(parameterIndex++, totalFrom);
            }
            if (!totalTo.isEmpty()) {
                stmt.setString(parameterIndex++, totalTo);
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

                debts.add(new Debt(rs.getLong(1), rs.getLong(2), rs.getNString(3),
                        rs.getNString(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getTimestamp(8), rs.getTimestamp(9)));
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
        return debts;
    }

    public long countDebts(long userId, String idFrom, String idTo, String filterName, String filterAddress, String filterPhone, String filterEmail, String totalFrom, String totalTo, String createdFrom, String createdTo, String updatedFrom, String updatedTo) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        long count = 0;

        try {
            con = connection();

            String query = "SELECT COUNT(*) AS count FROM Debt where UserID=?";

            if (!idFrom.isEmpty()) {
                query += " AND (ID >= ?)";

            }
            if (!idTo.isEmpty()) {
                query += " AND (ID <= ?)";

            }
            if (!filterName.isEmpty()) {
                query += " AND (Name LIKE '%' + ? + '%')";
            }
            if (!filterAddress.isEmpty()) {
                query += " AND (Address LIKE '%' + ? + '%')";
            }
            if (!filterPhone.isEmpty()) {
                query += " AND (Phone LIKE '%' + ? + '%')";
            }
            if (!filterEmail.isEmpty()) {
                query += " AND (Email LIKE '%' + ? + '%')";
            }
            if (!totalFrom.isEmpty()) {
                query += " AND (TotalDebt >= ?)";
            }
            if (!totalTo.isEmpty()) {
                query += " AND (TotalDebt <= ?)";
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
            stmt.setLong(1, userId);
            int parameterIndex = 2;
            if (!idFrom.isEmpty()) {
                stmt.setString(parameterIndex++, idFrom);
            }
            if (!idTo.isEmpty()) {
                stmt.setString(parameterIndex++, idTo);
            }
            if (!filterName.isEmpty()) {
                stmt.setString(parameterIndex++, filterName);
            }
            if (!filterAddress.isEmpty()) {
                stmt.setString(parameterIndex++, filterAddress);
            }
            if (!filterPhone.isEmpty()) {
                stmt.setString(parameterIndex++, filterPhone);
            }
            if (!filterEmail.isEmpty()) {
                stmt.setString(parameterIndex++, filterEmail);
            }
            if (!totalFrom.isEmpty()) {
                stmt.setString(parameterIndex++, totalFrom);
            }
            if (!totalTo.isEmpty()) {
                stmt.setString(parameterIndex++, totalTo);
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

    public void addDebtor(Debt debtor) throws ParseException {

        try {

            String sql = "INSERT INTO Debt ([UserID],[Name], [Address],[Phone],[Email],[TotalDebt],[CreatedAt],[UpdatedAt]) VALUES (?,?,?,?,?,?,?,?)";

            PreparedStatement ps = connection().prepareStatement(sql);
            ps.setLong(1, debtor.getUserId());
            ps.setString(2, debtor.getName());
            ps.setString(3, debtor.getAddress());
            ps.setString(4, debtor.getPhone());
            ps.setString(5, debtor.getEmail());
            ps.setDouble(6, debtor.getTotalDebt());
            ps.setTimestamp(7, (Timestamp) debtor.getCreateAt());
            ps.setTimestamp(8, (Timestamp) debtor.getUpdateAt());

            ps.execute();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(DebtDao.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
      public void update(String name, String address, String phone, String email, Timestamp timeUpdate, long id) {
        try {
            String sql = "UPDATE Debt SET  [Name] = ?,[Address] = ?,[Phone]= ?,[Email]=?,[UpdatedAt]=? WHERE id = ?";
            PreparedStatement ps = connection().prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setTimestamp(5, timeUpdate);
            ps.setLong(6, id);
            ps.execute();

        } catch (SQLException ex) {
            Logger.getLogger(DebtDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateTotalDebt(Debt debt) {
       try {
            String sql = "UPDATE Debt SET  [TotalDebt]=? WHERE id = ?";          
            PreparedStatement ps = connection().prepareStatement(sql);
            ps.setDouble(1, debt.getTotalDebt());
            ps.setLong(2, debt.getId());
             ps.execute();
            
        } catch (SQLException ex) {
            Logger.getLogger(DebtDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
  
  
}
