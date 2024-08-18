package Profile;

import java.io.IOException;

import Main.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Handler extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        switch (action) {
            case "update":
                updateProfile(request, response);
                System.out.println("Profile updated");
            default:
                viewProfile(request, response);
                System.out.println("Profile viewed");
                break;
        }
    }

    protected void viewProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");

        request.setAttribute("user", current);
        request.getRequestDispatcher("Profile/profile.jsp").forward(request, response);
    }

    protected void updateProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User current = (User) request.getSession().getAttribute("user");
        current.fullname = request.getParameter("fullname");
        current.dob = request.getParameter("dob");
        current.password = request.getParameter("password");

        current.updateProfile();
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
