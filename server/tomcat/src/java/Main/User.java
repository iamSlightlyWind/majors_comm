package Main;

public class User {
    public int id;
    public String username;
    public String fullname;
    public String password;
    public String email;
    public String dob;
    public int gender;
    public int googleUser;
    public int relation;

    public User(String login, String password) {
        if (isEmail(login)) {
            this.email = login;
        } else {
            this.username = login;
        }
        this.password = password;
    }

    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public User(int id, String username, String fullname, String email, String dob, int gender, int googleUser) {
        this.id = id;
        this.username = username;
        this.fullname = fullname;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
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
