package Relation;

import java.io.IOException;
import java.util.ArrayList;

import Main.Database;
import Main.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Handler extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                add(request, response);
                viewAll(request, response);
                break;
            case "block":
                block(request, response);
                viewAll(request, response);
                break;
            case "remove":
                remove(request, response);
                viewAll(request, response);
                break;
            case "unblock":
                unblock(request, response);
                viewAll(request, response);
                break;
            case "removeRequest":
                removeRequest(request, response);
                viewAll(request, response);
                break;
            default:
                viewAll(request, response);
                break;
        }
    }

    public static void removeRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");
        int theirID = Integer.parseInt(request.getParameter("theirID"));
        int currentID = current.id;
        User them = Database.getUser(theirID);
        Database.removeFriendRequest(currentID, theirID);

        request.setAttribute("status", "Friend request removed from " + them.fullname);
    }

    public static void unblock(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");
        int theirID = Integer.parseInt(request.getParameter("theirID"));
        int currentID = current.id;
        User them = Database.getUser(theirID);
        Database.unblockUser(currentID, theirID);

        request.setAttribute("status", "You have unblocked " + them.fullname);
    }

    public static void remove(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");
        int theirID = Integer.parseInt(request.getParameter("theirID"));
        int currentID = current.id;
        User them = Database.getUser(theirID);
        Database.removeFriend(currentID, theirID);

        request.setAttribute("status", "You are no longer friends with " + them.fullname);
    }

    public static void block(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");
        int theirID = Integer.parseInt(request.getParameter("theirID"));
        int currentID = current.id;
        User them = Database.getUser(theirID);
        Database.blockUser(currentID, theirID);

        request.setAttribute("status", "You have blocked " + them.fullname);
    }

    public void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");
        int theirID = Integer.parseInt(request.getParameter("theirID"));
        int currentID = current.id;

        String status = "";

        User them = Database.getUser(theirID);

        switch (Database.sendFriendRequest(currentID, theirID)) {
            case 2:
                status = "You are now friends with " + them.fullname;
                break;
            case 1:
                status = "Friend request sent to " + them.fullname;
                break;
            case 0:
            case -1:
            case -2:
                status = "Error sending friend request to " + them.fullname;
                break;
        }

        request.setAttribute("status", status);
    }

    protected void viewAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");

        ArrayList<User> friend = Database.getFriendList(current);
        ArrayList<User> requested = Database.getSentRequestList(current);
        ArrayList<User> received = Database.getReceivedRequestList(current);
        ArrayList<User> blocked = Database.getBlockList(current);
        ArrayList<User> users = Database.getUserList(current);

        request.setAttribute("friends", friend);
        request.setAttribute("requested", requested);
        request.setAttribute("received", received);
        request.setAttribute("blocked", blocked);
        request.setAttribute("users", users);
        request.getRequestDispatcher("friends.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
