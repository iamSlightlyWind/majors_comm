<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="Main.Database" %>
      <%@ page import="Main.User" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <title>Search - Major's Comm</title>
          <meta property="og:title" content="Search - Major's Comm" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <meta charset="utf-8" />
          <meta property="twitter:card" content="summary_large_image" />

          <style data-tag="reset-style-sheet">
            html {
              line-height: 1.15;
            }

            body {
              margin: 0;
            }

            * {
              box-sizing: border-box;
              border-width: 0;
              border-style: solid;
            }

            p,
            li,
            ul,
            pre,
            div,
            h1,
            h2,
            h3,
            h4,
            h5,
            h6,
            figure,
            blockquote,
            figcaption {
              margin: 0;
              padding: 0;
            }

            button {
              background-color: transparent;
            }

            button,
            input,
            optgroup,
            select,
            textarea {
              font-family: inherit;
              font-size: 100%;
              line-height: 1.15;
              margin: 0;
            }

            button,
            select {
              text-transform: none;
            }

            button,
            [type="button"],
            [type="reset"],
            [type="submit"] {
              -webkit-appearance: button;
            }

            button::-moz-focus-inner,
            [type="button"]::-moz-focus-inner,
            [type="reset"]::-moz-focus-inner,
            [type="submit"]::-moz-focus-inner {
              border-style: none;
              padding: 0;
            }

            button:-moz-focus,
            [type="button"]:-moz-focus,
            [type="reset"]:-moz-focus,
            [type="submit"]:-moz-focus {
              outline: 1px dotted ButtonText;
            }

            a {
              color: inherit;
              text-decoration: inherit;
            }

            input {
              padding: 2px 4px;
            }

            img {
              display: block;
            }

            html {
              scroll-behavior: smooth
            }
          </style>
          <style data-tag="default-style-sheet">
            html {
              font-family: Inter;
              font-size: 16px;
            }

            body {
              font-weight: 400;
              font-style: normal;
              text-decoration: none;
              text-transform: none;
              letter-spacing: normal;
              line-height: 1.15;
              color: var(--dl-color-theme-neutral-dark);
              background-color: var(--dl-color-theme-neutral-light);

              fill: var(--dl-color-theme-neutral-dark);
            }
          </style>
          <link rel="stylesheet" href="https://unpkg.com/animate.css@4.1.1/animate.css" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Inter:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Courgette:wght@400&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=STIX+Two+Text:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Satisfy:wght@400&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&amp;display=swap"
            data-tag="font" />
          <link rel="stylesheet" href="https://unpkg.com/@teleporthq/teleport-custom-scripts/dist/style.css" />
        </head>

        <body>
          <link rel="stylesheet" href="/Style/style.css" />
          <div>
            <link href="/Relation/search.css" rel="stylesheet" />

            <div class="search-container10">
              <div class="search-container11">
                <navloggedin-wrapper class="navloggedin-wrapper">
                  <div class="navloggedin-navloggedin">
                    <div class="navloggedin-logo" style="margin-left: 1.5vw;">
                      <span>
                        <fragment class="search-fragment1">
                          <span class="search-text10">Major's</span>
                        </fragment>
                      </span>
                      <span>
                        <fragment class="search-fragment2">
                          <span class="search-text11">
                            <span>Comm</span>
                            <br />
                          </span>
                        </fragment>
                      </span>
                    </div>
                    <div class="navloggedin-menu">
                      <button type="button" class="navloggedin-button1 button" onclick="window.location.href='/chat'">
                        <svg viewBox="0 0 1152 1024" class="navloggedin-icon10">
                          <path
                            d="M1088 901.166c0 45.5 26.028 84.908 64 104.184v15.938c-10.626 1.454-21.472 2.224-32.5 2.224-68.008 0-129.348-28.528-172.722-74.264-26.222 6.982-54.002 10.752-82.778 10.752-159.058 0-288-114.616-288-256s128.942-256 288-256c159.058 0 288 114.616 288 256 0 55.348-19.764 106.592-53.356 148.466-6.824 14.824-10.644 31.312-10.644 48.7zM512 0c278.458 0 504.992 180.614 511.836 405.52-49.182-21.92-103.586-33.52-159.836-33.52-95.56 0-185.816 33.446-254.138 94.178-70.846 62.972-109.862 147.434-109.862 237.822 0 44.672 9.544 87.888 27.736 127.788-5.228 0.126-10.468 0.212-15.736 0.212-27.156 0-53.81-1.734-79.824-5.044-109.978 109.978-241.25 129.7-368.176 132.596v-26.916c68.536-33.578 128-94.74 128-164.636 0-9.754-0.758-19.33-2.164-28.696-115.796-76.264-189.836-192.754-189.836-323.304 0-229.75 229.23-416 512-416z">
                          </path>
                        </svg>
                      </button>
                      <button type="button" class="navloggedin-button2 button"
                        onclick="window.location.href='/relation'">
                        <svg viewBox="0 0 1024 1024" class="navloggedin-icon12">
                          <path
                            d="M682 554q56 0 122 16t122 52 56 82v106h-256v-106q0-88-84-148 14-2 40-2zM342 554q56 0 122 16t121 52 55 82v106h-598v-106q0-46 56-82t122-52 122-16zM342 470q-52 0-90-38t-38-90 38-90 90-38 89 38 37 90-37 90-89 38zM682 470q-52 0-90-38t-38-90 38-90 90-38 90 38 38 90-38 90-90 38z">
                          </path>
                        </svg>
                      </button>
                      <% User current=(User) session.getAttribute("user"); if (Database.checkRole(current.id)==1) { %>
                        <button type="button" class="navloggedin-button3 button"
                          onclick="window.location.href='/moderate'">
                          <svg viewBox="0 0 1024 1024">
                            <path
                              d="M1002.934 817.876l-460.552-394.76c21.448-40.298 33.618-86.282 33.618-135.116 0-159.058-128.942-288-288-288-29.094 0-57.172 4.332-83.646 12.354l166.39 166.39c24.89 24.89 24.89 65.62 0 90.51l-101.49 101.49c-24.89 24.89-65.62 24.89-90.51 0l-166.39-166.39c-8.022 26.474-12.354 54.552-12.354 83.646 0 159.058 128.942 288 288 288 48.834 0 94.818-12.17 135.116-33.62l394.76 460.552c22.908 26.724 62.016 28.226 86.904 3.338l101.492-101.492c24.888-24.888 23.386-63.994-3.338-86.902z">
                            </path>
                          </svg>
                        </button>
                        <button type="button" class="navloggedin-button4 button"
                          onclick="window.location.href='/stats'">
                          <svg viewBox="0 0 1024 1024">
                            <path
                              d="M128 896h896v128h-1024v-1024h128zM288 832c-53.020 0-96-42.98-96-96s42.98-96 96-96c2.828 0 5.622 0.148 8.388 0.386l103.192-171.986c-9.84-15.070-15.58-33.062-15.58-52.402 0-53.020 42.98-96 96-96s96 42.98 96 96c0 19.342-5.74 37.332-15.58 52.402l103.192 171.986c2.766-0.238 5.56-0.386 8.388-0.386 2.136 0 4.248 0.094 6.35 0.23l170.356-298.122c-10.536-15.408-16.706-34.036-16.706-54.11 0-53.020 42.98-96 96-96s96 42.98 96 96c0 53.020-42.98 96-96 96-2.14 0-4.248-0.094-6.35-0.232l-170.356 298.124c10.536 15.406 16.706 34.036 16.706 54.11 0 53.020-42.98 96-96 96s-96-42.98-96-96c0-19.34 5.74-37.332 15.578-52.402l-103.19-171.984c-2.766 0.238-5.56 0.386-8.388 0.386s-5.622-0.146-8.388-0.386l-103.192 171.986c9.84 15.068 15.58 33.060 15.58 52.4 0 53.020-42.98 96-96 96z">
                            </path>
                          </svg>
                        </button>
                        <% } %>
                    </div>
                    <div class="navloggedin-footer">
                      <button type="button" class="navloggedin-button4 button"
                        onclick="window.location.href='/profile'">
                        <svg viewBox="0 0 1024 1024" class="navloggedin-icon14">
                          <path
                            d="M576 706.612v-52.78c70.498-39.728 128-138.772 128-237.832 0-159.058 0-288-192-288s-192 128.942-192 288c0 99.060 57.502 198.104 128 237.832v52.78c-217.102 17.748-384 124.42-384 253.388h896c0-128.968-166.898-235.64-384-253.388z">
                          </path>
                        </svg>
                      </button>
                      <button type="button" class="navloggedin-button5 button">
                        <svg viewBox="0 0 1024 1024">
                          <path
                            d="M853.342 0h-682.656c-93.874 0-170.686 76.81-170.686 170.69v682.622c0 93.938 76.812 170.688 170.686 170.688h682.656c93.876 0 170.658-76.75 170.658-170.69v-682.62c0-93.88-76.782-170.69-170.658-170.69zM853.342 128c7.988 0 15.546 2.334 22.020 6.342l-363.362 300.404-363.354-300.4c6.478-4.010 14.044-6.346 22.040-6.346h682.656zM170.686 896c-1.924 0-3.82-0.146-5.684-0.408l225.626-312.966-29.256-29.254-233.372 233.37v-611.138l384 464.396 384-464.394v611.136l-233.372-233.37-29.254 29.254 225.628 312.968c-1.858 0.26-3.746 0.406-5.662 0.406h-682.654z">
                          </path>
                        </svg>
                      </button>
                      <button type="button" class="navloggedin-button6 button"
                        onclick="window.location.href='/auth?action=logout'">
                        <svg viewBox="0 0 1024 1024" class="navloggedin-icon20">
                          <path
                            d="M170 214v596h342v86h-342q-34 0-59-26t-25-60v-596q0-34 25-60t59-26h342v86h-342zM726 298l212 214-212 214-60-62 110-110h-434v-84h434l-110-112z">
                          </path>
                        </svg>
                      </button>
                    </div>
                  </div>
                </navloggedin-wrapper>
                <div class="search-container12">
                  <div class="search-friend-container1">
                    <div class="search-container13">
                      <div class="search-container14">
                        <span class="search-text14">
                          <span>Friends</span>
                          <br />
                        </span>
                      </div>
                      <form class="search-search-form1">
                        <input type="text" placeholder="Search for friends" name="friendSearch" value="${friendSearch}"
                          class="search-textinput1 input" />
                        <button type="submit" name="action" value="searchFriend" style="visibility: hidden;"></button>
                      </form>
                      <c:forEach var="friend" items="${friends}">
                        <form class="search-found-form1" action="/relation" method="post"
                          onclick="window.location.href='/chat?uid=${friend.id}'">
                          <input type="hidden" name="theirID" value="${friend.id}" />
                          <div class="search-container15">
                            <img src="/upload/profile/${friend.id}.png" alt="image" class="search-image1" />
                            <span class="search-text17" style="width: 8vw;">${friend.fullName}</span>
                            <div class="search-container16">
                              <button type="submit" name="action" value="remove" class="search-button1 button">
                                Remove
                              </button>
                              <button type="submit" name="action" value="block" class="search-button2 button">
                                Block
                              </button>
                            </div>
                          </div>
                        </form>
                      </c:forEach>
                    </div>
                  </div>
                  <div class="search-request-container">
                    <div class="search-container17">
                      <div class="search-container18">
                        <span class="search-text18">
                          <span>Requests</span>
                          <br />
                        </span>
                      </div>
                      <form class="search-search-form2">
                        <input type="text" placeholder="Search for requests" name="requestSearch"
                          value="${requestSearch}" class="search-textinput2 input" />
                        <button type="submit" name="action" value="searchRequest" style="visibility: hidden;"></button>
                      </form>
                      <c:forEach var="request" items="${requests}">
                        <form class="search-requested-form">
                          <div class="search-container19">
                            <img src="/upload/profile/${request.id}.png" alt="image" class="search-image2" />
                            <span class="search-text21" style="width: 8vw;">${request.fullName}</span>
                            <input type="hidden" name="theirID" value="${request.id}" />
                            <div class="search-container20">
                              <c:if test="${request.relation == 2}">
                                <button type="submit" name="action" value="removeRequest" class="search-button3 button">
                                  Remove
                                </button>
                              </c:if>
                              <c:if test="${request.relation == 3}">
                                <button type="submit" name="action" value="add" class="search-button1 button">
                                  Accept
                                </button>
                                <button type="submit" name="action" value="deny" class="search-button2 button">
                                  Deny
                                </button>
                              </c:if>
                            </div>
                          </div>
                        </form>
                      </c:forEach>
                    </div>
                  </div>
                  <div class="search-friend-container2">
                    <div class="search-container23">
                      <div class="search-container24">
                        <span class="search-text23">
                          <span>Blocked</span>
                          <br />
                        </span>
                      </div>
                      <form class="search-search-form3">
                        <input type="text" placeholder="Search in blocked" name="blockSearch" value="${blockSearch}"
                          class="search-textinput3 input" />
                        <button type="submit" name="action" value="searchBlock" style="visibility: hidden;"></button>
                      </form>
                      <c:forEach var="blocked" items="${blocked}">
                        <form class="search-found-form2">
                          <div class="search-container25">
                            <img src="/upload/profile/${blocked.id}.png" alt="image" class="search-image4" />
                            <span class="search-text26" style="width: 8vw;">${blocked.fullName}</span>
                            <input type="hidden" name="theirID" value="${blocked.id}" />
                            <div class="search-container26">
                              <button type="submit" name="action" value="unblock" class="search-button5 button">
                                Unblock
                              </button>
                            </div>
                          </div>
                        </form>
                      </c:forEach>
                    </div>
                  </div>
                  <div class="search-friend-container3">
                    <div class="search-container27">
                      <div class="search-container28">
                        <span class="search-text27">
                          <span>Users</span>
                          <br />
                        </span>
                      </div>
                      <form class="search-search-form4">
                        <input type="text" placeholder="Search for users" name="userSearch" value="${userSearch}"
                          class="search-textinput4 input" />
                        <button type="submit" name="action" value="searchUser" style="visibility: hidden;"></button>
                      </form>
                      <c:forEach var="user" items="${users}">
                        <form class="search-found-form3">
                          <input type="hidden" name="theirID" value="${user.id}" />
                          <div class="search-container29">
                            <img src="/upload/profile/${user.id}.png" alt="image" class="search-image5" />
                            <span class="search-text30" style="width: 8vw;">${user.fullName}</span>
                            <div class="search-container30">
                              <button type="submit" name="action" value="add" class="search-button6 button">
                                Request
                              </button>
                              <button type="submit" name="action" value="block" class="search-button7 button">
                                Block
                              </button>
                            </div>
                          </div>
                        </form>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <script defer="" src="https://unpkg.com/@teleporthq/teleport-custom-scripts"></script>
        </body>

        </html>