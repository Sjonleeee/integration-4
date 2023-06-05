import { useLoaderData } from "react-router-dom";
import { getSubmissions } from "../js/designs.js";

export async function loader() {
  console.log("This is the root loader");
  const result = await getSubmissions();
  return result;
}

export default function Submissions() {
  const submissions = useLoaderData();
  console.log(submissions);
  const designLinks = JSON.parse(submissions[0].designLinks);
  return (
    <div>
      <h1>SubmitPage</h1>
      {submissions.map((submission) => (
        <div key={submission.id}>
          <h2>{submission.title}</h2>
          <p>{submission.story}</p>
          {designLinks.map((link) => (
            <img key={link.id} src={link.preview} alt="preview" width={100} />
          ))}
        </div>
      ))}
    </div>
  );
}
