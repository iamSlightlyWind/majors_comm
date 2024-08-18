package Stats;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import Main.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.Date;

public class Handler extends HttpServlet {

    public int files;
    public int images;
    public double size;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!Relation.Handler.checkModerator(request, response))
            return;

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        String dateFrom = request.getParameter("dateFrom");
        String dateTo = request.getParameter("dateTo");

        switch (action) {
            case "fetch":
                view(request, response, dateFrom, dateTo);
                break;
            default:
                view(request, response, null, null);
                break;
        }
    }

    protected void scan(HttpServletRequest request) {
        String dateFrom = request.getParameter("dateFrom");
        String dateTo = request.getParameter("dateTo");
    
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date fromDate = null;
        Date toDate = null;
        try {
            if (dateFrom != null && !dateFrom.isEmpty()) {
                fromDate = dateFormat.parse(dateFrom);
            }
            if (dateTo != null && !dateTo.isEmpty()) {
                toDate = dateFormat.parse(dateTo);
            }
        } catch (ParseException e) {
            e.printStackTrace();
            return;
        }
    
        String applicationPath = request.getServletContext().getRealPath("") + "/upload";
        File files = new File(applicationPath + "/file");
        File images = new File(applicationPath + "/image");
        File profilePics = new File(applicationPath + "/profile");
    
        this.files = 0;
        this.images = 0;
        this.size = 0;
    
        File[] fileList = files.listFiles();
        File[] imageList = images.listFiles();
        File[] profilePicList = profilePics.listFiles();
    
        if (fileList != null) {
            for (File file : fileList) {
                if (isWithinDateRange(file, fromDate, toDate)) {
                    this.files++;
                    this.size += file.length();
                }
            }
        }
    
        if (imageList != null) {
            for (File image : imageList) {
                if (isWithinDateRange(image, fromDate, toDate)) {
                    this.images++;
                    this.size += image.length();
                }
            }
        }
    
        if (profilePicList != null) {
            for (File profilePic : profilePicList) {
                if (isWithinDateRange(profilePic, fromDate, toDate)) {
                    this.images++;
                    this.size += profilePic.length();
                }
            }
        }
    
        this.size = Math.round((this.size / 1048576.0) * 100.0) / 100.0;
    }
    
    private boolean isWithinDateRange(File file, Date fromDate, Date toDate) {
        long lastModified = file.lastModified();
        if (fromDate != null && lastModified < fromDate.getTime()) {
            return false;
        }
        if (toDate != null && lastModified > toDate.getTime()) {
            return false;
        }
        return true;
    }

    protected void view(HttpServletRequest request, HttpServletResponse response, String dateFrom, String dateTo)
            throws ServletException, IOException {
        scan(request);
        int totalMessages = Database.getTotalMessages(dateFrom, dateTo);
        int totalUsers = Database.getTotalUsers();
        int messagePer = totalMessages / totalUsers;
        int activated = Database.getActiveAccounts().size();
        int deactivated = Database.getDeactivatedAccounts().size();
        int moderators = Database.getTotalModerators();

        request.setAttribute("files", this.files);
        request.setAttribute("images", this.images);
        request.setAttribute("size", this.size);
        request.setAttribute("totalMessages", totalMessages);
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("messagePer", messagePer);
        request.setAttribute("activated", activated);
        request.setAttribute("deactivated", deactivated);
        request.setAttribute("moderators", moderators);
        request.getRequestDispatcher("/Stats/statistics.jsp").forward(request, response);
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
