<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="Main.Database" %>
      <%@ page import="Main.User" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <title>Profile - Major's Comm</title>
          <meta property="og:title" content="Profile - Major's Comm" />
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
            <link href="/Profile/profile.css" rel="stylesheet" />
            <div class="profile-container1">
              <div class="profile-container2">
                <navloggedin-wrapper class="navloggedin-wrapper">
                  <div class="navloggedin-navloggedin">
                    <div class="navloggedin-logo" style="margin-left: 1.5vw;">
                      <span>
                        <fragment class="profile-fragment1">
                          <span class="profile-text1">Major's</span>
                        </fragment>
                      </span>
                      <span>
                        <fragment class="profile-fragment2">
                          <span class="profile-text2">
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
                        <svg viewBox="0 0 1024 1024" class="navloggedin-icon18">
                          <path
                            d="M170 214v596h342v86h-342q-34 0-59-26t-25-60v-596q0-34 25-60t59-26h342v86h-342zM726 298l212 214-212 214-60-62 110-110h-434v-84h434l-110-112z">
                          </path>
                        </svg>
                      </button>
                    </div>
                  </div>
                </navloggedin-wrapper>
                <edit-profile-component-wrapper class="edit-profile-component-wrapper">
                  <div class="edit-profile-component-container1 root-class-name">
                    <div class="edit-profile-component-root-form">
                      <div class="edit-profile-component-container2">
                        <form action="/profile" method="post" class="edit-profile-component-can-edit">
                          <img alt="image" src="/upload/profile/${user.id}.png" class="edit-profile-component-image" />
                          <button type="button" class="edit-profile-component-button1 button" id="updateProfileButton">
                            <svg viewBox="0 0 1097.142857142857 1024">
                              <path
                                d="M365.714 329.143c0 60.571-49.143 109.714-109.714 109.714s-109.714-49.143-109.714-109.714 49.143-109.714 109.714-109.714 109.714 49.143 109.714 109.714zM950.857 548.571v256h-804.571v-109.714l182.857-182.857 91.429 91.429 292.571-292.571zM1005.714 146.286h-914.286c-9.714 0-18.286 8.571-18.286 18.286v694.857c0 9.714 8.571 18.286 18.286 18.286h914.286c9.714 0 18.286-8.571 18.286-18.286v-694.857c0-9.714-8.571-18.286-18.286-18.286zM1097.143 164.571v694.857c0 50.286-41.143 91.429-91.429 91.429h-914.286c-50.286 0-91.429-41.143-91.429-91.429v-694.857c0-50.286 41.143-91.429 91.429-91.429h914.286c50.286 0 91.429 41.143 91.429 91.429z">
                              </path>
                            </svg>
                          </button>
                          <span class="edit-profile-component-full-name">
                            Full Name
                          </span>
                          <input type="text" placeholder="Full Name" name="fullName" value="${user.fullName}"
                            class="edit-profile-component-textinput1 input" />
                          <span class="edit-profile-component-date-of-birth">
                            Date of Birth
                          </span>
                          <input type="date" name="dob" value="${user.dob}"
                            class="edit-profile-component-textinput2 input" />
                          <button type="submit" name="action" value="update"
                            class="edit-profile-component-button2 button">
                            <svg viewBox="0 0 1024 1024">
                              <path
                                d="M640 384v-170h-426v170h426zM512 810q52 0 90-38t38-90-38-90-90-38-90 38-38 90 38 90 90 38zM726 128l170 170v512q0 34-26 60t-60 26h-596q-36 0-61-25t-25-61v-596q0-36 25-61t61-25h512z">
                              </path>
                            </svg>
                          </button>
                        </form>
                        <div class="edit-profile-component-container3">
                          <form class="edit-profile-component-form1" action="/profile" method="post">
                            <span class="edit-profile-component-uset-name">
                              Username
                            </span>
                            <input type="text" disabled="true" value="${user.username}""
                          class=" edit-profile-component-textinput3 input" />
                            <span class="edit-profile-component-email">
                              <span>Email</span>
                              <br />
                            </span>
                            <input type="text" disabled="true" value="${user.email}"
                              class="edit-profile-component-textinput4 input" />
                          </form>
                          <form class="edit-profile-component-form2" action="/profile" method="post">
                            <span class="edit-profile-component-password">
                              <span>Password</span>
                              <br />
                            </span>
                            <c:choose>
                              <c:when test="${passwordError == 1}">
                                <input type="password" required="true" placeholder="Passwords do not match"
                                  name="password" class="edit-profile-component-textinput5 input" />
                                <span class="edit-profile-component-cf-password">
                                  Confirm Password
                                </span>
                                <input type="password" placeholder="Passwords do not match" name="confirmPassword"
                                  class="edit-profile-component-textinput6 input" />
                              </c:when>
                              <c:otherwise>
                                <input type="password" required="true" placeholder="Password" name="password"
                                  class="edit-profile-component-textinput5 input" />
                                <span class="edit-profile-component-cf-password">
                                  Confirm Password
                                </span>
                                <input type="password" placeholder="Confirm Password" name="confirmPassword"
                                  class="edit-profile-component-textinput6 input" />
                              </c:otherwise>
                            </c:choose>
                            <button type="submit" name="action" value="update"
                              class="edit-profile-component-button3 button">
                              <svg viewBox="0 0 1024 1024">
                                <path
                                  d="M640 384v-170h-426v170h426zM512 810q52 0 90-38t38-90-38-90-90-38-90 38-38 90 38 90 90 38zM726 128l170 170v512q0 34-26 60t-60 26h-596q-36 0-61-25t-25-61v-596q0-36 25-61t61-25h512z">
                                </path>
                              </svg>
                            </button>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </edit-profile-component-wrapper>
              </div>
            </div>
          </div>
          <script>
            function getQueryParam(name) {
              const urlParams = new URLSearchParams(window.location.search);
              return urlParams.get(name);
            }

            const uid = getQueryParam('uid');

            function setupFileUpload(buttonId, actionValue) {
              const fileInput = document.createElement('input');
              fileInput.type = 'file';
              fileInput.name = 'file';
              fileInput.style.display = 'none';
              document.body.appendChild(fileInput);

              document.getElementById(buttonId).addEventListener('click', function () {
                fileInput.click();
              });

              fileInput.addEventListener('change', function () {
                if (this.files.length > 0) {
                  const form = document.createElement('form');
                  form.action = '/upload';
                  form.method = 'post';
                  form.enctype = 'multipart/form-data';
                  form.style.display = 'none';

                  const actionInput = document.createElement('input');
                  actionInput.type = 'hidden';
                  actionInput.name = 'action';
                  actionInput.value = actionValue;

                  const uidInput = document.createElement('input');
                  uidInput.type = 'hidden';
                  uidInput.name = 'uid';
                  uidInput.value = uid;

                  form.appendChild(fileInput);
                  form.appendChild(actionInput);
                  form.appendChild(uidInput);

                  document.body.appendChild(form);
                  form.submit();
                }
              });
            }

            setupFileUpload('updateProfileButton', 'updateProfile');
          </script>
          <script defer="" src="https://unpkg.com/@teleporthq/teleport-custom-scripts"></script>
        </body>

        </html>