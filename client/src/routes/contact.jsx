import { Link } from "react-router-dom";

export default function Contact() {
  return (
    <div className="contact">
      <h1>Contact</h1>
      <svg
        width="371"
        height="152"
        viewBox="0 0 371 152"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          d="M369.847 39.373C375.151 73.482 313.512 106.361 261.408 124.134C188.93 148.896 89.6291 162.26 30.1996 138.997C5.60859 129.19 -5.96752 111.409 3.6395 91.5365C9.49253 79.1629 22.5487 67.0239 38.162 56.8819C91.4155 22.945 168.525 4.80924 237.666 0.979539C292.655 -1.88644 362.082 5.74473 369.837 39.3751L369.847 39.373ZM369.847 39.373C361.709 5.73669 292.131 -0.402026 236.928 4.73715C171.606 10.9845 99.9541 30.9825 52.1456 63.1566C33.6043 75.9165 19.5479 91.8574 22.4093 106.351C25.1298 120.871 44.0853 130.46 66.0532 135.417C122.391 147.545 196.383 139.454 259.344 120.96C312.501 105.203 374.806 73.6162 369.847 39.373Z"
          fill="white"
        />
      </svg>

      <p className="contact-info-title">
        Let's get to know <span>each other</span>
      </p>
      <div className="contact-info">
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
