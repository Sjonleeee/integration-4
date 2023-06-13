import { Link } from "react-router-dom";
import { useState } from "react";

export default function Requirements() {
  const [step, setStep] = useState(1);
  return (
    <div className="requirements">
      <h1 className="hidden">Requirements</h1>
      <div className="requirements-hero">
        <div className="requirements-hero-title">
          <h2 className="title">This year's theme</h2>
          <p>Neon</p>
          <p>Revolution</p>
          <img src="../src/assets/img/submissions.svg" alt="" />
        </div>
        <div className="requirements-hero-text">
          <p>
            KLTR X is more than just a design competition, it is a celebration
            of youthful creativity and expression. Become a part of the next
            generation to share their story, visualise the story of Kortrijk and
            leave your mark in the world of design
          </p>
          {/* <button></button>
            <button></button> */}
        </div>
      </div>
      <div className="requirements-info">
        <div className="requirements-info-text">
          <img src="../src/assets/img/requirements.svg" alt="" />
          <div>
            <h2>
              Our <span className="green-text">requirements</span>
            </h2>
            <p>Unlocking success through requirements</p>
            <p>
              Before you start telling your story. We need to go over some
              requirements that your design must meet when you submit it.
            </p>
          </div>
          {/* <button></button> */}
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
              Tell us your story about Kortrijk's unique culture. What makes
              this city special to you? Share your experiences, traditions, and
              the vibrant essence that sets Kortrijk apart. Let your words paint
              a picture of the captivating spirit that will guide your design
              journey.
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
              <img src="../src/assets/img/arrow.svg" alt=" arrow" />
            </div>
          </div>
          <div className="requirements-step-deco requirements-steps-one__deco">
            <img src="../src/assets/img/requirements.jpg" alt="image" />
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
              Now it's time to transform your story into a design. Let your
              creativity flow as you visually express the culture of Kortrijk.
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
              <img src="../src/assets/img/arrow_left.svg" alt=" arrow" />
            </div>
            <div
              className="arrow-button-black"
              onClick={() => {
                console.log("click");
                setStep(3);
              }}
            >
              <img src="../src/assets/img/arrow.svg" alt=" arrow" />
            </div>
          </div>
          <div className="requirements-step-deco requirements-steps-two__deco">
            <img src="" alt="" />
            {/* svg */}
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
              Download mockups to showcase your designs on shirts. Bring your
              creations to life by visualizing them on different shirt styles.
              Explore options and get ready to see your designs come alive on
              wearable art.
            </p>
            <div className="step-process step-process__three"></div>
            <Link to={"/mockupdownloads"}>Download our mockups</Link>
          </div>
          <div className="requirements-step-deco requirements-steps-three__deco">
            <img src="" alt="" />
            {/* svg */}
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
              Ready to share your masterpiece? Submit your design now! Let your
              creativity shine as you contribute to Kortrijk's vibrant culture.
              We're excited to see and showcase your incredible artwork.
            </p>
          </div>
          <div className="step-process step-process__four"></div>
          <div className="requirements-step-deco requirements-steps-four__deco">
            <img src="" alt="" />
            {/* svg */}
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
            width: calc( ${step}*2.5rem);
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
