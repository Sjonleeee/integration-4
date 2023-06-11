import { Link } from "react-router-dom";
import Button from "../components/Button.jsx";
import { getWorkshops, joinWorkshop } from "../js/designs.js";
import { useLoaderData } from "react-router-dom";
import React from "react";
// import styled from "styled-components";

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
    const styledButton = document.getElementById(id);
    styledButton.style.backgroundColor = "#40ff99";
    styledButton.style.color = "#101010";
    styledButton.innerHTML = `You joined!`;
    styledButton.borderstyle = "none";

    await joinWorkshop(id, newAttendees);
  };
  return (
    <div className="workshops">
      <h1>Workshops</h1>
      <h2 className="hidden">Workshops</h2>
      <svg
        className="workshops__svg"
        width="183"
        height="83"
        viewBox="0 0 183 83"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          d="M25.9311 0.00157013C54.1394 0.370716 82.2242 4.07632 110.009 8.77104C123.916 11.2556 137.804 14.1236 151.354 18.2125C158.172 20.2996 164.995 22.6612 171.342 26.0402C177.575 29.3152 185.677 35.4344 182.14 43.4656C175.051 58.8607 131.233 69.2014 114.902 72.836C96.3783 76.854 77.6171 79.6935 58.7465 81.4777C44.3928 82.6798 30.1436 83.7304 15.6947 82.3343C8.05901 81.5108 -2.65283 78.8322 0.594481 68.6335C1.91623 64.8947 4.30772 61.8186 6.39494 58.7613C10.8499 52.3629 15.4427 45.9975 15.4047 38.1273C15.3524 32.5712 13.0512 27.4789 10.3031 22.434C8.09704 18.2693 5.29191 14.4218 3.65637 9.9258C1.417 3.59361 6.54708 1.62485 11.8531 0.791916C16.5125 0.0867608 21.2289 -0.00315969 25.9264 0.00157013L25.9311 0.00157013ZM25.9311 0.00157013C20.7868 0.157752 4.69758 -0.149871 4.03196 6.3527C3.94637 7.41753 4.27444 8.51076 4.70234 9.54246C5.60093 11.6106 6.91317 13.5415 8.25869 15.4345C12.3761 21.1657 17.1543 27.1713 19.194 34.0383C22.4508 43.8915 16.7074 54.1944 11.739 62.2208C10.5313 64.2274 9.30943 66.1867 8.3728 68.0703C7.75471 69.3434 7.23649 70.4792 7.16041 71.686C7.15567 71.9415 7.19845 72.0788 7.2365 72.1403C7.95442 72.8975 8.9481 73.172 10.2033 73.5317C12.0623 74.005 14.2446 74.251 16.4364 74.393C25.4557 74.9089 34.8315 74.2416 43.9221 73.527C57.8384 72.3911 71.7263 70.6732 85.5523 68.6903C108.445 65.2165 131.609 61.3595 153.722 54.5114C158.063 53.1153 162.38 51.563 166.497 49.6558C170.277 47.8669 174.395 45.6757 176.933 42.5049C182.525 35.7042 168.333 28.7236 163.317 26.2674C146.414 18.5202 127.929 14.0431 109.748 10.1104C82.1671 4.52118 54.1157 0.418041 25.9311 0.00157013Z"
          fill="#40FF99"
        />
      </svg>

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
        <Link
          className="button-primary"
          onClick={() => {
            window.scrollTo(0, 800);
          }}
        >
          Join a workshop
        </Link>
        <Link className="button-secondary" to="../workshops/request">
          Request a workshop
        </Link>
      </div>
      <div id="workshops" className="workshops-join">
        <h2>Upcoming workshops</h2>
        {workshops.map((workshop) => (
          <div className="workshop-item" key={workshop.id}>
            <h3>{workshop.title}</h3>
            <div>
              <p>{workshop.workshopInfo}</p>
              <p>When: {workshop.workshopDate}</p>
              <p>Where: {workshop.workshopPlace}</p>
            </div>
            <button
              id={workshop.id}
              className="button-primary"
              onClick={handleClick}
            >
              {workshop.workshopAttendees}/30 Free Join Workshop
              <span className="hidden">{workshop.id}</span>
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}
