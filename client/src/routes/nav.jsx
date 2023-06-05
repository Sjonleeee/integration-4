import { NavLink } from "react-router-dom";

export default function Navbar() {
  return (
    <div className="navigation">
      <ul>
        <NavLink to="/">
          <li>Home</li>
        </NavLink>

        <NavLink to="../requirements">
          <li>Requirements</li>
        </NavLink>

        <NavLink to="../submit">
          <li>Submit</li>
        </NavLink>

        <NavLink to="../submissions">
          <li>Submissions</li>
        </NavLink>

        <NavLink to="../last-collection">
          <li>Last collection</li>
        </NavLink>

        <NavLink to="../contact">
          <li>Contact</li>
        </NavLink>
      </ul>
    </div>
  );
}
