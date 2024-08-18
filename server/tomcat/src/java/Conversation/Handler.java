package Conversation;

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
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        String id = request.getParameter("uid") == null ? "" : request.getParameter("uid");

        switch (action) {
            default:
                if (!id.equals(""))
                    loadMessages(request, response, id);
                viewAll(request, response);
                break;
        }
    }

    protected void loadMessages(HttpServletRequest request, HttpServletResponse response, String theirID)
            throws ServletException, IOException {
        int id = Integer.parseInt(theirID);
        User current = (User) request.getSession().getAttribute("user");
        ArrayList<Message> messages = Format.formatMessages(Database.getMessages(current.id, id));

        request.setAttribute("theirName", Database.getUser(id).fullname);
        request.setAttribute("messages", messages);
    }

    protected void viewAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");
        ArrayList<Preview> previews = Database.getPreview(current.id);

        request.setAttribute("previews", previews);
        request.getRequestDispatcher("/Chat/chat.jsp").forward(request, response);
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
