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
            default:
                viewProfile(request, response);
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
        String fullname = request.getParameter("fullName");
        String dob = request.getParameter("dob");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!fullname.equals("")) {
            current.fullname = fullname;
        }

        if (!dob.equals("")) {
            current.dob = dob;
        }

        if (password != null && confirmPassword != null && password.equals(confirmPassword)) {
            current.password = password;
        } else {
            request.setAttribute("passwordError", 1);
        }

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
