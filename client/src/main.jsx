import React from 'react'
import ReactDOM from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import Root from './layouts/rootLayout'
import './index.css'
import SubmitPage, { loader as submitPageLoader } from './routes/submitPage'

const router = createBrowserRouter([
  {
    path: '/',
    element: <Root />,
    children: [
      {
        index: true,
        element: <h1>Home</h1>,
      },
      {
        path: 'submitPage',
        element: <SubmitPage />,
        loader: submitPageLoader,
      },
    ],
  },
])

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
)
