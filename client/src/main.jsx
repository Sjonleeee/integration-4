import React from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Root from "./layouts/rootLayout";
import Submissions, {
  loader as submissionsLoader,
  action as likeAction,
} from "./routes/submissionsPage";
import Requirements from "./routes/requirements";
import Contact from "./routes/contact";
import Workshops, { loader as workshopsLoader } from "./routes/workshops";
import Request, { action as requestAction } from "./routes/workshopRequest";
import SubmitPage, { action as submitAction } from "./routes/submitPage";
import LastCollection from "./routes/lastCollection";
import Biniru from "./routes/articles/biniru";
import Unknown from "./routes/articles/unknown";
import Senju from "./routes/articles/senju";
import Error from "./routes/error";
import Confirmation from "./routes/confirmation";
import Home from "./routes/home";
import "./index.css";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    errorElement: <Error />,
    children: [
      {
        index: true,
        element: <Home />,
      },
      {
        path: "/submit",
        element: <SubmitPage />,
        action: submitAction,
      },
      {
        path: "/submissions",
        element: <Submissions />,
        loader: submissionsLoader,
        action: likeAction,
      },
      {
        path: "/requirements",
        element: <Requirements />,
      },
      {
        path: "/contact",
        element: <Contact />,
      },
      {
        path: "/workshops",
        element: <Workshops />,
        loader: workshopsLoader,
      },
      {
        path: "/workshops/request",
        element: <Request />,
        action: requestAction,
      },
      {
        path: "/workshops/request/confirmation",
        element: <Confirmation />,
      },
      {
        path: "/last-collection",
        element: <LastCollection />,
      },
      {
        path: "/last-collection/biniru",
        element: <Biniru />,
      },
      {
        path: "/last-collection/unknown",
        element: <Unknown />,
      },
      {
        path: "/last-collection/senju",
        element: <Senju />,
      },
    ],
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
