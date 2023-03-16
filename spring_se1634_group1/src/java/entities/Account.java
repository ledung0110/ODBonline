package entities;

/**
 *
 * @author nvash
 */
public class Account {

    private long id;
    private String username;
    private String password;
    private boolean admin;
    private boolean confirmed;

    public Account() {
    }

    public Account(long id, String username, String password, boolean admin, boolean confirmed) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.admin = admin;
        this.confirmed = confirmed;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public boolean isConfirmed() {
        return confirmed;
    }

    public void setConfirmed(boolean confirmed) {
        this.confirmed = confirmed;
    }

}
