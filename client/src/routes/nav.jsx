import { NavLink } from 'react-router-dom'

export default function Navbar() {
  return (
    <div className="navlink">
      <ul>
        <NavLink to="/">
          <li>Home</li>
        </NavLink>

        <NavLink to="">
          <li>Requirements</li>
        </NavLink>

        <NavLink to="">
          <li>Submit</li>
        </NavLink>

        <NavLink to="">
          <li>Submissions</li>
        </NavLink>

        <NavLink to="">
          <li>Last collection</li>
        </NavLink>

        <NavLink to="">
          <li>Contact</li>
        </NavLink>
      </ul>
    </div>
  )
}
