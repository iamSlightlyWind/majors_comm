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
                break;
            case "block":
                break;
            case "remove":
                break;
            case "unblock":
                break;
            case "removeRequest":
                break;
            default:
                viewAll(request, response);
                break;
        }
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
        viewAll(request, response);
    }

    protected void viewAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");

        ArrayList<User> friends = Database.getFriendList(current);

        ArrayList<User> notFriends = new ArrayList<User>();
        for (User user : Database.getUserList(current)) {
            notFriends.add(user);
        }
        for (User user : Database.getBlockList(current)) {
            notFriends.add(user);
        }

        ArrayList<User> requested = new ArrayList<User>();
        for (User user : notFriends) {
            if (user.relation == 2) {
                notFriends.remove(user);
                requested.add(user);
            }
        }

        request.setAttribute("requested", requested);
        request.setAttribute("friends", friends);
        request.setAttribute("notFriends", notFriends);
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
