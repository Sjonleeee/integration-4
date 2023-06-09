import { NavLink } from "react-router-dom";
import { useState, useEffect } from "react";

export default function Navbar() {
  const CountdownTimer = () => {
    const countdownDate = new Date("2023-07-31T00:00:00").getTime();
    const [currentTime, setCurrentTime] = useState(new Date().getTime());

    useEffect(() => {
      const timer = setInterval(() => {
        setCurrentTime(new Date().getTime());
      }, 1000);

      return () => clearInterval(timer);
    }, []);

    const calculateTimeRemaining = () => {
      const timeDifference = countdownDate - currentTime;

      if (timeDifference <= 0) {
        return {
          months: 0,
          days: 0,
          hours: 0,
        };
      }

      const months = Math.floor(timeDifference / (30 * 24 * 60 * 60 * 1000));
      const days = Math.floor(
        (timeDifference % (30 * 24 * 60 * 60 * 1000)) / (24 * 60 * 60 * 1000)
      );
      const hours = Math.floor(
        (timeDifference % (24 * 60 * 60 * 1000)) / (60 * 60 * 1000)
      );

      return {
        months,
        days,
        hours,
      };
    };

    const { months, days, hours } = calculateTimeRemaining();
    return (
      <div className="countdown">
        <span>
          {months}M {days}D {hours}H
        </span>{" "}
        <span className="thin">until</span>{" "}
        <span className="green-text"> Deadline</span>
      </div>
    );
  };
  CountdownTimer();
  const [showMenu, setShowMenu] = useState(false);

  const handleMenu = () => {
    setShowMenu(!showMenu);
  };
  return (
    <div className="navigation">
      <div>
        <div className="navigation-mobile">
          <NavLink
            className="navigation-logo"
            onClick={() => {
              if (showMenu) {
                handleMenu();
              }
            }}
            to="/"
          >
            <svg
              width="51"
              height="54"
              viewBox="0 0 51 54"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <g clip-path="url(#clip0_548_9057)">
                <path
                  d="M46.84 9.86353C48.0193 7.8712 50.4474 4.28641 49.9808 1.85186C49.7603 0.628699 48.516 -0.041685 47.3646 0.0194728C45.164 0.122971 43.2443 1.08033 41.3129 1.94124C33.4064 5.82711 26.1382 10.8962 18.9049 15.8664C11.4998 20.9072 8.85581 22.4856 0.00683594 19.4771C8.27547 24.1062 12.4864 22.3962 20.0865 17.7435C26.0454 14.074 31.8163 10.1552 37.8355 6.63863C39.3305 5.7636 40.8393 4.92386 42.3645 4.15703C43.8014 3.44666 45.3938 2.68454 46.9143 2.37405C47.2602 2.30583 47.6014 2.29643 47.7616 2.33171C47.8127 2.34112 47.8359 2.35288 47.8405 2.35288C47.8405 2.35758 47.8405 2.36229 47.8452 2.36699C47.9496 2.86096 47.6989 3.73363 47.4877 4.30287C46.9143 5.87416 46.0833 7.41957 45.2661 8.90617C44.0985 10.9973 42.7869 13.1661 41.4545 15.3348C39.616 18.3245 35.737 19.3759 32.7587 17.5624C32.6705 17.5083 32.5823 17.4518 32.4941 17.393C35.4074 19.3524 36.3545 23.1865 34.8201 26.2726C34.6971 26.5196 34.5578 26.7619 34.4022 26.9995C34.5879 26.7149 34.7922 26.4491 35.0104 26.2021C37.2436 23.6805 41.0204 23.1371 43.8849 25.066C43.7851 25.0001 43.6899 24.9319 43.5948 24.859C40.9322 22.8619 40.4633 19.0113 42.4225 16.3063C43.9476 14.1987 45.4333 12.0629 46.8377 9.86353H46.84ZM47.8336 2.34112C47.8196 2.327 47.8243 2.30583 47.8382 2.34582L47.8336 2.34112Z"
                  fill="#FFFFFF"
                  stroke-width="0.14"
                  stroke-miterlimit="10"
                />
                <path
                  d="M4.15953 44.136C2.98029 46.1283 0.552158 49.7131 1.01875 52.1476C1.23928 53.3708 2.48352 54.0412 3.63491 53.98C5.83554 53.8765 7.7553 52.9192 9.68666 52.0582C17.5932 48.1724 24.8613 43.1033 32.0946 38.1331C39.4997 33.0923 42.1437 31.5139 50.9927 34.5224C42.7241 29.8932 38.5131 31.6033 30.9131 36.256C24.9542 39.9255 19.1833 43.8443 13.164 47.3608C11.6691 48.2359 10.1602 49.0756 8.63509 49.8424C7.19818 50.5528 5.60573 51.3149 4.08525 51.6254C3.73937 51.6936 3.39813 51.7031 3.23796 51.6678C3.18689 51.6584 3.16367 51.6466 3.15903 51.6466C3.15903 51.6419 3.15903 51.6372 3.15439 51.6325C3.04993 51.1385 3.30063 50.2658 3.51188 49.6966C4.08525 48.1253 4.91629 46.5799 5.73341 45.0933C6.90104 43.0022 8.2126 40.8334 9.54506 38.6647C11.3836 35.675 15.2625 34.6236 18.2408 36.4371C18.329 36.4912 18.4172 36.5477 18.5055 36.6065C15.5922 34.6471 14.6451 30.813 16.1795 27.7268C16.3025 27.4799 16.4418 27.2376 16.5973 27C16.4116 27.2846 16.2073 27.5504 15.9891 27.7974C13.756 30.319 9.97915 30.8624 7.11461 28.9335C7.21443 28.9994 7.3096 29.0676 7.40478 29.1405C10.0674 31.1376 10.5363 34.9882 8.57706 37.6932C7.05193 39.8008 5.56627 41.9366 4.16185 44.136H4.15953ZM3.166 51.6584C3.17992 51.6725 3.17528 51.6936 3.16135 51.6537L3.166 51.6584Z"
                  fill="#FFFFFF"
                  stroke-width="0.14"
                  stroke-miterlimit="10"
                />
              </g>
              <defs>
                <clipPath id="clip0_548_9057">
                  <rect width="51" height="54" fill="white" />
                </clipPath>
              </defs>
            </svg>

            <p className="mobile-hidden">KLTR X</p>
          </NavLink>
          <div onClick={handleMenu} className="navigation-burger">
            <div></div>
            <div></div>
            <div></div>
          </div>
        </div>
        <div className="navigation-links">
          <NavLink
            className="navigation-item"
            onClick={handleMenu}
            to="../requirements"
          >
            <svg
              className="mobile-hidden"
              width="23"
              height="18"
              viewBox="0 0 23 18"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                fill-rule="evenodd"
                clip-rule="evenodd"
                d="M17 0.53125H0V2.53125H17V0.53125ZM15.1329 16.601L22.9862 9.16809L21.6114 7.71554L14.4455 14.4979L10.598 10.8562L9.22317 12.3088L13.7581 16.601L14.4455 17.2516L15.1329 16.601ZM0 6.53125H17V8.53125H0V6.53125ZM7 12.5312H0V14.5312H7V12.5312Z"
                fill="#101010"
              />
            </svg>

            <li>Requirements</li>
          </NavLink>

          <NavLink
            className="navigation-item"
            onClick={handleMenu}
            to="../submit"
          >
            <svg
              className="mobile-hidden"
              width="24"
              height="25"
              viewBox="0 0 24 25"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <g clip-path="url(#clip0_518_3128)">
                <path
                  d="M2.58208 11.9683L22.9283 1.89636L22.1261 20.5451L16.2588 16.2712L15.406 15.6501L14.8314 16.5348L11.515 21.6405L10.2284 15.1458L10.117 14.5834L9.57537 14.3954L2.58208 11.9683Z"
                  stroke="black"
                  stroke-width="2"
                />
              </g>
              <defs>
                <clipPath id="clip0_518_3128">
                  <rect
                    width="24"
                    height="24"
                    fill="white"
                    transform="translate(0 0.25)"
                  />
                </clipPath>
              </defs>
            </svg>

            <li>Submit</li>
          </NavLink>

          <NavLink
            className="navigation-item"
            onClick={handleMenu}
            to="../submissions"
          >
            <svg
              className="mobile-hidden"
              width="24"
              height="26"
              viewBox="0 0 24 26"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <rect x="17" y="18.25" width="2" height="7" fill="#101010" />
              <rect
                x="6.85742"
                y="17.8281"
                width="17.1429"
                height="3.42857"
                fill="#101010"
              />
              <path
                d="M9.57129 5.11719H18.9999C21.209 5.11719 22.9999 6.90805 22.9999 9.11719V20.26H9.57129V5.11719Z"
                fill="white"
                stroke="black"
                stroke-width="2"
              />
              <rect x="9" y="0.820312" width="2" height="5" fill="#101010" />
              <rect
                x="15"
                y="0.25"
                width="2"
                height="6"
                transform="rotate(90 15 0.25)"
                fill="#101010"
              />
              <rect
                x="6.85742"
                y="4.11719"
                width="5.14286"
                height="1.71429"
                fill="#101010"
              />
              <path
                d="M12.7143 10.9743V20.26H1V10.9743C1 7.73952 3.62233 5.11719 6.85714 5.11719C10.092 5.11719 12.7143 7.73952 12.7143 10.9743Z"
                fill="white"
                stroke="black"
                stroke-width="2"
              />
            </svg>

            <li>Submissions</li>
          </NavLink>

          <NavLink
            className="navigation-item"
            onClick={handleMenu}
            to="../last-collection"
          >
            <svg
              className="mobile-hidden"
              width="28"
              height="23"
              viewBox="0 0 28 23"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M8 21.25V8.4545L5.69231 12.0568L2 8.4545L7.07692 1.25H10.7692L14 4.85225L17.2308 1.25H20.9231L26 8.4545L22.3077 12.0568L20 8.4545V21.25H8Z"
                stroke="black"
                stroke-width="2"
              />
            </svg>
            <li>Last collection</li>
          </NavLink>

          <NavLink
            className="navigation-item"
            onClick={handleMenu}
            to="../workshops"
          >
            <svg
              className="mobile-hidden"
              width="25"
              height="24"
              viewBox="0 0 25 24"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <mask id="path-1-inside-1_534_5375" fill="white">
                <path
                  fill-rule="evenodd"
                  clip-rule="evenodd"
                  d="M12.4246 2.06171C14.8971 -0.410806 18.788 -0.600602 21.4782 1.49233L16.3145 6.65609L17.5267 7.86837L22.6907 2.70439C24.7853 5.39472 24.596 9.28683 22.1229 11.76C20.3157 13.5672 17.7507 14.1548 15.4507 13.523C15.3469 13.6653 15.2308 13.8015 15.1023 13.9299L6.698 22.3342C5.35895 23.6733 3.18792 23.6733 1.84888 22.3342C0.509829 20.9952 0.509829 18.8242 1.84888 17.4851L10.2532 9.08081C10.3819 8.95207 10.5183 8.83572 10.661 8.73173C10.0301 6.43227 10.618 3.86837 12.4246 2.06171Z"
                />
              </mask>
              <path
                d="M21.4782 1.49233L22.8924 2.90654L24.4942 1.30473L22.7063 -0.0862352L21.4782 1.49233ZM16.3145 6.65609L14.9002 5.24188L13.486 6.65609L14.9002 8.0703L16.3145 6.65609ZM17.5267 7.86837L16.1125 9.28258L17.5267 10.6968L18.9409 9.28258L17.5267 7.86837ZM22.6907 2.70439L24.2688 1.47575L22.8777 -0.311048L21.2765 1.29018L22.6907 2.70439ZM15.4507 13.523L15.9805 11.5945L14.6488 11.2286L13.835 12.3443L15.4507 13.523ZM15.1023 13.9299L16.5165 15.3441L15.1023 13.9299ZM6.698 22.3342L5.28378 20.92L6.698 22.3342ZM1.84888 17.4851L3.26309 18.8993L1.84888 17.4851ZM10.2532 9.08081L8.83896 7.6666L10.2532 9.08081ZM10.661 8.73173L11.8391 10.3479L12.9551 9.53435L12.5897 8.20256L10.661 8.73173ZM22.7063 -0.0862352C19.2298 -2.79082 14.2051 -2.54718 11.0104 0.6475L13.8388 3.47593C15.5892 1.72557 18.3461 1.58961 20.2502 3.07089L22.7063 -0.0862352ZM17.7287 8.0703L22.8924 2.90654L20.064 0.0781131L14.9002 5.24188L17.7287 8.0703ZM18.9409 6.45416L17.7287 5.24188L14.9002 8.0703L16.1125 9.28258L18.9409 6.45416ZM21.2765 1.29018L16.1125 6.45416L18.9409 9.28258L24.1049 4.1186L21.2765 1.29018ZM23.5371 13.1742C26.7325 9.97871 26.9755 4.95233 24.2688 1.47575L21.1126 3.93303C22.595 5.83711 22.4594 8.59496 20.7086 10.3457L23.5371 13.1742ZM14.9209 15.4516C17.886 16.2661 21.201 15.5103 23.5371 13.1742L20.7086 10.3457C19.4303 11.6241 17.6155 12.0436 15.9805 11.5945L14.9209 15.4516ZM13.835 12.3443C13.7919 12.4034 13.7431 12.4607 13.6881 12.5157L16.5165 15.3441C16.7184 15.1422 16.9019 14.9273 17.0665 14.7017L13.835 12.3443ZM13.6881 12.5157L5.28378 20.92L8.11221 23.7484L16.5165 15.3441L13.6881 12.5157ZM5.28378 20.92C4.72578 21.478 3.82109 21.478 3.26309 20.92L0.434663 23.7484C2.55476 25.8685 5.99211 25.8685 8.11221 23.7484L5.28378 20.92ZM3.26309 20.92C2.70509 20.362 2.70509 19.4573 3.26309 18.8993L0.434663 16.0709C-1.68543 18.191 -1.68543 21.6283 0.434663 23.7484L3.26309 20.92ZM3.26309 18.8993L11.6674 10.495L8.83896 7.6666L0.434663 16.0709L3.26309 18.8993ZM11.6674 10.495C11.7225 10.4399 11.78 10.391 11.8391 10.3479L9.48281 7.11559C9.25669 7.28043 9.04131 7.46425 8.83896 7.6666L11.6674 10.495ZM11.0104 0.6475C8.67503 2.98287 7.91895 6.2966 8.73226 9.26091L12.5897 8.20256C12.1412 6.56794 12.5609 4.75386 13.8388 3.47593L11.0104 0.6475Z"
                fill="black"
                mask="url(#path-1-inside-1_534_5375)"
              />
            </svg>

            <li>Workshops</li>
          </NavLink>
          <NavLink
            className="navigation-item"
            onClick={handleMenu}
            to="../contact"
          >
            <svg
              className="mobile-hidden"
              width="24"
              height="25"
              viewBox="0 0 24 25"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M7.4144 19.9146L6.9664 19.7309L6.54446 19.9685L2.95986 21.9865L4.16011 18.7099L4.38388 18.099L3.91608 17.6469C2.09311 15.885 1 13.5475 1 10.9956C1 5.67489 5.82368 1.1875 11.9991 1.1875C18.1747 1.1875 23 5.67509 23 10.9956C23 16.3181 18.1763 20.8055 11.9991 20.8055C10.3587 20.8055 8.80614 20.4853 7.4144 19.9146Z"
                stroke="black"
                stroke-width="2"
              />
            </svg>

            <li>Contact</li>
          </NavLink>
        </div>
        <CountdownTimer />
      </div>
      <style>
        {`
        @media screen and (max-width: 1279px) {
          .navigation {
            background-color: ${showMenu ? "white" : "transparent"};
            mix-blend-mode: ${showMenu ? "normal" : "difference"};
            height: ${showMenu ? "100vh" : "3rem"};
            position: fixed;
            width: calc(100vw - 48px);
            z-index: 5;
          }

          .navigation svg path {
            fill: ${showMenu ? "black" : "white"};
          }

          .navigation-burger div {
            background-color: ${showMenu ? "black" : "white"};
          }

          .navigation-burger div:nth-child(2) {
            width: ${showMenu ? "26px" : "40px"};
          }
          .navigation-burger div:nth-child(3) {
            width: ${showMenu ? "13px" : "40px"};
          }

          .navigation>div {
            height: ${showMenu ? "100vh" : "3rem"};
          }

          .navigation-links { 
            opacity: ${showMenu ? "1" : "0"};
            transform: translateY(${showMenu ? "0" : "-200%"});
          }

          .countdown {
            opacity: ${showMenu ? "1" : "0"};
          }
        }
        `}
      </style>
    </div>
  );
}
