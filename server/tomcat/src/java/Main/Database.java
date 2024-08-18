package Main;

import Conversation.Message;
import Conversation.Preview;
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

    public static boolean removeFriendRequest(int requester, int requested) {
        try {
            var statement = connection.prepareCall("{call removeRequest(?, ?)}");
            statement.setInt(1, requester);
            statement.setInt(2, requested);
            statement.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static User getUser(int id, int relation) {
        User user = getUser(id);
        user.relation = relation;
        return user;
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

    public static ArrayList<User> getFriendList(User current) {
        int userID = current.id;

        try {
            var statement = connection.prepareCall("{call getFriendList(?)}");
            statement.setInt(1, userID);
            var result = statement.executeQuery();
            ArrayList<User> friends = new ArrayList<>();
            while (result.next()) {
                friends.add(getUser(result.getInt(1), 1));
            }

            return friends;

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static ArrayList<User> getSentRequestList(User current) {
        int userID = current.id;

        try {
            var statement = connection.prepareCall("{call getSentRequestList(?)}");
            statement.setInt(1, userID);
            var result = statement.executeQuery();
            ArrayList<User> requests = new ArrayList<>();
            while (result.next()) {
                requests.add(getUser(result.getInt(1), 2));
            }
            return requests;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static ArrayList<User> getReceivedRequestList(User current) {
        int userID = current.id;

        try {
            var statement = connection.prepareCall("{call getReceivedRequestList(?)}");
            statement.setInt(1, userID);
            var result = statement.executeQuery();
            ArrayList<User> requests = new ArrayList<>();
            while (result.next()) {
                requests.add(getUser(result.getInt(1), 3));
            }
            return requests;
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
                blocks.add(getUser(result.getInt(1), -1));
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

    public static int sendTextMessage(int sender, int receiver, String message) {
        try {
            var statement = connection.prepareCall("{call sendMessage(?, ?, ?, ?, ?)}");
            statement.setInt(1, sender);
            statement.setInt(2, receiver);
            statement.setString(3, "text");
            statement.setString(4, message);
            statement.registerOutParameter(5, java.sql.Types.INTEGER);
            statement.execute();
            return statement.getInt(5);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static ArrayList<Message> getMessages(int user1, int user2) {
        try {
            var statement = connection.prepareCall("{call getMessages(?, ?)}");
            statement.setInt(1, user1);
            statement.setInt(2, user2);
            var result = statement.executeQuery();
            ArrayList<Message> messages = new ArrayList<>();
            while (result.next()) {
                messages.add(new Message(result.getInt(1) == user1, result.getInt(2), result.getString(3),
                        result.getString(4), result.getString(5)));
            }
            return messages;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ArrayList<Preview> getPreview(int userID) {
        try {
            var statement = connection.prepareCall("{call getPreview(?)}");
            statement.setInt(1, userID);
            var result = statement.executeQuery();
            ArrayList<Preview> previews = new ArrayList<Preview>();
            while (result.next()) {
                previews.add(new Preview(result.getInt(1) == userID ? result.getInt(2) : result.getInt(1),
                        getUser(result.getInt(1) == userID ? result.getInt(2) : result.getInt(1)).fullname,
                        new Message(result.getInt(1) == userID, result.getInt(2), result.getString(3),
                                result.getString(4), result.getString(5))));
            }
            return previews;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static boolean deleteMessage(int sender, int receiver, String time) {
        try {
            var statement = connection.prepareCall("{call deleteMessage(?, ?, ?)}");
            statement.setInt(1, sender);
            statement.setInt(2, receiver);
            statement.setString(3, time);
            statement.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static boolean updateProfile(User current) {
        try {
            var statement = connection.prepareCall("{call updateProfile(?, ?, ?, ?)}");
            statement.setInt(1, current.id);
            statement.setString(2, current.fullname);
            statement.setString(3, current.password);
            statement.setString(4, current.dob);
            statement.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static void sendFileMessage(int sender, int receiver, String filename) {
        try {
            var statement = connection.prepareCall("{call sendMessage(?, ?, ?, ?, ?)}");
            statement.setInt(1, sender);
            statement.setInt(2, receiver);
            statement.setString(3, "file");
            statement.setString(4, filename);
            statement.registerOutParameter(5, java.sql.Types.INTEGER);
            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void sendImageMessage(int sender, int receiver, String filename) {
        try {
            var statement = connection.prepareCall("{call sendMessage(?, ?, ?, ?, ?)}");
            statement.setInt(1, sender);
            statement.setInt(2, receiver);
            statement.setString(3, "image");
            statement.setString(4, filename);
            statement.registerOutParameter(5, java.sql.Types.INTEGER);
            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static int checkRole(int id) {
        try {
            var statement = connection.prepareCall("{call checkRole(?, ?)}");
            statement.setInt(1, id);
            statement.registerOutParameter(2, java.sql.Types.INTEGER);
            statement.execute();
            return statement.getInt(2);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static void deactivateAccount(int id) {
        try {
            var statement = connection.prepareCall("{call deactivateAccount(?)}");
            statement.setInt(1, id);
            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void activateAccount(int id) {
        try {
            var statement = connection.prepareCall("{call activateAccount(?)}");
            statement.setInt(1, id);
            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ArrayList<User> getActiveAccounts() {
        try {
            var statement = connection.prepareCall("{call getActiveAccounts()}");
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

    public static ArrayList<User> getDeactivatedAccounts() {
        try {
            var statement = connection.prepareCall("{call getDeactivatedAccounts()}");
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

    public static int getTotalMessages(String fromDate, String toDate) {
        try {
            var statement = connection.prepareCall("{call getTotalMessages(?, ?)}");
            statement.setString(1, fromDate);
            statement.setString(2, toDate);
            var result = statement.executeQuery();
            result.next();
            return result.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static int getTotalUsers() {
        try {
            var statement = connection.prepareCall("{call getTotalUsers()}");
            var result = statement.executeQuery();
            result.next();
            return result.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static int getDeactivatedUsers() {
        try {
            var statement = connection.prepareCall("{call getDeactivatedUsers()}");
            var result = statement.executeQuery();
            result.next();
            return result.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static int getTotalModerators() {
        try {
            var statement = connection.prepareCall("{call getTotalModerators()}");
            var result = statement.executeQuery();
            result.next();
            return result.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}