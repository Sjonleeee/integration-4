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
  console.log(submission);
  return (
    <div>
      <h1>{submission[0].designAuthor}</h1>
      <p>{submission[0].story}</p>
      <p>{submission[0].title}</p>
      <img src={design} alt="" />
    </div>
  );
}
