package dal;

import entities.Account;
import entities.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utilities.Crypto;

/**
 *
 * @author nvash
 */
public class UserDao extends DBContext {

    public User getUserByUsername(String username) {
        try ( PreparedStatement stmt = connection().prepareStatement("SELECT [User].* "
                + "FROM [User], [Account] "
                + "WHERE [User].[ID] = [Account].[ID] AND [Username] = ?")) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(rs.getLong(1), rs.getNString(2), rs.getNString(3), rs.getString(4));
            }
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public void updateUser(User user) throws SQLException {
        try ( PreparedStatement stmt = connection().prepareStatement(
                "UPDATE [User]\n"
                + "SET Fullname = ?, Email = ?, Phone = ?\n"
                + "WHERE ID = ?")) {

            stmt.setString(1, (user.getFullName()));
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPhone());
            stmt.setLong(4, user.getId());
            stmt.executeUpdate();
            stmt.close();
        } 
    }
    public static void main(String[] args) throws SQLException {
        new UserDao().updateUser(new User(3,"Dunggggg","abcdefg@gmail.com","0123456789"));
    }
}
