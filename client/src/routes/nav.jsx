import { NavLink } from 'react-router-dom'

export default function Navbar() {
  return (
    <div className="navlink">
      <ul>
        <NavLink to="/">
          <li>Home</li>
        </NavLink>

        <NavLink to="">
          <li>About</li>
        </NavLink>

        <NavLink to="">
          <li>Test</li>
        </NavLink>
      </ul>
    </div>
  )
}
