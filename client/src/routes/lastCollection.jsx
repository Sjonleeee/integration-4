import { useLayoutEffect, useRef } from "react";

export default function LastCollection() {
  const deco = useRef(null);

  return (
    <div className="last-collection">
      <h1 className="hidden">Last collection</h1>

      <div className="last-collection__hero">
        <video
          autoPlay={true}
          controls={false}
          loop={true}
          playsInline={true}
          src="../../assets/vid/3D_render_catwalk_-_Compressed.mp4"
        ></video>
        <h2>
          <span className="green-text">Last</span> year's <br />
          <span className="italic">collection</span>
        </h2>
        <a className=" arrow-button-white" href="#collection">
          <img src="../../assets/img/arrow_button.svg" alt="arrow down" />
        </a>
        <div className="last-collection__banner">
          <p>2022 </p>
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
                fill="#101010"
                stroke="none"
                stroke-width="0.14"
                stroke-miterlimit="10"
              />
              <path
                d="M4.15953 44.136C2.98029 46.1283 0.552158 49.7131 1.01875 52.1476C1.23928 53.3708 2.48352 54.0412 3.63491 53.98C5.83554 53.8765 7.7553 52.9192 9.68666 52.0582C17.5932 48.1724 24.8613 43.1033 32.0946 38.1331C39.4997 33.0923 42.1437 31.5139 50.9927 34.5224C42.7241 29.8932 38.5131 31.6033 30.9131 36.256C24.9542 39.9255 19.1833 43.8443 13.164 47.3608C11.6691 48.2359 10.1602 49.0756 8.63509 49.8424C7.19818 50.5528 5.60573 51.3149 4.08525 51.6254C3.73937 51.6936 3.39813 51.7031 3.23796 51.6678C3.18689 51.6584 3.16367 51.6466 3.15903 51.6466C3.15903 51.6419 3.15903 51.6372 3.15439 51.6325C3.04993 51.1385 3.30063 50.2658 3.51188 49.6966C4.08525 48.1253 4.91629 46.5799 5.73341 45.0933C6.90104 43.0022 8.2126 40.8334 9.54506 38.6647C11.3836 35.675 15.2625 34.6236 18.2408 36.4371C18.329 36.4912 18.4172 36.5477 18.5055 36.6065C15.5922 34.6471 14.6451 30.813 16.1795 27.7268C16.3025 27.4799 16.4418 27.2376 16.5973 27C16.4116 27.2846 16.2073 27.5504 15.9891 27.7974C13.756 30.319 9.97915 30.8624 7.11461 28.9335C7.21443 28.9994 7.3096 29.0676 7.40478 29.1405C10.0674 31.1376 10.5363 34.9882 8.57706 37.6932C7.05193 39.8008 5.56627 41.9366 4.16185 44.136H4.15953ZM3.166 51.6584C3.17992 51.6725 3.17528 51.6936 3.16135 51.6537L3.166 51.6584Z"
                fill="#101010"
                stroke="none"
                stroke-width="0.14"
                stroke-miterlimit="10"
              />
            </g>
          </svg>

          <p>2022 </p>
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
                fill="#101010"
                stroke="none"
                stroke-width="0.14"
                stroke-miterlimit="10"
              />
              <path
                d="M4.15953 44.136C2.98029 46.1283 0.552158 49.7131 1.01875 52.1476C1.23928 53.3708 2.48352 54.0412 3.63491 53.98C5.83554 53.8765 7.7553 52.9192 9.68666 52.0582C17.5932 48.1724 24.8613 43.1033 32.0946 38.1331C39.4997 33.0923 42.1437 31.5139 50.9927 34.5224C42.7241 29.8932 38.5131 31.6033 30.9131 36.256C24.9542 39.9255 19.1833 43.8443 13.164 47.3608C11.6691 48.2359 10.1602 49.0756 8.63509 49.8424C7.19818 50.5528 5.60573 51.3149 4.08525 51.6254C3.73937 51.6936 3.39813 51.7031 3.23796 51.6678C3.18689 51.6584 3.16367 51.6466 3.15903 51.6466C3.15903 51.6419 3.15903 51.6372 3.15439 51.6325C3.04993 51.1385 3.30063 50.2658 3.51188 49.6966C4.08525 48.1253 4.91629 46.5799 5.73341 45.0933C6.90104 43.0022 8.2126 40.8334 9.54506 38.6647C11.3836 35.675 15.2625 34.6236 18.2408 36.4371C18.329 36.4912 18.4172 36.5477 18.5055 36.6065C15.5922 34.6471 14.6451 30.813 16.1795 27.7268C16.3025 27.4799 16.4418 27.2376 16.5973 27C16.4116 27.2846 16.2073 27.5504 15.9891 27.7974C13.756 30.319 9.97915 30.8624 7.11461 28.9335C7.21443 28.9994 7.3096 29.0676 7.40478 29.1405C10.0674 31.1376 10.5363 34.9882 8.57706 37.6932C7.05193 39.8008 5.56627 41.9366 4.16185 44.136H4.15953ZM3.166 51.6584C3.17992 51.6725 3.17528 51.6936 3.16135 51.6537L3.166 51.6584Z"
                fill="#101010"
                stroke="none"
                stroke-width="0.14"
                stroke-miterlimit="10"
              />
            </g>
          </svg>

          <p>2022 </p>
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
                fill="#101010"
                stroke="none"
                stroke-width="0.14"
                stroke-miterlimit="10"
              />
              <path
                d="M4.15953 44.136C2.98029 46.1283 0.552158 49.7131 1.01875 52.1476C1.23928 53.3708 2.48352 54.0412 3.63491 53.98C5.83554 53.8765 7.7553 52.9192 9.68666 52.0582C17.5932 48.1724 24.8613 43.1033 32.0946 38.1331C39.4997 33.0923 42.1437 31.5139 50.9927 34.5224C42.7241 29.8932 38.5131 31.6033 30.9131 36.256C24.9542 39.9255 19.1833 43.8443 13.164 47.3608C11.6691 48.2359 10.1602 49.0756 8.63509 49.8424C7.19818 50.5528 5.60573 51.3149 4.08525 51.6254C3.73937 51.6936 3.39813 51.7031 3.23796 51.6678C3.18689 51.6584 3.16367 51.6466 3.15903 51.6466C3.15903 51.6419 3.15903 51.6372 3.15439 51.6325C3.04993 51.1385 3.30063 50.2658 3.51188 49.6966C4.08525 48.1253 4.91629 46.5799 5.73341 45.0933C6.90104 43.0022 8.2126 40.8334 9.54506 38.6647C11.3836 35.675 15.2625 34.6236 18.2408 36.4371C18.329 36.4912 18.4172 36.5477 18.5055 36.6065C15.5922 34.6471 14.6451 30.813 16.1795 27.7268C16.3025 27.4799 16.4418 27.2376 16.5973 27C16.4116 27.2846 16.2073 27.5504 15.9891 27.7974C13.756 30.319 9.97915 30.8624 7.11461 28.9335C7.21443 28.9994 7.3096 29.0676 7.40478 29.1405C10.0674 31.1376 10.5363 34.9882 8.57706 37.6932C7.05193 39.8008 5.56627 41.9366 4.16185 44.136H4.15953ZM3.166 51.6584C3.17992 51.6725 3.17528 51.6936 3.16135 51.6537L3.166 51.6584Z"
                fill="#101010"
                stroke="none"
                stroke-width="0.14"
                stroke-miterlimit="10"
              />
            </g>
          </svg>

          <p>2022 </p>
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
                fill="#101010"
                stroke="none"
                stroke-width="0.14"
                stroke-miterlimit="10"
              />
              <path
                d="M4.15953 44.136C2.98029 46.1283 0.552158 49.7131 1.01875 52.1476C1.23928 53.3708 2.48352 54.0412 3.63491 53.98C5.83554 53.8765 7.7553 52.9192 9.68666 52.0582C17.5932 48.1724 24.8613 43.1033 32.0946 38.1331C39.4997 33.0923 42.1437 31.5139 50.9927 34.5224C42.7241 29.8932 38.5131 31.6033 30.9131 36.256C24.9542 39.9255 19.1833 43.8443 13.164 47.3608C11.6691 48.2359 10.1602 49.0756 8.63509 49.8424C7.19818 50.5528 5.60573 51.3149 4.08525 51.6254C3.73937 51.6936 3.39813 51.7031 3.23796 51.6678C3.18689 51.6584 3.16367 51.6466 3.15903 51.6466C3.15903 51.6419 3.15903 51.6372 3.15439 51.6325C3.04993 51.1385 3.30063 50.2658 3.51188 49.6966C4.08525 48.1253 4.91629 46.5799 5.73341 45.0933C6.90104 43.0022 8.2126 40.8334 9.54506 38.6647C11.3836 35.675 15.2625 34.6236 18.2408 36.4371C18.329 36.4912 18.4172 36.5477 18.5055 36.6065C15.5922 34.6471 14.6451 30.813 16.1795 27.7268C16.3025 27.4799 16.4418 27.2376 16.5973 27C16.4116 27.2846 16.2073 27.5504 15.9891 27.7974C13.756 30.319 9.97915 30.8624 7.11461 28.9335C7.21443 28.9994 7.3096 29.0676 7.40478 29.1405C10.0674 31.1376 10.5363 34.9882 8.57706 37.6932C7.05193 39.8008 5.56627 41.9366 4.16185 44.136H4.15953ZM3.166 51.6584C3.17992 51.6725 3.17528 51.6936 3.16135 51.6537L3.166 51.6584Z"
                fill="#101010"
                stroke="none"
                stroke-width="0.14"
                stroke-miterlimit="10"
              />
            </g>
          </svg>
        </div>
      </div>
      <div id="collection" className="last-collection__info">
        <div className="mobile-hidden last-collection__info-img">
          <img
            ref={deco}
            className="outfit-image"
            src="../../assets/img/last-1.png"
            alt=""
          />
        </div>
        <div className="last-collection__info-text">
          <h2 className="hidden">Winners</h2>
          <p>Cybernova - Futurustic Fashion Unleashed</p>
          <p>
            T-shirt design challenge invites participants to create a design
            that captures their unique experience and perspectives of culture in
            Kortrijk, Belgium. <br />
            <br />
            Scroll through the designs!
          </p>
          <div className="desktop-hidden last-collection__arrows">
            <img src="../../assets/img/arrow_left.svg" alt="" />
            <img src="../../assets/img/arrow.svg" alt="" />
          </div>
          <div className="last-collection__articles">
            <div
              className="last-collection__article"
              onMouseEnter={() => {
                deco.current.src = "../../assets/img/last-3.png";
              }}
              onMouseLeave={() => {
                deco.current.src = "../../assets/img/last-3.png";
              }}
            >
              <img src="../../assets/img/unknown.png" alt="shirt" />
              <h3>The unknown</h3>
              <div>
                <img src="../../assets/img/flava-pfp.png" alt="pfp" />
                <p>Flava Flaviuq x Thomas</p>
              </div>
              <a href="../last-collection/unknown">
                <div className="button-primary">
                  Read my story
                  <svg
                    width="41"
                    height="15"
                    viewBox="0 0 41 15"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M1 6.5C0.447715 6.5 0 6.94772 0 7.5C0 8.05228 0.447715 8.5 1 8.5V6.5ZM40.2071 8.20711C40.5976 7.81658 40.5976 7.18342 40.2071 6.79289L33.8431 0.428932C33.4526 0.0384078 32.8195 0.0384078 32.4289 0.428932C32.0384 0.819457 32.0384 1.45262 32.4289 1.84315L38.0858 7.5L32.4289 13.1569C32.0384 13.5474 32.0384 14.1805 32.4289 14.5711C32.8195 14.9616 33.4526 14.9616 33.8431 14.5711L40.2071 8.20711ZM1 8.5H39.5V6.5H1V8.5Z"
                      fill="#101010"
                    />
                  </svg>
                </div>
              </a>
            </div>
            <div
              className="last-collection__article"
              onMouseEnter={() => {
                deco.current.src = "../../assets/img/last-2.png";
              }}
              onMouseLeave={() => {
                deco.current.src = "../../assets/img/last-2.png";
              }}
            >
              <img src="../../assets/img/biniru.png" alt="shirt" />
              <h3>BINIRU</h3>
              <div>
                <img src="../../assets/img/warre-pfp.png" alt="pfp" />
                <p>Warre Warrior x Senne</p>
              </div>
              <a href="../last-collection/biniru">
                <div className="button-primary">
                  Read my story
                  <svg
                    width="41"
                    height="15"
                    viewBox="0 0 41 15"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M1 6.5C0.447715 6.5 0 6.94772 0 7.5C0 8.05228 0.447715 8.5 1 8.5V6.5ZM40.2071 8.20711C40.5976 7.81658 40.5976 7.18342 40.2071 6.79289L33.8431 0.428932C33.4526 0.0384078 32.8195 0.0384078 32.4289 0.428932C32.0384 0.819457 32.0384 1.45262 32.4289 1.84315L38.0858 7.5L32.4289 13.1569C32.0384 13.5474 32.0384 14.1805 32.4289 14.5711C32.8195 14.9616 33.4526 14.9616 33.8431 14.5711L40.2071 8.20711ZM1 8.5H39.5V6.5H1V8.5Z"
                      fill="#101010"
                    />
                  </svg>
                </div>
              </a>
            </div>
            <div
              className="last-collection__article"
              onMouseEnter={() => {
                console.log(deco);
                deco.current.src = "../../assets/img/last-1.png";
              }}
              onMouseLeave={() => {
                console.log(deco);
                deco.current.src = "../../assets/img/last-1.png";
              }}
            >
              <img src="../../assets/img/senju.png" alt="shirt" />
              <h3>Senju</h3>
              <div>
                <img src="../../assets/img/senju-pfp.png" alt="pfp" />
                <p>Senju Cyphercat x Minh Tri</p>
              </div>
              <a href="../last-collection/senju">
                <div className="button-primary">
                  Read my story
                  <svg
                    width="41"
                    height="15"
                    viewBox="0 0 41 15"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M1 6.5C0.447715 6.5 0 6.94772 0 7.5C0 8.05228 0.447715 8.5 1 8.5V6.5ZM40.2071 8.20711C40.5976 7.81658 40.5976 7.18342 40.2071 6.79289L33.8431 0.428932C33.4526 0.0384078 32.8195 0.0384078 32.4289 0.428932C32.0384 0.819457 32.0384 1.45262 32.4289 1.84315L38.0858 7.5L32.4289 13.1569C32.0384 13.5474 32.0384 14.1805 32.4289 14.5711C32.8195 14.9616 33.4526 14.9616 33.8431 14.5711L40.2071 8.20711ZM1 8.5H39.5V6.5H1V8.5Z"
                      fill="#101010"
                    />
                  </svg>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
