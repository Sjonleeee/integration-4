import { useLoaderData } from "react-router-dom";
import { getSubmissions } from "../js/designs.js";
import Submission from "../components/Submission.jsx";

export async function loader() {
  console.log("This is the root loader");
  const result = await getSubmissions();
  return result;
}

export default function Submissions() {
  const submissions = useLoaderData();
  console.log(submissions);
  return (
    <div>
      <h1>SubmitPage</h1>
      {submissions.map((submission) => (
        <div key={submission.id}>
          <Submission
            title={submission.title}
            designAuthor={submission.designAuthor}
            story={submission.story}
            designLinks={submission.designLinks}
          />
        </div>
      ))}
    </div>
  );
}
