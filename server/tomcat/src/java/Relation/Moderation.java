package Relation;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Main.Database;
import java.util.ArrayList;
import Main.User;

public class Moderation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!Relation.Handler.checkModerator(request, response))
            return;

        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        switch (action) {
            case "setFriend":
                setFriend(request, response);
                break;
            case "deactivate":
                deactivate(request, response);
                break;
            case "activate":
                activate(request, response);
                break;
            default:
                viewAll(request, response);
        }
    }

    protected void viewAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<User> activated = Database.getActiveAccounts();
        ArrayList<User> deactivated = Database.getDeactivatedAccounts();
        request.setAttribute("activated", activated);
        request.setAttribute("deactivated", deactivated);
        request.getRequestDispatcher("/Manage/manage.jsp").forward(request, response);
    }

    protected void deactivate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int theirID = Integer.parseInt(request.getParameter("theirID"));
        Database.deactivateAccount(theirID);
        response.sendRedirect("/moderate");
    }

    protected void activate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int theirID = Integer.parseInt(request.getParameter("theirID"));
        Database.activateAccount(theirID);
        response.sendRedirect("/moderate");
    }

    protected void setFriend(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");
        int theirID = Integer.parseInt(request.getParameter("theirID"));
        Database.setFriend(current.id, theirID);
        response.sendRedirect("/moderate");
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
