import { useLoaderData, Link } from "react-router-dom";
import { getSubmission } from "../js/designs.js";
import Submission from "../components/Submission.jsx";
import React, { useState } from "react";

export async function loader({ params: { id } }) {
  console.log("This is the root loader");
  const result = await getSubmission(id);
  return result;
}

export default function SubmissionPage() {
  const submission = useLoaderData();
  const design = JSON.parse(submission[0].designLinks);

  const handleLike = async (e) => {
    const idPartOne = e.target.innerHTML;
    const splitId = idPartOne.split(">");
    const firstSplit = splitId[0].split("<");
    const secondSplit = splitId[1].split("<");
    const amountLikes = Number(firstSplit[0]);
    console.log(amountLikes, "amountLikes");
    const updatedLikes = amountLikes + 1;
    console.log(updatedLikes, "updatedLikes");
    const button = document.getElementById(e.target.id);
    button.style.backgroundColor = "#40ff99";
    button.innerHTML =
      updatedLikes + `<img src="../src/assets/img/like.svg" alt="" />`;
    const id = Number(secondSplit[0]);
    console.log(id, "id");
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
          {submission.likeAmount}1<div className="hidden">{submission.id}</div>
        </button>
      </div>
      <h1 className="submission-detail__title">{submission[0].title}</h1>
      <p className="submission-detail__author">
        submitted by <span>{submission[0].designAuthor}</span>
      </p>
      <p className="submission-detail__date">{submission[0].dateCreated}</p>
      <img className="submission-detail__image" src={design} alt="" />
      <p className="submission-detail__story">{submission[0].story}</p>
    </div>
  );
}
