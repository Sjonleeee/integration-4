import { useLoaderData, Link } from "react-router-dom";
import { addLike, getSubmissions } from "../js/designs.js";
import Submission from "../components/Submission.jsx";
import React, { useState } from "react";

let likeAmount;

export async function loader() {
  console.log("This is the root loader");
  const result = await getSubmissions();
  return result;
}

export async function action({ params: { id }, likeAmount }) {
  console.log("This is the like action");
  const result = await addLike(id, likeAmount);
  return result;
}

export default function Submissions() {
  const submissions = useLoaderData();
  // const [likeCount, setLikeCount] = useState(likeAmount);

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
      updatedLikes + `<img src="../../assets/img/like.svg" alt="" />`;
    const id = Number(secondSplit[0]);
    console.log(id, "id");
    await addLike(id, updatedLikes);
  };
  console.log(submissions);
  return (
    <div>
      <div className="banner">
        <h1 className="banner__name">Submissions</h1>
      </div>
      <div className="submissions-sort"></div>
      <div className="submissions-sort"></div>
      <div className="submissions">
        {submissions.map((submission) => (
          <div className="submission" key={submission.id}>
            <p className="hidden">{submission.id}</p>
            <Submission
              designLinks={submission.tshirtUrl}
              title={submission.title}
              designAuthor={submission.designAuthor}
              story={submission.story}
              datecreated={submission.dateCreated}
              id={submission.id}
            />
            <button
              className="submission__like"
              id={submission.id}
              onClick={handleLike}
            >
              {submission.likeAmount}
              <div className="hidden">{submission.id}</div>
              <img src="../../assets/img/like.svg" alt="" />
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}
