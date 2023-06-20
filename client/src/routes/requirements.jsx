import { Link } from "react-router-dom";
import { useState, useRef, useLayoutEffect } from "react";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
gsap.registerPlugin(ScrollTrigger);

export default function Requirements() {
  const [step, setStep] = useState(1);
  const title = useRef(null);

  useLayoutEffect(() => {
    let hero = gsap.context(() => {
      gsap.fromTo(
        ".neon",
        { x: -200, opacity: 0 },
        { x: 0, delay: 1, opacity: 1, duration: 1 }
      );
      gsap.fromTo(
        ".circle",
        { opacity: 0, scale: 0, rotation: 120 },
        {
          opacity: 1,
          scale: 1,
          rotation: 0,
          duration: 1,
          delay: 1.5,
          ease: "power2",
        }
      );
      gsap.fromTo(
        ".title",
        { y: -100 },
        { y: 0, duration: 0.5, ease: "power2" }
      );
      gsap.fromTo(
        ".revolution",
        { y: +100, opacity: 0 },
        { y: 0, opacity: 1, duration: 1, delay: 1.5, ease: "power2" }
      );
      gsap.fromTo(
        ".requirements-hero-text",
        { y: +100, opacity: 0 },
        { y: 0, opacity: 1, duration: 1, delay: 2, ease: "power2" }
      );
      gsap.fromTo(
        ".requirements-hero-buttons",
        { y: +100, opacity: 0 },
        { y: 0, opacity: 1, duration: 1, delay: 2.5, ease: "power2" }
      );
      return () => {
        hero.revert();
      };
    });
  });

  return (
    <div className="requirements">
      <h1 className="hidden">Requirements</h1>
      <div className="requirements-hero">
        <div ref={title} className="requirements-hero-title">
          <h2 className="title">This year's theme</h2>
          <p className="neon">Neon</p>
          <p className="revolution">Revolution</p>
          <img
            className="circle"
            src="../../assets/img/submissions.svg"
            alt=""
          />
        </div>
        <div className="requirements-hero-text">
          <p>
            KLTR X is<span className="medium"> more than</span> just a{" "}
            <span className="medium">design competition,</span> it is a
            <span className="medium">
              {" "}
              celebration of youthful creativity and expression.
            </span>{" "}
            <span className="medium">Become a part</span> of the next generation
            to share their story, visualise the story of Kortrijk and leave your
            mark in the world of design
          </p>
        </div>
        <div className="requirements-hero-buttons">
          <a href="#requirements-info">
            <div className="button-primary">
              Start designing
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
              Workshops
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
      <div id="requirements-info" className="requirements-info">
        <div className="requirements-info-text">
          <img src="../../assets/img/requirements.svg" alt="" />
          <div>
            <h2>
              Our <span className="green-text">requirements</span>
            </h2>
            <p>Unlocking success through requirements</p>
            <p>
              <span className="medium">Before you start</span> telling your
              story. We need to go over some requirements that your design must
              meet when you submit it.
            </p>
          </div>
          <a href="#steps">
            <div className="button-secondary">
              Check out the steps
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
        <div></div>
      </div>
      <div className="requirements-steps" id="steps">
        <h2 className="hidden">Steps</h2>
        <div className="requirements-step requirements-steps-one">
          <div className="requirements-step-text requirements-steps-one__text">
            <h3>
              <span>write</span> <br />
              your story
            </h3>
            <p>#1 Your story matters !</p>
            <p>
              <span className="medium">Tell us your story</span> about
              Kortrijk's unique culture. What makes this city special to you?
              <span className="medium">Share your experiences, traditions</span>
              , and the <span className="medium">vibrant essence</span> that
              sets Kortrijk apart. Let your words paint a picture of the
              captivating spirit that will guide your design journey.
            </p>
          </div>
          <div className="step-process step-process__one">
            <div></div>
            <div
              className="arrow-button-black-hor"
              onClick={() => {
                console.log("click");
                setStep(2);
              }}
            >
              <img src="../../assets/img/arrow.svg" alt=" arrow" />
            </div>
          </div>
          <div className="requirements-step-deco requirements-steps-one__deco">
            <img src="../../assets/img/requirements-one.jpg" alt="image" />
            <img src="../../assets/img/requirements-icon.svg" alt="svg" />
          </div>
        </div>
        <div className="requirements-step requirements-steps-two">
          <div className="requirements-step-text requirements-steps-two__text">
            <h3>
              <span>Make</span> <br />
              your design
            </h3>
            <p>#2 Your story into a design!</p>
            <p>
              Now it's time to{" "}
              <span className="medium">transform your story into a design</span>
              . Let your creativity flow as you{" "}
              <span className="medium">visually express the culture</span> of
              Kortrijk.
            </p>
            <Link to={"/workshops"}>Join Culture Hubs for Workshops</Link>
          </div>
          <div className="step-process step-process__two">
            <div></div>
            <div
              className="arrow-button-black-hor"
              onClick={() => {
                console.log("click");
                setStep(1);
              }}
            >
              <img src="../../assets/img/arrow_left.svg" alt=" arrow" />
            </div>
            <div
              className="arrow-button-black-hor"
              onClick={() => {
                console.log("click");
                setStep(3);
              }}
            >
              <img src="../../assets/img/arrow.svg" alt=" arrow" />
            </div>
          </div>
          <div className="requirements-step-deco requirements-steps-two__deco">
            <img src="../../assets/img/requirements-two.jpg" alt="picture" />
            <img src="../../assets/img/requirements-icon.svg" alt="svg" />
          </div>
        </div>
        <div className="requirements-step requirements-steps-three">
          <div className="requirements-step-text requirements-steps-three__text">
            <h3>
              download <br />
              the mockups
            </h3>
            <p>#3 Represent your story on T-shirts!</p>
            <p>
              <span className="medium">Download mockups</span> to showcase your
              designs on shirts. Bring your creations to life by visualizing
              them on different shirt styles. Explore options and get ready to
              <span className="medium">see your designs come alive</span> on
              wearable art.
            </p>

            <a
              href="../../assets/downloads/mockups_download.ai"
              download={true}
            >
              Download our mockups
            </a>
          </div>
          <div className="step-process step-process__three">
            <div></div>
            <div
              className="arrow-button-black-hor"
              onClick={() => {
                console.log("click");
                setStep(2);
              }}
            >
              <img src="../../assets/img/arrow_left.svg" alt=" arrow" />
            </div>
            <div
              className="arrow-button-black-hor"
              onClick={() => {
                console.log("click");
                setStep(4);
              }}
            >
              <img src="../../assets/img/arrow.svg" alt=" arrow" />
            </div>
          </div>
          <div className="requirements-step-deco requirements-steps-three__deco">
            <img
              src="../../assets/img/requirements-three.jpg"
              alt="descriptive picture"
            />
            <img src="../../assets/img/requirements-icon.svg" alt="svg" />
          </div>
        </div>
        <div className="requirements-step requirements-steps-four">
          <div className="requirements-step-text requirements-steps-four__text">
            <h3>
              submit <br />
              your design
            </h3>
            <p>#4 Inspire the world with your submission!</p>
            <p>
              Ready to share your masterpiece?{" "}
              <span className="medium">Submit your design now!</span> Let your
              creativity shine as you contribute to Kortrijk's vibrant culture.
              We're excited to see and showcase your incredible artwork.
            </p>
          </div>
          <div className="step-process step-process__four"></div>
          <div className="requirements-step-deco requirements-steps-four__deco">
            <img
              src="../../assets/img/requirements-four.jpg"
              alt="descriptive pic"
            />
            <img src="../../assets/img/requirements-icon.svg" alt="svg" />
          </div>
          <div className="step-process step-process__three">
            <div></div>
            <div
              className="arrow-button-black-hor"
              onClick={() => {
                console.log("click");
                setStep(3);
              }}
            >
              <img src="../../assets/img/arrow_left.svg" alt=" arrow" />
            </div>
            <div className="arrow-button-black-hor">
              <a href="../submit">Submit your design</a>
            </div>
          </div>
        </div>
        <style>
          {`
          .requirements-steps {
            transform: translateX(-${step - 1}00vw);
            flex-direction: row;
            transition: transform 0.5s ease-in-out;
          }
          


          .step-process div:nth-child(1)::before {
            content: "";
            display: block;
            position: relative;
            width: calc( ${step}*1.5rem);
            background-color: var(--color-green);
            height: 1rem;
            border-radius: 1rem;
            transition: width 0.5s ease-in-out;
          }
          `}
        </style>
      </div>
    </div>
  );
}
