package Main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Database {
    public static Connection connection;

    static {
        try {
            String username = "sa";
            String password = System.getenv("SQLPASSWORD") != null ? System.getenv("SQLPASSWORD") : "123";
            String database = "comm";

            String url = "jdbc:sqlserver://localhost:1433;databaseName=" + database;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static int login(String login, String password) {
        try {
            var statement = connection.prepareCall("{call login(?, ?, ?)}");
            statement.setString(1, login);
            statement.setString(2, password);
            statement.registerOutParameter(3, java.sql.Types.INTEGER);
            statement.execute();
            return statement.getInt(3);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static int userExist(User current) {
        try {
            var statement = connection.prepareCall("{call checkExist(?, ?, ?)}");
            statement.setString(1, current.username);
            statement.setString(2, current.email);
            statement.registerOutParameter(3, java.sql.Types.INTEGER);
            statement.execute();
            return statement.getInt(3);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }

    public static boolean addUser(User current) {
        try {
            var statement = connection.prepareCall("{call addUser(?, ?, ?, ?, ?, ?)}");
            statement.setString(1, current.username);
            statement.setString(2, current.password);
            statement.setString(3, current.email);
            statement.setString(4, current.dob);
            statement.setInt(5, current.gender);
            statement.registerOutParameter(6, java.sql.Types.INTEGER);
            statement.execute();
            return statement.getInt(6) == 1;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static boolean setFriend(int user1, int user2) {
        try {
            var statement = connection.prepareCall("{call setFriend(?, ?)}");
            statement.setInt(1, user1);
            statement.setInt(2, user2);
            statement.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static boolean removeFriend(int user1, int user2) {
        try {
            var statement = connection.prepareCall("{call removeFriend(?, ?)}");
            statement.setInt(1, user1);
            statement.setInt(2, user2);
            statement.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static int sendFriendRequest(int requester, int requested) {
        try {
            var statement = connection.prepareCall("{call sendFriendRequest(?, ?, ?)}");
            statement.setInt(1, requester);
            statement.setInt(2, requested);
            statement.registerOutParameter(3, java.sql.Types.INTEGER);
            statement.execute();
            return statement.getInt(3);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static int blockUser(int blocker, int blocked) {
        try {
            var statement = connection.prepareCall("{call blockUser(?, ?, ?)}");
            statement.setInt(1, blocker);
            statement.setInt(2, blocked);
            statement.registerOutParameter(3, java.sql.Types.INTEGER);
            statement.execute();
            return statement.getInt(3);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static int unblockUser(int blocker, int blocked) {
        try {
            var statement = connection.prepareCall("{call unblockUser(?, ?, ?)}");
            statement.setInt(1, blocker);
            statement.setInt(2, blocked);
            statement.registerOutParameter(3, java.sql.Types.INTEGER);
            statement.execute();
            return statement.getInt(3);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static User getUser(int id) {
        try {
            var statement = connection.prepareCall("{call getUser(?, ?, ?, ?, ?, ?)}");
            statement.setInt(1, id);
            statement.registerOutParameter(2, java.sql.Types.NVARCHAR);
            statement.registerOutParameter(3, java.sql.Types.NVARCHAR);
            statement.registerOutParameter(4, java.sql.Types.NVARCHAR);
            statement.registerOutParameter(5, java.sql.Types.DATE);
            statement.registerOutParameter(6, java.sql.Types.INTEGER);
            statement.execute();

            return new User(id, statement.getString(2), statement.getString(3), statement.getString(4),
                    statement.getString(5), statement.getInt(6), 0);
            ;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ArrayList<User> getFriendList(User current) {
        int userID = current.id;

        try {
            var statement = connection.prepareCall("{call getFriendList(?)}");
            statement.setInt(1, userID);
            var result = statement.executeQuery();
            ArrayList<User> friends = new ArrayList<>();
            while (result.next()) {
                friends.add(getUser(result.getInt(1)));
            }

            return friends;

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static ArrayList<User> getUserList(User current) {
        int userID = current.id;

        try {
            var statement = connection.prepareCall("{call getUserList(?)}");
            statement.setInt(1, userID);
            var result = statement.executeQuery();
            ArrayList<User> users = new ArrayList<>();
            while (result.next()) {
                users.add(getUser(result.getInt(1)));
            }
            return users;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static ArrayList<User> getBlockList(User current) {
        int userID = current.id;

        try {
            var statement = connection.prepareCall("{call getBlockList(?)}");
            statement.setInt(1, userID);
            var result = statement.executeQuery();
            ArrayList<User> blocks = new ArrayList<>();
            while (result.next()) {
                blocks.add(getUser(result.getInt(1)));
            }
            return blocks;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static int getRelation(int user1, int user2) {
        try {
            var statement = connection.prepareCall("{call getRelation(?, ?, ?)}");
            statement.setInt(1, user1);
            statement.setInt(2, user2);
            statement.registerOutParameter(3, java.sql.Types.INTEGER);
            statement.execute();
            return statement.getInt(3);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}