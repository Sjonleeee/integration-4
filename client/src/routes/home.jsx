import { useRef } from "react";

export default function Home() {
  const text = useRef();
  window.onload = function () {
    //hide the preloader
    console.log("window loaded");
    setTimeout(function () {
      document.querySelector(".preloader").classList.add("hide-preloader");
    }, 2000);
  };

  const changingText = () => {
    const words = ["PLORE", "PERIENCE", "PRESS"];
    let i = 0;
    setInterval(() => {
      text.current.innerText = words[i];
      i++;
      if (i > words.length - 1) {
        i = 0;
      }
    }, 3000);
  };

  changingText();

  return (
    <>
      <div className="preloader">
        <img src="./src/assets/img/Spiral.gif" />
      </div>
      <div className="home">
        <h1 className="hidden">KLTR X</h1>
        <div className="hero">
          <div className="hero-text">
            <h2 className="hidden">KLTR X</h2>
            <p>Stories through</p>
            <div className="moving-title">
              <p>Fashion</p>
              <img src="../src/assets/img/n.svg" alt="" />
              <img src="../src/assets/img/n.svg" alt="" />
            </div>
            <p>
              Compete and be a part of a unique clothing line inspired by the
              KULTURE X of <span className="green-text">Kortrijk</span>
            </p>
            <p>
              KULTURE X
              <span ref={text} className="changing-text green-text">
                PLORE
              </span>
            </p>
            <style>
              {`
              @keyframes typing {
                  from {
                    width: 0;
                  }
                  to {
                    width: 8ch ;
                  }
                }

                .changing-text {
                  animation: typing 1.5s steps(8, end) infinite alternate;
                  display: inline-block;
                  overflow: hidden;
                  line-height: 0.8;
                  text-align: left;
                }`}
            </style>

            <a className="desktop-hidden arrow-button-white" href="">
              <img src="../src/assets/img/arrow_button.svg" alt="arrow down" />
            </a>
            <a className="mobile-hidden" href="../workshops">
              <div className="button-primary">
                Dive into our competition
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
          <div className="hero-image">
            <img src="../src/assets/img/home.jpg" alt="tshirt picture" />
            <img
              className="mobile-hidden hero-image__logo"
              src="../src/assets/img/logo.svg"
              alt="logo"
            />
          </div>
        </div>
        <div className="hero-seperation">
          <div className="hero-seperation-one">
            <img src="../src/assets/img/downtown.jpg" alt="downtown" />
            <p>Clothing that speaks</p>
          </div>
          <div className="hero-seperation-two">
            <p>Volumes</p>
            <p>Volumes</p>
            <p>Volumes</p>
          </div>
        </div>
        <div className="about">
          <div className="about-img">
            <img src="../src/assets/img/about.png" alt="about" />
          </div>
          <div className="about-text">
            {/* svg */}
            <div className="about-text__heading">
              <p>KLTR X</p>
              <img src="../src/assets/img/destroatelogo.png" alt="de stroate" />
              <img src="../src/assets/img/tranzitlogo.png" alt="tranzit" />
            </div>
            <h2 className="hidden">About</h2>
            <p>
              Introducing our latest collection, created in collaboration with
              the cultural hubs Tranzit and De Stroate!
              <br /> <br />
              Each year, we join forces to empower the youth of Kortrijk. We
              achieve this by creating a clothing line created by you!
            </p>

            <a href="../workshops">
              <div className="button-primary">
                How can I join?
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

            <a href="../workshops">
              <div className="button-secondary">
                See last collection
                <svg
                  width="41"
                  height="15"
                  viewBox="0 0 41 15"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M1 6.5C0.447715 6.5 0 6.94772 0 7.5C0 8.05228 0.447715 8.5 1 8.5V6.5ZM40.2071 8.20711C40.5976 7.81658 40.5976 7.18342 40.2071 6.79289L33.8431 0.428932C33.4526 0.0384078 32.8195 0.0384078 32.4289 0.428932C32.0384 0.819457 32.0384 1.45262 32.4289 1.84315L38.0858 7.5L32.4289 13.1569C32.0384 13.5474 32.0384 14.1805 32.4289 14.5711C32.8195 14.9616 33.4526 14.9616 33.8431 14.5711L40.2071 8.20711ZM1 8.5H39.5V6.5H1V8.5Z"
                    fill="#FFFFFF"
                  />
                </svg>
              </div>
            </a>
          </div>
        </div>
        <div className="concept">
          <div className="concept-deco">
            <img src="../src/assets/img/express.jpg" alt="buildings" />
            <div className="concept-deco__div">
              <p className="">express your</p>
              <img src="../src/assets/img/journey.svg" alt="journey" />
            </div>
          </div>
          <div className="concept-text">
            <h2 className="hidden">Concept</h2>

            <p>A Challenge</p>
            <img src="../src/assets/img/challenge.svg" alt="illustration" />
            <p>Made for you!</p>
            <a className="arrow-button-black" href="">
              <img src="../src/assets/img/arrow_button_black.svg" alt="" />
            </a>
            {/* <p>
              Each year we try to guide the community to use a certain style to
              create a coherent clothing line.{" "}
            </p>
            <p>
              <span>How do we pick the designs?</span> <br /> Well actually, we
              don’t ... You do! We provide a list of submissions where you can
              pick your favourite story and design!
            </p> */}
            {/* <Button></Button>
          <Button></Button> */}
            <div className="concept-text__deco">
              <img src="" alt="" />
              {/* svg */}
            </div>
          </div>
          <div className="concept-items">
            <div className="concept-item concept-one">
              <img src="../src/assets/img/one.jpg" alt="concept-item image" />
              <img src="../src/assets/img/one.svg" alt="concept-item image" />
              <div className="concept-one__text">
                <h3 className="concept-slide__title">Each year</h3>
                <p className="concept-slide__text">
                  We invite you to design your own fashion collection item
                  that’s reflecting your vision on the city's culture.{" "}
                </p>
              </div>
            </div>
            <div className="concept-item concept-two">
              <img src="../src/assets/img/two.jpg" alt="concept-item image" />
              <img src="../src/assets/img/two.svg" alt="concept-item image" />
              <div className="concept-two__text">
                <h3 className="concept-slide__title">Unique perspectives</h3>
                <p className="concept-slide__text"></p>
              </div>
            </div>
            <div className="concept-item concept-three">
              <img src="../src/assets/img/three.jpg" alt="concept-item image" />
              <img src="../src/assets/img/three.svg" alt="concept-item image" />
              <div className="concept-three__text">
                <h3 className="concept-slide__title">Participate</h3>
                <p className="concept-slide__text">
                  When you participate, you receive professional guidance in our
                  workshops to tell your story through art and an opportunity to
                  print your design on a real shirt!
                </p>
              </div>
            </div>
            <div className="concept-item concept-four">
              <img src="../src/assets/img/four.jpg" alt="concept-item image" />
              <img src="../src/assets/img/four.svg" alt="concept-item image" />
              <div className="concept-four__text">
                <h3 className="concept-slide__title">
                  Are you the next winner?
                </h3>
                <p className="concept-slide__text">
                  We highlight 3 people every year and you get to decide who
                  wins! Winners will be showcased on our site and can sell their
                  designs.
                </p>
              </div>
            </div>
          </div>
          <div className="workshops">
            <div className="workshops-text">
              <h2 className="title">Workshops</h2>
              <p>
                Don’t know how to design? Don’t worry! We offer workshops at
                Tranzit and The Palace in Kortrijk, to help you get started!
                <br />
                <br />
                In our workshops we provide a professional who gives you info
                about starting such a design process and KLTR X provides all the
                tools necessary to be able to start designing fantastic T-shirt
                designs.
                <br />
                <br />
                Join or request a workshop as a group!
              </p>
              <a href="../workshops">
                <div className="button-primary">
                  Join a workshop
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
              <a href="../workshops">
                <div className="button-secondary">
                  Request a workshop
                  <svg
                    width="41"
                    height="15"
                    viewBox="0 0 41 15"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M1 6.5C0.447715 6.5 0 6.94772 0 7.5C0 8.05228 0.447715 8.5 1 8.5V6.5ZM40.2071 8.20711C40.5976 7.81658 40.5976 7.18342 40.2071 6.79289L33.8431 0.428932C33.4526 0.0384078 32.8195 0.0384078 32.4289 0.428932C32.0384 0.819457 32.0384 1.45262 32.4289 1.84315L38.0858 7.5L32.4289 13.1569C32.0384 13.5474 32.0384 14.1805 32.4289 14.5711C32.8195 14.9616 33.4526 14.9616 33.8431 14.5711L40.2071 8.20711ZM1 8.5H39.5V6.5H1V8.5Z"
                      fill="#FFFFFF"
                    />
                  </svg>
                </div>
              </a>
            </div>
            <div className="workshop-deco mobile-hidden">
              <img src="../src/assets/img/workshops-home.jpg" alt="workshops" />
              {/* svg */}
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
