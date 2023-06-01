import { NavLink } from 'react-router-dom'

export default function Navbar() {
  return (
    <div className="navlink">
      <NavLink to="/home" activeClassName="active">
        Home
      </NavLink>
      <NavLink to="/about" activeClassName="active">
        About
      </NavLink>
      <NavLink to="/contact" activeClassName="active">
        Contact
      </NavLink>
    </div>
  )
}
