import { useLoaderData, Link } from "react-router-dom";
import { getSubmission, addLike } from "../js/designs.js";
import Submission from "../components/Submission.jsx";
import React, { useState, useRef } from "react";

export async function loader({ params: { id } }) {
  console.log("This is the root loader");
  const result = await getSubmission(id);
  return result;
}

export async function action({ params: { id }, likeAmount }) {
  console.log("This is the like action");
  console.log(id);
  const result = await addLike(id, likeAmount);
  return result;
}

export default function SubmissionPage() {
  const submission = useLoaderData();
  const [state, setState] = useState(0);
  const [likeCount, setLikeCount] = useState(submission[0].likeAmount);

  const handleLike = async (e) => {
    const id = submission[0].id;
    const updatedLikes = submission[0].likeAmount + 1;
    setState(1);
    setLikeCount(updatedLikes);
    await addLike(id, updatedLikes);
  };

  return (
    <div className="submission-detail">
      <div className="submission-detail__actions">
        <a href="../submissions">
          <div className="arrow-button-black-hor">
            <img src="../src/assets/img/arrow_left.svg" alt=" arrow" />
          </div>
        </a>
        <button
          className="submission__like"
          id={submission.id}
          onClick={handleLike}
        >
          <img src="../src/assets/img/like.svg" alt="" />
          {likeCount}
          <div className="hidden">{submission.id}</div>
        </button>
      </div>
      <h1 className="submission-detail__title">{submission[0].title}</h1>
      <p className="submission-detail__author">
        submitted by <span>{submission[0].designAuthor}</span>
      </p>
      <p className="submission-detail__date">{submission[0].dateCreated}</p>
      <img
        className="submission-detail__image"
        src={submission[0].tshirtUrl}
        alt=""
      />
      <p className="submission-detail__story">{submission[0].story}</p>
      <style>
        {`
            .submission-detail__actions button{
                background-color: ${state === 1 ? "#40ff99" : "#fff"};
                color: var(--color-black)
            }
            `}
      </style>
    </div>
  );
}
