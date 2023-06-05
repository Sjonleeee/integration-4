import React from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Root from "./layouts/rootLayout";
import "./index.css";
import Submissions, {
  loader as submissionsLoader,
} from "./routes/submissionsPage";
import SubmitPage, { loader as submitPageLoader } from "./routes/submitPage";
import Home from "./routes/home";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    children: [
      {
        index: true,
        element: <Home />,
      },
      {
        path: "/submit",
        element: <SubmitPage />,
        loader: submitPageLoader,
      },
      {
        path: "/submissions",
        element: <Submissions />,
        loader: submissionsLoader,
      },
    ],
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
