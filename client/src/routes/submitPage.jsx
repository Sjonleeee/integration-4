import { Form, useNavigate } from "react-router-dom";
import { useCallback, useState } from "react";
import { useDropzone } from "react-dropzone";
import { submitDesign } from "../js/designs";

// // Action
export const action = async ({ request }) => {
  console.log("Submit action");
  const formData = await request.formData();
  const updates = Object.fromEntries(formData);
  console.log(updates);
  const result = await submitDesign(updates, filesJSON);
  console.log(result);
  return result;
};

let filesJSON;

export default function SubmitPage() {
  const navigate = useNavigate();
  const handleSubmit = async () => {
    await submitDesign();
    navigate("/submissions");
  };
  const [files, setFiles] = useState([]);

  const onDrop = useCallback((acceptedFiles) => {
    setFiles((previousFiles) => [
      ...previousFiles,
      ...acceptedFiles.map((file) =>
        Object.assign(file, {
          preview: URL.createObjectURL(file),
        })
      ),
    ]);
  });

  const { getRootProps, getInputProps, isDragActive } = useDropzone({ onDrop });

  filesJSON = JSON.stringify(files);
  console.log(filesJSON);

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
          <div {...getRootProps()}>
            <input name="file" {...getInputProps()} />
            {isDragActive ? (
              <p>Drop the files here ...</p>
            ) : (
              <p>Drag 'n' drop some files here, or click to select files</p>
            )}
          </div>

          <ul>
            {files.map((file) => (
              <>
                <li key={file.id}>{file.name}</li>
                <img src={file.preview} alt="preview" width={100} />
              </>
            ))}
          </ul>
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
