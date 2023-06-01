import { Outlet } from 'react-router-dom'
import Navbar from '../routes/nav.jsx'

export default function Root() {
  return (
    <>
      <Navbar />
      <Outlet />
    </>
  )
}
