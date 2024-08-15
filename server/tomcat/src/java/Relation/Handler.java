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
                break;
            case "block":
                break;
            case "remove":
                break;
            case "unblock":
                break;
            default:
                viewAll(request, response);
                System.out.println("default");
                break;
        }
    }

    protected void viewAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");
        ArrayList<User> friends = Database.getFriendList(current);
        ArrayList<User> users = Database.getUserList(current);
        ArrayList<User> blocks = Database.getBlockList(current);

        ArrayList<User> notFriends = new ArrayList<User>();
        for (User user : users) {
            notFriends.add(user);
        }
        for (User user : blocks) {
            notFriends.add(user);
        }

        System.out.println(notFriends);

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
