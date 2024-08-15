<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
        </head>

        <body>
            <p>Friends</p>
            <p>${status}</p>
            <c:forEach var="friend" items="${friends}">
                <form action="/relation" method="post">
                    <p>${friend}</p>
                    <input type="hidden" name="theirID" value="${friend.id}" />
                    <input type="submit" name="action" value="remove" />
                    <input type="submit" name="action" value="block" />
                </form>
                <br>
            </c:forEach>
            <p>Users</p>
            <c:forEach var="user" items="${notFriends}">
                <form action="/relation" method="post">
                    <p>${user}</p>
                    <input type="hidden" name="theirID" value="${user.id}" />
                    <input type="submit" name="action" value="add" />
                    <input type="submit" name="action" value="block" />
                    <input type="submit" name="action" value="unblock" />
                </form>
                <br>
            </c:forEach>
            <p>Requested</p>
            <c:forEach var="requestee" items="${requested}">
                <form action="/relation" method="post">
                    <p>${requestee}</p>
                    <input type="hidden" name="theirID" value="${requestee.id}" />
                    <input type="submit" name="action" value="accept" />
                    <input type="submit" name="action" value="reject" />
                </form>
                <br>
            </c:forEach>
        </body>