import { Link } from "react-router-dom";

export default function Requirements() {
  return (
    <div className="requirements">
      <h1>Requirements</h1>
      <div className="requirements-hero">
        <div className="requirements-hero-title">
          <h2>This year's theme</h2>
          <p>Neon</p>
          <p>Revolution</p>
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
          <h2>
            Our <span>requirements</span>
          </h2>
          <p>Unlocking success through requirements</p>
          <p>
            Before you start telling your story. We need to go over some
            requirements that your design must meet when you submit it.
          </p>
          {/* <button></button> */}
        </div>
        <div className="requirements-info-deco">
          <img src="" alt="" />
          {/* svg */}
        </div>
      </div>
      <div className="requirements-steps">
        <h2 className="hidden">Steps</h2>
        <div className="requirements-steps-one">
          <div className="requirements-steps-one__text">
            <h3>
              write <br />
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
            <div className="step-process step-process__one"></div>
            {/* <button></button> */}
          </div>
          <div className="requirements-steps-one__deco">
            <img src="" alt="" />
            {/* svg */}
          </div>
        </div>
        <div className="requirements-steps-two">
          <div className="requirements-steps-two__text">
            <h3>
              Make <br />
              your design
            </h3>
            <p>#2 Your story into a design!</p>
            <p>
              Now it's time to transform your story into a design. Let your
              creativity flow as you visually express the culture of Kortrijk.
            </p>
            <Link to={"/workshops"}>Join Culture Hubs for Workshops</Link>
            <div className="step-process step-process__two"></div>
            {/* <button></button> */}
            {/* <button></button> */}
          </div>
          <div className="requirements-steps-two__deco">
            <img src="" alt="" />
            {/* svg */}
          </div>
        </div>
        <div className="requirements-steps-three">
          <div className="requirements-steps-three__text">
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
            {/* <button></button> */}
            {/* <button></button> */}
          </div>
          <Link to={"/mockupdownloads"}>Download our mockups</Link>
          <div className="requirements-steps-three__deco">
            <img src="" alt="" />
            {/* svg */}
          </div>
        </div>
        <div className="requirements-steps-four">
          <div className="requirements-steps-four__text">
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
            <div className="step-process step-process__four"></div>
            {/* <button></button> */}
            {/* <button>Submit now</button> */}
          </div>
          <div className="requirements-steps-four__deco">
            <img src="" alt="" />
            {/* svg */}
          </div>
        </div>
      </div>
    </div>
  );
}
