package Auth;

import java.io.IOException;

import Main.Database;
import Main.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Handler extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action") != null ? request.getParameter("action") : "";

        switch (action) {
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
            case "addInfo":
                addInfo(request, response);
                break;
            case "recovery":
                recovery(request, response);
                break;
            default:
                request.getSession().invalidate();
                redirectDefault(request, response);
                break;
        }
    }

    public void recovery(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");

        User current = new User(username, email);
        if (Database.userExist(current) != 1) {
            sendError(request, response, "Invalid email or username", "/Auth/Recovery.jsp");
            return;
        }

        request.getSession().setAttribute("recoveryUser", current);
        request.getRequestDispatcher("Auth/Recovery.jsp").forward(request, response);
    }

    protected void addInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dob = request.getParameter("dob");
        String fullname = request.getParameter("fullname");
        int gender = Integer.parseInt(request.getParameter("gender"));

        User current = (User) request.getSession().getAttribute("registeringUser");
        current.dob = dob;
        current.fullname = fullname;
        current.gender = gender;

        if (Database.userExist(current) != 1) {
            sendError(request, response,
                    "Someone already created an account with these details in your process of registering",
                    "/Auth/Register.jsp");
            return;
        }

        Database.addUser(current);
    }

    protected void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String username = request.getParameter("username");

        if (!password.equals(confirm)) {
            sendError(request, response, "Passwords do not match", "/Auth/Register.jsp");
            return;
        }

        User current = new User(username, email, password);
        int exists = Database.userExist(current);
        String error = "";
        if (exists != 1) {
            if (exists == -1) {
                error = "Username already in use";
            } else if (exists == -2) {
                error = "Email already in use";
            }
            sendError(request, response, error, "/Auth/Register.jsp");
            return;
        }

        request.getSession().setAttribute("registeringUser", current);
        request.setAttribute("username", current.username);
        request.setAttribute("email", current.email);
        request.getRequestDispatcher("Auth/AddInfo.jsp").forward(request, response);

    }

    protected void sendError(HttpServletRequest request, HttpServletResponse response, String message, String site)
            throws ServletException, IOException {
        request.setAttribute("error", message);
        request.getRequestDispatcher(site).forward(request, response);
    }

    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User current = new User(login, password);
        if (current.login() == -1) {
            sendError(request, response, "Invalid login or password", "/Auth/Login.jsp");
            return;
        } else {
            current = Database.getUser(current.login());
        }

        request.getSession().setAttribute("user", current);
        response.sendRedirect("/relation");
    }

    protected void redirectDefault(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("/Auth/Login.jsp");
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
