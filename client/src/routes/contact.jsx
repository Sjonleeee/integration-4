import { Link } from "react-router-dom";

export default function Contact() {
  return (
    <div className="contact">
      <h1>Contact</h1>
      <div className="contact-info">
        <p>
          Let's get to know <span>eachother</span>
        </p>
        <div>
          <p>e-mail:</p>
          <a href="mailto:contact@kltrx.be"></a>
        </div>
        <div>
          <p>our socials:</p>
          <ul>
            <li>
              <a target="_blank" rel="noreferrer" href="https://instagram.com">
                instagram
              </a>
            </li>
            <li>
              <a target="_blank" rel="noreferrer" href="https://facebook.com">
                facebook
              </a>
            </li>
            <li>
              <a target="_blank" rel="noreferrer" href="https://tiktok.com">
                tiktok
              </a>
            </li>
            <li>
              <a target="_blank" rel="noreferrer" href="https://bereal.com">
                bereal
              </a>
            </li>
          </ul>
        </div>
      </div>
      <div className="contact-partners">
        <p>
          Check out our <span>partners</span>
        </p>
        <div>
          <Link to="tranzit.be">
            <img src="" alt="" />
          </Link>
          <Link to="destroate.be">
            <img src="" alt="" />
          </Link>
        </div>
      </div>
    </div>
  );
}
