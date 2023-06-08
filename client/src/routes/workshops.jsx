import { Link } from "react-router-dom";
import Button from "../components/Button.jsx";
export default function Workshops() {
  return (
    <div className="workshops">
      <h1>Workshops</h1>
      <div className="workshops-info">
        <p>
          Learn new ways to tell a story, create a design, find new places to
          get inspired and share your creations with others! <br />
          <br /> Just a few things we do during our workshops at Tranzit or The
          Palace. <br />
          <br />
          Together we can create bigger and better stories, tell them in a more
          captivating way and mold them into a fantastic design! <br />
          <br /> Join a workshop and get inspired! Want to request a workshop at
          your school or youth movement? Click the button below!
        </p>
        <Link>
          <Button>Request a workshop</Button>
        </Link>
      </div>
      <div className="workshops-join"></div>
    </div>
  );
}
