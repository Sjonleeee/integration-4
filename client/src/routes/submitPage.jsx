// import Dropzone from "../components/dropzone";

import { Form, useNavigate } from "react-router-dom";

import { submitDesign } from "../js/designs";

// // Action
export const action = async ({ request }) => {
  console.log("Submit action");
  const formData = await request.formData();
  const updates = Object.fromEntries(formData);
  console.log(updates);
  const result = await submitDesign(updates);
  console.log(result);
  return result;
};

export default function SubmitPage() {
  const navigate = useNavigate();
  const handleSubmit = async () => {
    await submitDesign();
    // navigate("/submissions");
  };

  return (
    <section className="submission">
      <div className="submission-design">
        <h1 className="hidden">Design submission</h1>
        <p>Now you</p>
        {/* SVG */}
        <p>
          Submit your design and share your unique perspective on Kortrijk's
          culture. Let your creativity take flight, for this is where your
          vision becomes part of the fabric that weaves our city's story.{" "}
        </p>
      </div>
      <div className="submission-drop">
        <h2>Drag and drop your design underneath</h2>
        <p>Pssst, upload your front and back design in JPG</p>
        <Form method="post" onSubmit={handleSubmit}>
          <label htmlFor="designAuthor">Your name</label>
          <input type="text" name="designAuthor" id="designAuthor" />
          <label htmlFor="title">Title</label>
          <input type="text" name="title" id="title" />
          {/* <label htmlFor="email">E-mail</label>
          <input type="email" name="email" id="email" /> */}
          <label htmlFor="story">Story</label>
          <textarea name="story" id="story" cols="30" rows="10"></textarea>
          <button type="submit">Submit your design</button>
        </Form>
      </div>
    </section>
  );
}
