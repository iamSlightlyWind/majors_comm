<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="Main.Database" %>
      <%@ page import="Main.User" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <title>Satistics - Major's Comm</title>
          <meta property="og:title" content="Satistics - Major's Comm" />
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
            <link href="/Stats/statistics.css" rel="stylesheet" />

            <div class="satistics-container1">
              <div class="satistics-container2">
                <navloggedin-wrapper class="navloggedin-wrapper">
                  <div class="navloggedin-navloggedin">
                    <div class="navloggedin-logo" style="margin-left: 1.5vw;">
                      <span>
                        <fragment class="satistics-fragment1">
                          <span class="satistics-text10">Major's</span>
                        </fragment>
                      </span>
                      <span>
                        <fragment class="satistics-fragment2">
                          <span class="satistics-text11">
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
                      <button type="button" class="navloggedin-button5 button"
                        onclick="window.location.href='/profile'">
                        <svg viewBox="0 0 1024 1024" class="navloggedin-icon18">
                          <path
                            d="M576 706.612v-52.78c70.498-39.728 128-138.772 128-237.832 0-159.058 0-288-192-288s-192 128.942-192 288c0 99.060 57.502 198.104 128 237.832v52.78c-217.102 17.748-384 124.42-384 253.388h896c0-128.968-166.898-235.64-384-253.388z">
                          </path>
                        </svg>
                      </button>
                      <button type="button" class="navloggedin-button6 button">
                        <svg viewBox="0 0 1024 1024">
                          <path
                            d="M853.342 0h-682.656c-93.874 0-170.686 76.81-170.686 170.69v682.622c0 93.938 76.812 170.688 170.686 170.688h682.656c93.876 0 170.658-76.75 170.658-170.69v-682.62c0-93.88-76.782-170.69-170.658-170.69zM853.342 128c7.988 0 15.546 2.334 22.020 6.342l-363.362 300.404-363.354-300.4c6.478-4.010 14.044-6.346 22.040-6.346h682.656zM170.686 896c-1.924 0-3.82-0.146-5.684-0.408l225.626-312.966-29.256-29.254-233.372 233.37v-611.138l384 464.396 384-464.394v611.136l-233.372-233.37-29.254 29.254 225.628 312.968c-1.858 0.26-3.746 0.406-5.662 0.406h-682.654z">
                          </path>
                        </svg>
                      </button>
                      <button type="button" class="navloggedin-button7 button"
                        onclick="window.location.href='/auth?action=logout'">
                        <svg viewBox="0 0 1024 1024" class="navloggedin-icon22">
                          <path
                            d="M170 214v596h342v86h-342q-34 0-59-26t-25-60v-596q0-34 25-60t59-26h342v86h-342zM726 298l212 214-212 214-60-62 110-110h-434v-84h434l-110-112z">
                          </path>
                        </svg>
                      </button>
                    </div>
                  </div>
                </navloggedin-wrapper>
                <div class="satistics-container3">
                  <div class="satistics-friend-container">
                    <div class="satistics-container4">
                      <div class="satistics-container5">
                        <span class="satistics-text14">
                          <span>Statistics</span>
                          <br />
                        </span>
                      </div>
                      <form class="satistics-form-tittle" action="/stats" method="get">
                        <div class="satistics-container6">
                          <span class="satistics-text17">From Date</span>
                          <input type="date" name="dateFrom" class="satistics-textinput1 input" />
                        </div>
                        <div class="satistics-container7">
                          <span class="satistics-text18">To Date</span>
                          <input type="date" placeholder="placeholder" name="dateTo"
                            class="satistics-textinput2 input" />
                        </div>
                        <button type="submit" name="action" value="fetch" class="satistics-button1 button">
                          <svg viewBox="0 0 1024 1024" class="satistics-icon10">
                            <path
                              d="M406 598q80 0 136-56t56-136-56-136-136-56-136 56-56 136 56 136 136 56zM662 598l212 212-64 64-212-212v-34l-12-12q-76 66-180 66-116 0-197-80t-81-196 81-197 197-81 196 81 80 197q0 42-20 95t-46 85l12 12h34z">
                            </path>
                          </svg>
                        </button>
                      </form>
                      <div class="satistics-control">
                        <button type="button" class="satistics-button2 button">
                          <svg viewBox="0 0 1024 1024" class="satistics-icon12">
                            <path
                              d="M896 298.667h-128c0-70.4-57.6-128-128-128h-512c-70.4 0-128 57.6-128 128v298.667c0 70.4 57.6 128 128 128v128l128-128c0 70.4 57.6 128 128 128h341.333l128 128v-128h42.667c70.4 0 128-57.6 128-128v-298.667c0-70.4-57.6-128-128-128zM128 640c-23.125 0-42.667-19.541-42.667-42.667v-298.667c0-23.125 19.541-42.667 42.667-42.667h512c23.125 0 42.667 19.541 42.667 42.667v42.667h-277.333c-58.837 0-106.667 47.829-106.667 106.667v192h-170.667zM938.667 725.333c0 23.125-19.541 42.667-42.667 42.667h-512c-23.125 0-42.667-19.541-42.667-42.667v-277.333c0-35.285 28.715-64 64-64h490.667c23.125 0 42.667 19.541 42.667 42.667v298.667z">
                            </path>
                          </svg>
                          <span class="satistics-text19">Total Messages</span>
                          <span class="satistics-text20">${totalMessages} Messages</span>
                        </button>
                        <button type="button" class="satistics-button3 button">
                          <svg viewBox="0 0 1024 1024" class="satistics-icon14">
                            <path
                              d="M768 256h-554.667c-70.4 0-128 57.6-128 128v298.667c0 70.4 57.6 128 128 128h42.667v128l128-128h384c70.4 0 128-57.6 128-128v-298.667c0-70.4-57.6-128-128-128zM810.667 682.667c0 23.125-19.541 42.667-42.667 42.667h-554.667c-23.125 0-42.667-19.541-42.667-42.667v-298.667c0-23.125 19.541-42.667 42.667-42.667h554.667c23.125 0 42.667 19.541 42.667 42.667v298.667z">
                            </path>
                            <path
                              d="M298.667 618.667c-47.104 0-85.333-38.229-85.333-85.333s38.229-85.333 85.333-85.333 85.333 38.229 85.333 85.333-38.229 85.333-85.333 85.333zM298.667 490.667c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667 42.667-19.115 42.667-42.667-19.115-42.667-42.667-42.667z">
                            </path>
                            <path
                              d="M490.667 618.667c-47.104 0-85.333-38.229-85.333-85.333s38.229-85.333 85.333-85.333 85.333 38.229 85.333 85.333-38.229 85.333-85.333 85.333zM490.667 490.667c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667 42.667-19.115 42.667-42.667-19.115-42.667-42.667-42.667z">
                            </path>
                            <path
                              d="M682.667 618.667c-47.104 0-85.333-38.229-85.333-85.333s38.229-85.333 85.333-85.333 85.333 38.229 85.333 85.333-38.229 85.333-85.333 85.333zM682.667 490.667c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667 42.667-19.115 42.667-42.667-19.115-42.667-42.667-42.667z">
                            </path>
                          </svg>
                          <span class="satistics-text21">Messages / User</span>
                          <span class="satistics-text22">${totalUsers} Messages</span>
                        </button>
                        <button type="button" class="satistics-button4 button">
                          <svg viewBox="0 0 1024 1024" class="satistics-icon19">
                            <path
                              d="M938.667 469.333h-170.667c-18.731 0-34.645 12.075-40.491 29.184l-87.509 262.571-215.509-646.571c-7.467-22.357-31.616-34.432-53.973-27.008-13.227 4.395-22.827 14.635-27.008 27.008l-118.272 354.816h-139.904c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667h170.667c18.048-0.128 34.56-11.392 40.491-29.184l87.509-262.571 215.509 646.571c4.181 12.373 13.781 22.571 26.965 26.965 22.357 7.467 46.507-4.651 53.973-26.965l118.315-354.816h139.904c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667z">
                            </path>
                          </svg>
                          <span class="satistics-text23">Active Users</span>
                          <span class="satistics-text24">${activated} Users</span>
                        </button>
                        <button type="button" class="satistics-button5 button">
                          <svg viewBox="0 0 877.7142857142857 1024" class="satistics-icon21">
                            <path
                              d="M749.714 510.286c0-62.286-18.286-120-49.714-168.571l-430.857 430.286c49.143 32 107.429 50.857 169.714 50.857 171.429 0 310.857-140 310.857-312.571zM178.857 681.143l431.429-430.857c-49.143-33.143-108-52-171.429-52-171.429 0-310.857 140-310.857 312 0 63.429 18.857 121.714 50.857 170.857zM877.714 510.286c0 243.429-196.571 440.571-438.857 440.571s-438.857-197.143-438.857-440.571c0-242.857 196.571-440 438.857-440s438.857 197.143 438.857 440z">
                            </path>
                          </svg>
                          <span class="satistics-text25">Diactivated Users</span>
                          <span class="satistics-text26">${deactivated} Users</span>
                        </button>
                        <button type="button" class="satistics-button6 button">
                          <svg viewBox="0 0 1024 1024" class="satistics-icon23">
                            <path
                              d="M598 512h234l-234-234v234zM640 214l256 256v426q0 34-26 60t-60 26h-470q-34 0-59-26t-25-60v-598q0-34 26-59t60-25h298zM682 42v86h-512v598h-84v-598q0-34 25-60t59-26h512z">
                            </path>
                          </svg>
                          <span class="satistics-text27">Total Files</span>
                          <span class="satistics-text28">${files} files</span>
                        </button>
                        <button type="button" class="satistics-button7 button">
                          <svg viewBox="0 0 1152 1024" class="satistics-icon25">
                            <path
                              d="M1088 128h-64v-64c0-35.2-28.8-64-64-64h-896c-35.2 0-64 28.8-64 64v768c0 35.2 28.8 64 64 64h64v64c0 35.2 28.8 64 64 64h896c35.2 0 64-28.8 64-64v-768c0-35.2-28.8-64-64-64zM128 192v640h-63.886c-0.040-0.034-0.082-0.076-0.114-0.116v-767.77c0.034-0.040 0.076-0.082 0.114-0.114h895.77c0.040 0.034 0.082 0.076 0.116 0.116v63.884h-768c-35.2 0-64 28.8-64 64v0zM1088 959.884c-0.034 0.040-0.076 0.082-0.116 0.116h-895.77c-0.040-0.034-0.082-0.076-0.114-0.116v-767.77c0.034-0.040 0.076-0.082 0.114-0.114h895.77c0.040 0.034 0.082 0.076 0.116 0.116v767.768z">
                            </path>
                            <path d="M960 352c0 53.020-42.98 96-96 96s-96-42.98-96-96 42.98-96 96-96 96 42.98 96 96z">
                            </path>
                            <path d="M1024 896h-768v-128l224-384 256 320h64l224-192z"></path>
                          </svg>
                          <span class="satistics-text29">Total Images</span>
                          <span class="satistics-text30">${images} Images</span>
                        </button>
                        <button type="button" class="satistics-button8 button">
                          <svg viewBox="0 0 1024 1024" class="satistics-icon29">
                            <path
                              d="M298 128v86h-84v-86h84zM470 128v86h-86v-86h86zM128 470v84h-86v-84h86zM128 128v86h-86q0-32 27-59t59-27zM810 810v86h-84v-86h84zM810 128v86h-84v-86h84zM640 810v86h-86v-86h86zM128 298v86h-86v-86h86zM128 896q-34 0-60-26t-26-60v-170h428v256h-342zM896 128q32 0 59 27t27 59h-86v-86zM982 298v86h-86v-86h86zM640 128v86h-86v-86h86zM982 810q0 32-27 59t-59 27v-86h86zM982 470v84h-86v-84h86zM982 640v86h-86v-86h86z">
                            </path>
                          </svg>
                          <span class="satistics-text31">Total Size</span>
                          <span class="satistics-text32">${size} MB</span>
                        </button>
                        <button type="button" class="satistics-button9 button">
                          <svg viewBox="0 0 804.5714285714286 1024" class="satistics-icon31">
                            <path
                              d="M219.429 768c0 20-16.571 36.571-36.571 36.571s-36.571-16.571-36.571-36.571 16.571-36.571 36.571-36.571 36.571 16.571 36.571 36.571zM804.571 802.857c0 93.143-61.143 148-152.571 148h-499.429c-91.429 0-152.571-54.857-152.571-148 0-113.714 22.857-293.143 158.857-322.857-9.143 21.714-12.571 45.143-12.571 68.571v116c-44 15.429-73.143 57.143-73.143 103.429 0 60.571 49.143 109.714 109.714 109.714s109.714-49.143 109.714-109.714c0-46.286-29.714-88-73.143-103.429v-116c0-18.857 1.714-37.714 14.286-53.143 48 37.714 107.429 59.429 168.571 59.429s120.571-21.714 168.571-59.429c12.571 15.429 14.286 34.286 14.286 53.143v36.571c-80.571 0-146.286 65.714-146.286 146.286v50.857c-11.429 10.286-18.286 25.143-18.286 40.571 0 30.286 24.571 54.857 54.857 54.857s54.857-24.571 54.857-54.857c0-15.429-6.857-30.286-18.286-40.571v-50.857c0-40 33.143-73.143 73.143-73.143s73.143 33.143 73.143 73.143v50.857c-11.429 10.286-18.286 25.143-18.286 40.571 0 30.286 24.571 54.857 54.857 54.857s54.857-24.571 54.857-54.857c0-15.429-6.857-30.286-18.286-40.571v-50.857c0-52-28-100.571-73.143-126.286 0-41.714 4-86.286-12.571-125.143 136 29.714 158.857 209.143 158.857 322.857zM621.714 292.571c0 121.143-98.286 219.429-219.429 219.429s-219.429-98.286-219.429-219.429 98.286-219.429 219.429-219.429 219.429 98.286 219.429 219.429z">
                            </path>
                          </svg>
                          <span class="satistics-text33">Moderators</span>
                          <span class="satistics-text34">5 Moderators</span>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <script defer="" src="https://unpkg.com/@teleporthq/teleport-custom-scripts"></script>
        </body>

        </html>