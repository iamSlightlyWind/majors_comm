<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
        </head>

        <body>
            <p>Friends</p>
            <c:forEach var="friend" items="${friends}">
                <p>${friend}</p>
            </c:forEach>
            <p>Users</p>
            <c:forEach var="user" items="${notFriends}">
                <p>${user}</p>
            </c:forEach>
        </body>