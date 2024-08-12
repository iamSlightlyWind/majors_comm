<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <title>Register - Major's Comm</title>
      <meta property="og:title" content="Register - Major's Comm" />
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
        href="https://fonts.googleapis.com/css2?family=Inter:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
        data-tag="font" />
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Courgette:wght@400&amp;display=swap"
        data-tag="font" />
      <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
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
      <link rel="stylesheet" href="https://unpkg.com/@teleporthq/teleport-custom-scripts/dist/style.css" />
    </head>

    <body>
      <link rel="stylesheet" href="../Style/style.css" />
      <div>
        <link href="./AddInfo.css" rel="stylesheet" />

        <div class="authentication-add-info-container">
          <navguest-wrapper>
            <div class="navguest-container navguest-root-class-name2">
              <header data-thq="thq-navbar" class="navguest-navbar-interactive">
                <div class="navguest-container1">
                  <span>
                    <fragment class="authentication-add-info-fragment08" style="font-family: Satisfy">
                      <span>Major's</span>
                    </fragment>
                  </span>
                  <span>
                    <fragment class="authentication-add-info-fragment11" style="font-family: Satisfy">
                      <span>Comm</span>
                    </fragment>
                  </span>
                </div>
                <div data-thq="thq-navbar-nav" class="navguest-desktop-menu">
                  <nav class="navguest-links">
                    <span>
                      <fragment class="authentication-add-info-fragment">
                        <span class="authentication-add-info-text">Features</span>
                      </fragment>
                    </span>
                    <span>
                      <fragment class="authentication-add-info-fragment01">
                        <span class="authentication-add-info-text01">
                          Contact
                        </span>
                      </fragment>
                    </span>
                    <span>
                      <fragment class="authentication-add-info-fragment10">
                        <span style="margin-left: var(--dl-space-space-twounits); font-family: Nunito;">Privacy &amp; Safety</span>
                      </fragment>
                    </span>
                    <span>
                      <fragment class="authentication-add-info-fragment09">
                        <span style="margin-left: var(--dl-space-space-twounits); font-family: Nunito;">Friends</span>
                      </fragment>
                    </span>
                  </nav>
                </div>
                <div data-thq="thq-burger-menu" class="navguest-burger-menu">
                  <svg viewBox="0 0 1024 1024" class="navguest-icon">
                    <path
                      d="M128 554.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 298.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 810.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667z">
                    </path>
                  </svg>
                </div>
                <div data-thq="thq-mobile-menu" class="navguest-mobile-menu">
                  <div class="navguest-nav">
                    <div class="navguest-top">
                      <img alt="image" src="https://presentation-website-assets.teleporthq.io/logos/logo.png"
                        class="navguest-logo" />
                      <div data-thq="thq-close-menu" class="navguest-close-menu">
                        <svg viewBox="0 0 1024 1024" class="navguest-icon02">
                          <path
                            d="M810 274l-238 238 238 238-60 60-238-238-238 238-60-60 238-238-238-238 60-60 238 238 238-238z">
                          </path>
                        </svg>
                      </div>
                    </div>
                    <nav class="navguest-links1">
                      <span>
                        <fragment class="authentication-add-info-fragment02">
                          <span class="authentication-add-info-text02">
                            About
                          </span>
                        </fragment>
                      </span>
                      <span>
                        <fragment class="authentication-add-info-fragment03">
                          <span class="authentication-add-info-text03">
                            Features
                          </span>
                        </fragment>
                      </span>
                      <span class="authentication-add-info-text08">
                        <fragment class="authentication-add-info-fragment04">
                          <span class="authentication-add-info-text04">
                            Pricing
                          </span>
                        </fragment>
                      </span>
                      <span class="authentication-add-info-text09">
                        <fragment class="authentication-add-info-fragment05">
                          <span class="authentication-add-info-text05">Team</span>
                        </fragment>
                      </span>
                      <span class="authentication-add-info-text10">
                        <fragment class="authentication-add-info-fragment07">
                          <span class="authentication-add-info-text07">Blog</span>
                        </fragment>
                      </span>
                    </nav>
                    <div class="navguest-buttons">
                      <button class="navguest-login button">
                        <span class="authentication-add-info-text11">
                          <fragment class="authentication-add-info-fragment06">
                            <span class="authentication-add-info-text06">
                              Login
                            </span>
                          </fragment>
                        </span>
                      </button>
                      <button class="button">
                        <span class="authentication-add-info-text12">
                          <fragment class="authentication-add-info-fragment12">
                            <span>Register</span>
                          </fragment>
                        </span>
                      </button>
                    </div>
                  </div>
                  <div>
                    <svg viewBox="0 0 950.8571428571428 1024" class="navguest-icon04">
                      <path
                        d="M925.714 233.143c-25.143 36.571-56.571 69.143-92.571 95.429 0.571 8 0.571 16 0.571 24 0 244-185.714 525.143-525.143 525.143-104.571 0-201.714-30.286-283.429-82.857 14.857 1.714 29.143 2.286 44.571 2.286 86.286 0 165.714-29.143 229.143-78.857-81.143-1.714-149.143-54.857-172.571-128 11.429 1.714 22.857 2.857 34.857 2.857 16.571 0 33.143-2.286 48.571-6.286-84.571-17.143-148-91.429-148-181.143v-2.286c24.571 13.714 53.143 22.286 83.429 23.429-49.714-33.143-82.286-89.714-82.286-153.714 0-34.286 9.143-65.714 25.143-93.143 90.857 112 227.429 185.143 380.571 193.143-2.857-13.714-4.571-28-4.571-42.286 0-101.714 82.286-184.571 184.571-184.571 53.143 0 101.143 22.286 134.857 58.286 41.714-8 81.714-23.429 117.143-44.571-13.714 42.857-42.857 78.857-81.143 101.714 37.143-4 73.143-14.286 106.286-28.571z">
                      </path>
                    </svg><svg viewBox="0 0 877.7142857142857 1024" class="navguest-icon06">
                      <path
                        d="M585.143 512c0-80.571-65.714-146.286-146.286-146.286s-146.286 65.714-146.286 146.286 65.714 146.286 146.286 146.286 146.286-65.714 146.286-146.286zM664 512c0 124.571-100.571 225.143-225.143 225.143s-225.143-100.571-225.143-225.143 100.571-225.143 225.143-225.143 225.143 100.571 225.143 225.143zM725.714 277.714c0 29.143-23.429 52.571-52.571 52.571s-52.571-23.429-52.571-52.571 23.429-52.571 52.571-52.571 52.571 23.429 52.571 52.571zM438.857 152c-64 0-201.143-5.143-258.857 17.714-20 8-34.857 17.714-50.286 33.143s-25.143 30.286-33.143 50.286c-22.857 57.714-17.714 194.857-17.714 258.857s-5.143 201.143 17.714 258.857c8 20 17.714 34.857 33.143 50.286s30.286 25.143 50.286 33.143c57.714 22.857 194.857 17.714 258.857 17.714s201.143 5.143 258.857-17.714c20-8 34.857-17.714 50.286-33.143s25.143-30.286 33.143-50.286c22.857-57.714 17.714-194.857 17.714-258.857s5.143-201.143-17.714-258.857c-8-20-17.714-34.857-33.143-50.286s-30.286-25.143-50.286-33.143c-57.714-22.857-194.857-17.714-258.857-17.714zM877.714 512c0 60.571 0.571 120.571-2.857 181.143-3.429 70.286-19.429 132.571-70.857 184s-113.714 67.429-184 70.857c-60.571 3.429-120.571 2.857-181.143 2.857s-120.571 0.571-181.143-2.857c-70.286-3.429-132.571-19.429-184-70.857s-67.429-113.714-70.857-184c-3.429-60.571-2.857-120.571-2.857-181.143s-0.571-120.571 2.857-181.143c3.429-70.286 19.429-132.571 70.857-184s113.714-67.429 184-70.857c60.571-3.429 120.571-2.857 181.143-2.857s120.571-0.571 181.143 2.857c70.286 3.429 132.571 19.429 184 70.857s67.429 113.714 70.857 184c3.429 60.571 2.857 120.571 2.857 181.143z">
                      </path>
                    </svg><svg viewBox="0 0 602.2582857142856 1024" class="navguest-icon08">
                      <path
                        d="M548 6.857v150.857h-89.714c-70.286 0-83.429 33.714-83.429 82.286v108h167.429l-22.286 169.143h-145.143v433.714h-174.857v-433.714h-145.714v-169.143h145.714v-124.571c0-144.571 88.571-223.429 217.714-223.429 61.714 0 114.857 4.571 130.286 6.857z">
                      </path>
                    </svg>
                  </div>
                </div>
              </header>
            </div>
          </navguest-wrapper>
          <div class="authentication-add-info-container01">
            <form class="authentication-add-info-form">
              <div class="authentication-add-info-container02">
                <span class="authentication-add-info-text13">
                  Become a part of&nbsp;
                </span>
                <span class="authentication-add-info-text14">TheMajorOnes</span>
              </div>
              <span class="authentication-add-info-text15">
                You are creating an account using this email:
              </span>
              <div class="authentication-add-info-input">
                <input type="text" disabled="true" placeholder="Email address"
                  class="authentication-add-info-textinput input" />
                <div class="authentication-add-info-container03">
                  <div class="authentication-add-info-container04"><br /></div>
                </div>
                <div class="authentication-add-info-container05">
                  <div class="authentication-add-info-container06"><br /></div>
                </div>
              </div>
              <button type="submit" class="authentication-add-info-button button">
                <span class="authentication-add-info-text16">
                  <span>Cancel account creation</span>
                  <br />
                </span>
              </button>
            </form>
            <form class="authentication-add-info-form1">
              <div class="authentication-add-info-container07">
                <span class="authentication-add-info-text19">
                  <span>To continue with the registeration,</span>
                  <br />
                  <span>complete your information:</span>
                </span>
              </div>
              <div class="authentication-add-info-input1">
                <input type="text" name="fullname" required="true" placeholder="Full Name"
                  class="authentication-add-info-textinput1 input" />
                <div class="authentication-add-info-container08">
                  <div class="authentication-add-info-container09"><br /></div>
                </div>
                <input type="text" name="username" required="true" placeholder="Username"
                  class="authentication-add-info-input2 input" />
                <div class="authentication-add-info-container10">
                  <div class="authentication-add-info-container11"><br /></div>
                </div>
                <input type="date" name="dob" required="true" placeholder="Date of Birth"
                  class="authentication-add-info-input3 input" />
                <div class="authentication-add-info-container12">
                  <div class="authentication-add-info-container13"><br /></div>
                </div>
                <select required="true" class="authentication-add-info-select">
                  <option value="Male">Male</option>
                  <option value="Female">Female</option>
                </select>
              </div>
              <button type="submit" class="authentication-add-info-button1 button">
                <span class="authentication-add-info-text23">
                  Complete Registeration
                </span>
              </button>
            </form>
          </div>
        </div>
      </div>
      <script defer="" src="https://unpkg.com/@teleporthq/teleport-custom-scripts"></script>
    </body>

    </html>