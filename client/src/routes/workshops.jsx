import { Link } from "react-router-dom";
import Button from "../components/Button.jsx";
import { getWorkshops, joinWorkshop } from "../js/designs.js";
import { useLoaderData } from "react-router-dom";
import React from "react";

export async function loader() {
  console.log("This is the root loader");
  const result = await getWorkshops();
  return result;
}

export async function action({ params: { id }, attendees }) {
  console.log("This is the join action");
  const result = await joinWorkshop(id, attendees);
  return result;
}

export default function Workshops() {
  const workshops = useLoaderData();

  const handleClick = async (e) => {
    const number = e.target.innerHTML;
    console.log(number);
    const splitNumber = number.split("/");
    const attendees = Number(splitNumber[0]);
    console.log(attendees);
    const newAttendees = attendees - 1;
    const idsplit = number.split(">");
    const idsplit2 = idsplit[1].split("<");
    const id = Number(idsplit2[0]);
    console.log(id);
    await joinWorkshop(id, newAttendees);
  };
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
        <Link to="../workshops/request">Request a workshop</Link>
      </div>
      <div className="workshops-join">
        {workshops.map((workshop) => (
          <div key={workshop.id}>
            <h2>{workshop.title}</h2>
            <p>{workshop.workshopInfo}</p>
            <p>{workshop.workshopDate}</p>
            <p>{workshop.workshopPlace}</p>
            <button onClick={handleClick}>
              {workshop.workshopAttendees}/30 Free Join Workshop
              <span className="hidden">{workshop.id}</span>
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}
