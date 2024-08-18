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

    public static boolean checkPermission(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");
        if (current == null) {
            response.sendRedirect("/Auth/Login.jsp");
            return false;
        }
        return true;
    }

    public static boolean checkModerator(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");
        if (current == null) {
            response.sendRedirect("/Auth/Login.jsp");
            return false;
        }

        if (Database.checkRole(current.id) != 1) {
            response.sendRedirect("/chat");
            return false;
        }
        return true;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!Relation.Handler.checkPermission(request, response))
            return;

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
            case "deny":
                denyRequest(request, response);
                viewAll(request, response);
                break;
            case "searchRequest":
            case "searchBlock":
            case "searchUser":
            case "searchFriend":
            default:
                viewAll(request, response);
                break;
        }
    }

    public static void denyRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");
        int theirID = Integer.parseInt(request.getParameter("theirID"));
        int currentID = current.id;
        User them = Database.getUser(theirID);
        Database.removeFriendRequest(theirID, currentID);

        request.setAttribute("status", "Friend request removed from " + them.fullname);
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
        ArrayList<User> requests = new ArrayList<>();
        for (User user : received) {
            if (!friend.contains(user) && !blocked.contains(user)) {
                requests.add(user);
            }
        }
        for (User user : requested) {
            if (!friend.contains(user) && !blocked.contains(user)) {
                requests.add(user);
            }
        }

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "searchRequest":
                action = request.getParameter("requestSearch");
                for (int i = 0; i < requests.size(); i++) {
                    if (!requests.get(i).fullname.toLowerCase().contains(action.toLowerCase())) {
                        requests.remove(i);
                        i--;
                    }
                }
                break;
            case "searchBlock":
                action = request.getParameter("blockSearch");
                for (int i = 0; i < blocked.size(); i++) {
                    if (!blocked.get(i).fullname.toLowerCase().contains(action.toLowerCase())) {
                        blocked.remove(i);
                        i--;
                    }
                }
                break;
            case "searchUser":
                action = request.getParameter("userSearch");
                for (int i = 0; i < users.size(); i++) {
                    if (!users.get(i).fullname.toLowerCase().contains(action.toLowerCase())) {
                        users.remove(i);
                        i--;
                    }
                }
                break;
            case "searchFriend":
                action = request.getParameter("friendSearch");
                for (int i = 0; i < friend.size(); i++) {
                    if (!friend.get(i).fullname.toLowerCase().contains(action.toLowerCase())) {
                        friend.remove(i);
                        i--;
                    }
                }
                break;
        }

        request.setAttribute("friends", friend);
        request.setAttribute("blocked", blocked);
        request.setAttribute("users", users);
        request.setAttribute("requests", requests);
        request.getRequestDispatcher("/Relation/search.jsp").forward(request, response);
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
