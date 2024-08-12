package Main;

public class User {
    int id;
    String username;
    String password;
    String email;
    String dob;
    int gender;
    int googleUser;

    public User(String login, String password) {
        if (isEmail(login)) {
            this.email = login;
        } else {
            this.username = login;
        }
        this.password = password;
    }

    public boolean isEmail(String login) {
        return login.contains("@");
    }

    public boolean login() {
        if (this.email != null) {
            return Database.login(this.email, this.password);
        } else {
            return Database.login(this.username, this.password);
        }
    }
}
