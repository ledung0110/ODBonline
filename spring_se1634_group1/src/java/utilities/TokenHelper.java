package utilities;

import dal.AccountDao;
import dal.TokenDao;
import java.util.Date;
import org.json.JSONObject;

/**
 *
 * @author nvash
 */
public class TokenHelper {

    public static boolean isValidTokenSignUp(String token) {
        try {
            JSONObject json = TokenGenerator.decrypt(token);
            if (new Date().after(new Date(json.getLong("expiry")))) {
                return false;
            }
            if (new TokenDao().getToken(token) == null) {
                return false;
            }
            boolean valid = TokenGenerator.validCheck(token, ConfigManagement.getInstance().getConfigValue("GLOBAL_GENERATE_KEY"));
            return valid;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isValidTokenReset(String token) {
        try {
            JSONObject json = TokenGenerator.decrypt(token);
            String username = json.getString("username");
            AccountDao accountDao = new AccountDao();
            if (new Date().after(new Date(json.getLong("expiry")))) {
                return false;
            }
            if (new TokenDao().getToken(token) == null) {
                return false;
            }
            boolean valid = TokenGenerator.validCheck(token, accountDao.getAccountByUsername(username).getPassword());
            return valid;
        } catch (Exception e) {
            return false;
        }
    }
}
