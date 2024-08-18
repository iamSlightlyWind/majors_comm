package Main;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
public class Upload extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        System.out.println(">>> Action: " + action);

        switch (action) {
            case "updateProfile":
                updateProfile(request, response);
                break;
            case "uploadFile":
                uploadFile(request, response);
                break;
            case "uploadImage":
                uploadImage(request, response);
                break;
            case "download":
                downloadFile(request, response);
                break;
        }
    }

    protected void downloadFile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String content = request.getParameter("file");
        String dateFolder = content.split("/")[0];
        String fileName = content.split("/")[1];
        String applicationPath = request.getServletContext().getRealPath("");
        String downloadDirPath = applicationPath + File.separator + "upload/file" + File.separator + dateFolder
                + File.separator + fileName;

        File file = new File(downloadDirPath);
        if (file.exists()) {
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

            try (InputStream fileInputStream = Files.newInputStream(file.toPath())) {
                int i;
                while ((i = fileInputStream.read()) != -1) {
                    response.getWriter().write(i);
                }
            }
        }
    }

    protected void uploadFile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String applicationPath = request.getServletContext().getRealPath("");
        String dateFolder = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        String uploadDirPath = applicationPath + File.separator + "upload/file" + File.separator + dateFolder;

        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        File uploadDir = new File(uploadDirPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        File file = new File(uploadDirPath + File.separator + fileName);
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, file.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        }

        User user = (User) request.getSession().getAttribute("user");
        int theirID = Integer.parseInt(request.getParameter("uid"));
        Database.sendFileMessage(user.id, theirID, dateFolder + "/" + fileName);
        response.sendRedirect("/chat?uid=" + theirID);
    }

    protected void uploadImage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int theirID = Integer.parseInt(request.getParameter("uid"));
        String applicationPath = request.getServletContext().getRealPath("");

        String dateFolder = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        String uploadDirPath = applicationPath + File.separator + "upload/images" + File.separator + dateFolder;

        Part filePart = request.getPart("file");
        String contentType = filePart.getContentType();

        if (contentType != null && contentType.startsWith("image/")) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            File uploadDir = new File(uploadDirPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            File file = new File(uploadDirPath + File.separator + fileName);
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, file.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            }
            Database.sendImageMessage(user.id, theirID, dateFolder + "/" + fileName);
        }
        response.sendRedirect("/chat?uid=" + theirID);
    }

    protected void updateProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadDirPath = applicationPath + File.separator + "upload/profile";
        User user = (User) request.getSession().getAttribute("user");

        Part filePart = request.getPart("file");
        String contentType = filePart.getContentType();

        if (contentType != null && contentType.startsWith("image/")) {
            File uploadDir = new File(uploadDirPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            String newFileName = user.id + ".png";
            File file = new File(uploadDirPath + File.separator + newFileName);
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, file.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            }
        }
        response.sendRedirect("/profile");
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