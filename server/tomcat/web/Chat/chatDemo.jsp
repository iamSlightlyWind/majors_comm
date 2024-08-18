<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
        </head>

        <body>
            <p>Chat</p>
            <c:forEach var="message" items="${messages}">
                <c:if test="${message.isMine}">
                    <p>You: ${message.content}</p>
                </c:if>
                <c:if test="${!message.isMine}">
                    <p>Them: ${message.content}</p>
                </c:if>
            </c:forEach>

            <br>
            <p>Preview</p>
            <c:forEach var="preview" items="${previews}">
                <a href="/chat?id=${preview.theirID}">${preview.theirName}</a>
                <p>${preview.message}</p>
            </c:forEach>
        </body>

        </html>

        <chat-list-item-wrapper class="chat-list-item-chat-list-item-wrapper">
            <div class="chat-list-item-chat-list-item">
              <form class="chat-list-item-form">
                <img alt="image" src="https://play.teleporthq.io/static/svg/default-img.svg"
                  class="chat-list-item-image" />
                <div class="chat-list-item-container">
                  <div class="chat-list-item-username-box">
                    <span>
                      <fragment class="chat-fragment3">
                        <span class="chat-text17">
                          Pham Thanh Phong
                        </span>
                      </fragment>
                    </span>
                  </div>
                  <div class="chat-list-item-user-chat-box">
                    <span>
                      <fragment class="chat-fragment4">
                        <span class="chat-text18">
                          You: What the fuck took you so long bro
                        </span>
                      </fragment>
                    </span>
                  </div>
                </div>
              </form>
            </div>
          </chat-list-item-wrapper>