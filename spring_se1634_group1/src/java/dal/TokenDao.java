package dal;

import entities.Token;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author nvash
 */
public class TokenDao extends DBContext {

    public void addToken(String token) {
        try ( PreparedStatement stmt = connection().prepareStatement(
                "insert into [Token] (Token) Values(?)")) {
            stmt.setString(1, token);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteToken(String token) {
        try ( PreparedStatement stmt = connection().prepareStatement(
                "DELETE FROM [Token] WHERE Token=?")) {
            stmt.setString(1, token);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Token getToken(String token) {
        try ( PreparedStatement stmt = connection().prepareStatement(
                "SELECT *"
                + "FROM [Token] "
                + "WHERE Token=?")) {
            stmt.setString(1, token);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Token(rs.getLong(1), rs.getString(2));
            }
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
