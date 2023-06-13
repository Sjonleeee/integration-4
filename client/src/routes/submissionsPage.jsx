import { useLoaderData } from "react-router-dom";
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
    // setLikeCount(likeCount + 1);
    // likeAmount = likeCount;
    const idPartOne = e.target.innerHTML;
    // console.log(idPartOne);

    const splitId = idPartOne.split(">");
    // console.log(splitId);

    const firstSplit = splitId[0].split("<");
    // console.log(firstSplit[0]);

    const secondSplit = splitId[1].split("<");
    // console.log(secondSplit[0]);

    const amountLikes = Number(firstSplit[0]);
    console.log(amountLikes, "amountLikes");

    const updatedLikes = amountLikes + 1;
    console.log(updatedLikes, "updatedLikes");

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
      <div className="submissions">
        {submissions.map((submission) => (
          <div className="submission" key={submission.id}>
            <p className="hidden">{submission.id}</p>
            <div className="submission__under">
              <Submission
                designLinks={submission.designLinks}
                title={submission.title}
                designAuthor={submission.designAuthor}
                story={submission.story}
              />
              <button className="submission__like" onClick={handleLike}>
                {submission.likeAmount}
                <div className="hidden">{submission.id}</div>
              </button>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
