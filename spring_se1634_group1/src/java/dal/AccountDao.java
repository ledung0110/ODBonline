package dal;

import entities.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilities.Crypto;

public class AccountDao extends DBContext {

    public void accountConfirmed(String username) {
        try ( PreparedStatement stmt = connection().prepareStatement(
                "update [Account] \n"
                + "set IsConfirmed=1\n"
                + "where Username=?")) {
            stmt.setString(1, username);
            stmt.executeUpdate();
            stmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void updateAccount(Account account) {
        String sql = "update [Account] set [Password]=? where [Username]=?";
        try {
            PreparedStatement stmt = connection().prepareStatement(sql);
            stmt.setString(1, Crypto.SHA256(account.getPassword()));
            stmt.setString(2, account.getUsername());
            stmt.executeUpdate();
            stmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateAccess(String id, String isAdmin){
        String sql = "update [Account] set [isAdmin] = ? where [id] = ?";
        try {
            PreparedStatement stmt = connection().prepareStatement(sql);
            stmt.setString(1, isAdmin);
            stmt.setString(2, id);
            stmt.executeUpdate();
            stmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Account getAccountByUsername(String username) {
        try ( PreparedStatement stmt = connection().prepareStatement(
                "SELECT * FROM [Account] WHERE [Username] = "
                + "? COLLATE Latin1_General_CS_AS")) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Account(rs.getLong(1), username, rs.getString(3),
                        rs.getBoolean(4), rs.getBoolean(5));
            }
            stmt.close();
            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public Account getAccountByUsernameAndPassword(String username, String password) {
        try ( PreparedStatement stmt = connection().prepareStatement(
                "SELECT * FROM [Account] WHERE [Username] = ? "
                + "and [Password]=? COLLATE Latin1_General_CS_AS")) {
            stmt.setString(1, username);
            stmt.setString(2, Crypto.SHA256(password));
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Account(rs.getLong(1), username, rs.getString(3),
                        rs.getBoolean(4), rs.getBoolean(5));
            }
            stmt.close();

            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public void createAccount(String username, String password, String email) {
        try ( PreparedStatement stmt = connection().prepareStatement(
                "EXEC [sp_create_account] ?, ?, ?")) {
            stmt.setString(1, username);
            stmt.setString(2, Crypto.SHA256(password));
            stmt.setString(3, email);
            stmt.executeUpdate();
            stmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void updatePassword(String username, String password) {
        try ( PreparedStatement stmt = connection().prepareStatement(
                "UPDATE User SET Password = ? WHERE Username = ?")) {
            stmt.setString(1, Crypto.SHA256(password));
            stmt.setString(2, username);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Account> getAllAccount(int index, int pageSize, String sortField,
            String sortOrder, String idFrom, String idTo, String filterUserName, String isAdmin, String isActive) {
        List<Account> account = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = connection();

            String sql = "SELECT * FROM Account Where 1=1";
            if (!idFrom.isEmpty()) {
                sql += " AND (ID >= ?)";
            }
            if (!idTo.isEmpty()) {
                sql += " AND (ID <= ?)";
            }
            if (!filterUserName.isEmpty()) {
                sql += " AND (UserName LIKE '%' + ? + '%')";
            }
            if (!isAdmin.isEmpty()) {
                sql += " AND (IsAdmin = ?)";
            }
            if (!isActive.isEmpty()) {
                sql += " AND (IsConfirmed = ?)";
            }
            if (sortField != null && !sortField.isEmpty()) {
                sql += " Order By " + sortField + " " + sortOrder;
            }
            sql += " offset ? rows fetch next ? rows only";
            stmt = con.prepareStatement(sql);
            int parameterIndex = 1;
            if (!idFrom.isEmpty()) {
                stmt.setString(parameterIndex++, idFrom);
            }
            if (!idTo.isEmpty()) {
                stmt.setString(parameterIndex++, idTo);
            }
            if (!filterUserName.isEmpty()) {
                stmt.setString(parameterIndex++, filterUserName);
            }
            if (!isAdmin.isEmpty()) {
                 stmt.setString(parameterIndex++, isAdmin);
            }
            if (!isActive.isEmpty()) {
                stmt.setString(parameterIndex++, isActive);
            }
            stmt.setInt(parameterIndex++, index);
            stmt.setInt(parameterIndex++, pageSize);
            rs = stmt.executeQuery();
            while (rs.next()) {
                account.add(new Account(rs.getLong(1), rs.getString(2), rs.getString(3),
                        rs.getBoolean(4), rs.getBoolean(5)));
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
        return account;
    }
    
    
     public long countAccount(String idFrom, String idTo, String filterName, String isAdmin, String isActive) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        long count = 0;

        try {
            con = connection();

            String query = "SELECT COUNT(*) AS count FROM Account where 1=1";

            if (!idFrom.isEmpty()) {
                query += " AND (ID >= ?)";

            }
            if (!idTo.isEmpty()) {
                query += " AND (ID <= ?)";

            }
            if (!filterName.isEmpty()) {
                query += " AND (Name LIKE '%' + ? + '%')";
            }
            if (!isAdmin.isEmpty()) {
                query += " AND (IsAdmin = ?)";
            }
            if (!isActive.isEmpty()) {
                query += " AND (IsConfirmed = ?)";
            }
            stmt = con.prepareStatement(query);
            int parameterIndex = 1;
            if (!idFrom.isEmpty()) {
                stmt.setString(parameterIndex++, idFrom);
            }
            if (!idTo.isEmpty()) {
                stmt.setString(parameterIndex++, idTo);
            }
            if (!filterName.isEmpty()) {
                stmt.setString(parameterIndex++, filterName);
            }
            if (!isAdmin.isEmpty()) {
                 stmt.setString(parameterIndex++, isAdmin);
            }
            if (!isActive.isEmpty()) {
                stmt.setString(parameterIndex++, isActive);
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
     

    public static void main(String[] args) {
        System.out.println(new AccountDao().getAccountByUsername("xoaihaimi1234"));

    }

}
