import React from 'react'
import ReactDOM from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import Root from './layouts/rootLayout'
import LastCollection, {
  loader as lastCollectionLoader,
} from './routes/lastCollection'
import Submissions, {
  loader as submissionsLoader,
} from './routes/submissionsPage'
import SubmitPage, { action as submitAction } from './routes/submitPage'
import Home from './routes/home'

import './index.css'

const router = createBrowserRouter([
  {
    path: '/',
    element: <Root />,
    children: [
      {
        index: true,
        element: <Home />,
      },
      {
        path: '/submit',
        element: <SubmitPage />,
        action: submitAction,
      },
      {
        path: '/submissions',
        element: <Submissions />,
        loader: submissionsLoader,
      },
      {
        path: '/lastCollection',
        element: <LastCollection />,
        loader: lastCollectionLoader,
      },
    ],
  },
])

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
)
