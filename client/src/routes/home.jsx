import { useLayoutEffect, useRef, useEffect, useState } from "react";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
gsap.registerPlugin(ScrollTrigger);

export default function Home() {
  const text = useRef();
  const home = useRef();
  const [height, setHeight] = useState(0);
  const conceptItem = useRef();

  useEffect(() => {
    setHeight(conceptItem.current.clientHeight / 4);
  }, []);
  console.log(height);

  useLayoutEffect(() => {
    let hero = gsap.context(() => {
      gsap.from(".stories-gsap", { opacity: 0, scale: 0.5, delay: 0.5 });
      gsap.to(".stories-gsap", { opacity: 1, scale: 1, delay: 0.5 });
      gsap.from(".fashion", { x: -600, delay: 0.5 });
      gsap.to(".fashion", { delay: 0.5, x: 0 });
      gsap.from(".n-one", { opacity: 0, x: -100, delay: 1 });
      gsap.to(".n-one", { opacity: 1, delay: 1, x: 0 });
      gsap.from(".n-two", { opacity: 0, x: -100, delay: 1.5 });
      gsap.to(".n-two", { opacity: 1, delay: 1.5, x: 0 });
      gsap.fromTo(
        ".hero-cta",
        { y: +100, opacity: 0 },
        { y: 0, opacity: 1, duration: 1, delay: 2.5, ease: "power2" }
      );
      gsap.fromTo(
        ".kltr-x",
        { y: +100, opacity: 0 },
        { y: 0, opacity: 1, duration: 1, delay: 2, ease: "power2" }
      );
      gsap.fromTo(
        ".hero-text-gsap",
        { y: +100, opacity: 0 },
        { y: 0, opacity: 1, duration: 1, delay: 2, ease: "power2" }
      );
      gsap.fromTo(
        ".hero-image-gsap",
        { y: +100, opacity: 0 },
        { y: 0, opacity: 1, duration: 1, delay: 0, ease: "power2" }
      );
      return () => hero.revert();
    });

    let concept = gsap.context(() => {
      const conceptTL = gsap.timeline({
        scrollTrigger: {
          trigger: ".concept-items",
          markers: false,
          start: "top",
          end: "bottom",
          pin: true,
          pinSpacing: false,
          toggleActions: "restart none none reverse",
        },
      });

      conceptTL.from(".concept-items", { opacity: 1, y: 0 });
      gsap.to(".concept-two", {
        y: -height,
        scrollTrigger: {
          trigger: ".concept-two-gsap",
          markers: false,
          start: "top",
          end: "bottom",
          toggleActions: "restart none none reverse",
        },
      });
      gsap.to(".concept-three", {
        y: -height * 2,
        scrollTrigger: {
          trigger: ".concept-three-gsap",
          markers: false,
          start: "top",
          end: "bottom",
          toggleActions: "restart none none reverse",
        },
      });
      gsap.to(".concept-four", {
        y: -height * 3,
        scrollTrigger: {
          trigger: ".concept-four-gsap",
          markers: false,
          start: "top +200",
          end: "top",
          pinSpacing: true,
          toggleActions: "restart none none reverse",
        },
      });
      // gsap.to(".workshops", {
      //   opacity: 0,
      //   scrollTrigger: {
      //     trigger: ".workshops",
      //     markers: true,
      //     start: "top -200",
      //     end: "top",
      //     pinSpacing: true,
      //     toggleActions: "restart none none reverse",
      //   },
      // });

      return () => concept.revert();
    });
  });

  const changingText = () => {
    const words = ["PLORE", "PERIENCE", "PRESS"];
    let i = 0;
    setInterval(() => {
      text.innerHTML = words[i];
      i++;
      if (i > words.length - 1) {
        i = 0;
      }
    }, 3000);
  };

  changingText();

  return (
    <>
      <div ref={home} className="home">
        <h1 className="hidden">KLTR X</h1>
        <div className="hero">
          <div className="hero-text">
            <h2 className="hidden">KLTR X</h2>
            <p className="stories-gsap">Stories through</p>
            <div className="moving-title">
              <p className="fashion">Fashion</p>
              <img className="n-one" src="../src/assets/img/n.svg" alt="" />
              <img className="n-two" src="../src/assets/img/n.svg" alt="" />
            </div>
            <p className="hero-text-gsap">
              Compete and be a part of a unique clothing line inspired by the
              KULTURE X of <span className="green-text">Kortrijk</span>
            </p>
            <p className="kltr-x">
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
                    width: 6ch ;
                  }
                }

                .changing-text {
                  animation: typing 1.5s steps(6, end) infinite alternate;
                  display: inline-block;
                  overflow: hidden;
                  line-height: 0.8;
                  text-align: left;
                }`}
            </style>

            <a
              className="desktop-hidden arrow-button-white hero-cta"
              href="#about"
            >
              <img src="../src/assets/img/arrow_button.svg" alt="arrow down" />
            </a>
            <a className="mobile-hidden hero-cta" href="#about">
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
          <div className="hero-image hero-image-gsap">
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
        <div id="about" className="about">
          <div className="about-img">
            <video
              autoPlay={true}
              loop={true}
              muted={true}
              controls={false}
              playsInline={true}
              src="../src/assets/vid/3D_360.mov"
            ></video>
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

            <a href="#concept">
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

            <a href="../last-collection">
              <div className="button-secondary">
                Stories from last year
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
          <div id="concept" className="concept-items" ref={conceptItem}>
            <div className="concept-one-gsap">
              <div className="concept-item concept-one">
                <img src="../src/assets/img/one.jpg" alt="concept-item image" />
                <img src="../src/assets/img/one.svg" alt="concept-item image" />
                <div className="concept-one__text">
                  <p>#1</p>
                  <h3 className="concept-slide__title">Each year</h3>
                  <p>Turn your story into fashion</p>
                  <p className="concept-slide__text">
                    We invite you to design your own fashion collection item
                    that’s reflecting your vision on the city's culture.{" "}
                  </p>
                </div>
              </div>
            </div>
            <div className="concept-two-gsap">
              <div className="concept-item concept-two">
                <img src="../src/assets/img/two.jpg" alt="concept-item image" />
                <img src="../src/assets/img/two.svg" alt="concept-item image" />
                <div className="concept-two__text">
                  <p>#2</p>
                  <h3 className="concept-slide__title">Unique perspectives</h3>
                  <p>Your perspective is important</p>
                  <p className="concept-slide__text">
                    We invite you to design your own fashion collection item
                    that’s reflecting your vision on the city's culture.{" "}
                  </p>
                </div>
              </div>
            </div>
            <div className="concept-three-gsap">
              <div className="concept-item concept-three">
                <img
                  src="../src/assets/img/three.jpg"
                  alt="concept-item image"
                />
                <img
                  src="../src/assets/img/three.svg"
                  alt="concept-item image"
                />
                <div className="concept-three__text">
                  <p>#3</p>
                  <h3 className="concept-slide__title">Participate</h3>
                  <p>Participate, enjoy, exceed, succeed</p>
                  <p className="concept-slide__text">
                    When you participate, you receive professional guidance in
                    our workshops to tell your story through art and an
                    opportunity to print your design on a real shirt!
                  </p>
                </div>
              </div>
            </div>
            <div className="concept-four-gsap">
              <div className="concept-item concept-four">
                <img
                  src="../src/assets/img/four.jpg"
                  alt="concept-item image"
                />
                <img
                  src="../src/assets/img/four.svg"
                  alt="concept-item image"
                />
                <div className="concept-four__text">
                  <p>#4</p>
                  <h3 className="concept-slide__title">
                    Are you the next winner?
                  </h3>
                  <p>Inspire others by telling your story</p>
                  <p className="concept-slide__text">
                    We highlight 3 people every year and you get to decide who
                    wins! Winners will be showcased on our site and can sell
                    their designs.
                  </p>
                  <div className="concept-slide__extra">
                    <a href="../last-collection">Check out the last winners</a>
                    <div className=" concept-slide__profiles">
                      <a
                        className="mobile-hidden"
                        href="../last-collection/unknown"
                      >
                        <img
                          src="../src/assets/img/flava-pfp.png"
                          alt="flava"
                        />
                      </a>
                      <a
                        className="mobile-hidden"
                        href="../last-collection/biniru"
                      >
                        <img
                          src="../src/assets/img/warre-pfp.png"
                          alt="warre"
                        />
                      </a>
                      <a
                        className="mobile-hidden"
                        href="../last-collection/senju"
                      >
                        <img
                          src="../src/assets/img/senju-pfp.png"
                          alt="senju"
                        />
                      </a>
                    </div>
                    <a href="#workshops">
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
                </div>
              </div>
            </div>
          </div>
          <div id="workshops" className="workshops">
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
              <div>
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
                <a href="../workshops/request">
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
